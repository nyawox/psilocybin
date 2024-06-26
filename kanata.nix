{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  defCfg = ''
    ${lib.optionalString (cfg.magic.timeout != 0) "rapid-event-delay " + toString cfg.rapidEventDelay}
    ${lib.optionalString (cfg.magic.timeout != 0) "sequence-timeout " + toString cfg.magic.timeout}
    ${lib.optionalString cfg.magic.enable "sequence-always-on true"}
    ${lib.optionalString (cfg.magic.mode != "") "sequence-input-mode " + cfg.magic.mode}
    ${lib.optionalString (cfg.extraDefCfg != "") cfg.extraDefCfg}
  '';
  ruleTemplate = {
    name,
    inputs,
    outputs,
  }: ''
    (t! seq ${name} (${inputs}) (macro ${outputs}))
  '';
  rules = lib.concatMapStringsSep "\n" ruleTemplate cfg.magic.rules;
  rptRuleTemplate = {
    name,
    inputs,
    outputs,
  }: ''
    (t! seq ${name} (${inputs}) (macro bspc ${outputs}))
  '';
  rptRules = lib.concatMapStringsSep "\n" rptRuleTemplate cfg.magic.rptRules;

  # S-9 -> (
  # S-' -> "
  # S-; -> :
  # S-. -> <
  # S-[ -> {
  startingKeys = ["spc" "tab" ";" "/" "S-;" "S-." "S-9" "S-[" "S-'" "S-ret" "ret"];

  mkWordStartingRules = startingKey:
    lib.concatMapStringsSep "\n" (rule:
      ruleTemplate {
        name = "${rule.name}-${startingKey}";
        inputs = "${startingKey} ${rule.inputs}";
        outputs =
          if (startingKey == "tab" && cfg.magic.includeTab != true) || (startingKey == "ret" && cfg.magic.includeReturn != true) || (startingKey == "/" && cfg.magic.includeSlash != true)
          then rule.outputs
          else "${startingKey} ${rule.outputs}";
      })
    cfg.magic.wordStartingRules;

  mkWordStartingRptRules = startingKey:
    lib.concatMapStringsSep "\n" (rule:
      rptRuleTemplate {
        name = "${rule.name}-${startingKey}-rpt";
        inputs = "${startingKey} ${rule.inputs}";
        outputs =
          if (startingKey == "tab" && cfg.magic.includeTab != true) || (startingKey == "ret" && cfg.magic.includeReturn != true) || (startingKey == "/" && cfg.magic.includeSlash != true)
          then rule.outputs
          else "${startingKey} ${rule.outputs}";
      })
    cfg.magic.wordStartingRptRules;

  wordStartingRules = lib.concatStringsSep "\n" (map mkWordStartingRules startingKeys);
  wordStartingRptRules = lib.concatStringsSep "\n" (map mkWordStartingRptRules startingKeys);

  magic = ''
    (deftemplate seq (vk-name input-keys output-action)
      (deffakekeys $vk-name $output-action)
      (defseq $vk-name $input-keys)
    )

    ${wordStartingRules}
    ${wordStartingRptRules}
    ${rules}
    ${rptRules}
  '';
  cfg = config.psilocybin;
in {
  imports = [./layout];
  options = {
    psilocybin = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable psilocybin
        '';
      };
      devices = mkOption {
        type = types.listOf types.str;
        default = [];
        description = ''
          An empty list, the default value, lets kanata detect which input devices are keyboards and intercept them all.
        '';
      };
      magic = {
        enable = mkOption {
          type = types.bool;
          default = true;
        };
        rules = mkOption {
          type = types.listOf types.attrs;
          example = literalExpression [
            {
              name = "mp";
              inputs = "m *}";
              outputs = "m p";
            }
            {
              name = "was";
              inputs = "w a *";
              outputs = "w a s";
            }
          ];
        };
        rptRules = mkOption {
          type = types.listOf types.attrs;
          description = ''
            Place magic rules that activate via the repeat key here. It automatically deletes the repeated character.
          '';
        };
        wordStartingRules = mkOption {
          type = types.listOf types.attrs;
        };
        wordStartingRptRules = mkOption {
          type = types.listOf types.attrs;
        };
        includeReturn = mkOption {
          type = types.bool;
          default = true;
          description = ''
            Kanata sequences automatically backspace the inputs before outputting the keys.
            Therefore, including return in the outputs is necessary to prevent it from being deleted. However, this behavior might interfere with the terminal shell prompt.
            Disable this option if you do not want that.
          '';
        };
        includeTab = mkOption {
          type = types.bool;
          default = true;
        };
        includeSlash = mkOption {
          type = types.bool;
          default = false;
          description = ''
            Defaults to not include / in the output, as it works better in Helix/Vim.
          '';
        };
        mode = mkOption {
          type = types.str;
          default = "visible-backspaced";
          description = ''
            The options are:

            - visible-backspaced: types sequence characters as they are inputted. The typed characters will be erased with backspaces for a valid sequence termination.
            - hidden-suppressed: hides sequence characters as they are typed. Does not output the hidden characters for an invalid sequence termination.
            - hidden-delay-type: hides sequence characters as they are typed. Outputs the hidden characters for an invalid sequence termination either after a timeout or after a non-sequence key is typed.
          '';
        };
        timeout = mkOption {
          type = types.int;
          default = 2000;
          description = ''
            Key sequences are stored until this duration has elapsed since the most recent key press.
          '';
        };
      };
      rapidEventDelay = mkOption {
        type = types.int;
        default = 35;
        description = ''
          Increase this value if you experience issue with chords and one-shot shifts.
        '';
      };
      ansi = {
        enable = mkOption {
          type = types.bool;
          default =
            if cfg.jis.enable
            then false
            else true;
        };
        config = mkOption {
          type = types.str;
          description = ''
            Define layers for the ANSI keyboard.
          '';
        };
      };
      jis = {
        enable = mkOption {
          type = types.bool;
          default = false;
        };
        config = mkOption {
          type = types.str;
          description = ''
            Define layers for the JIS keyboard.
          '';
        };
      };
      config = mkOption {
        type = types.str;
        description = ''
          Any kanata configuration such as defalias, defchord
        '';
      };
      extraDefCfg = mkOption {
        type = types.str;
        default = "";
        description = ''
          Extra kanata defcfg options
        '';
      };
    };
  };
  config = {
    services.kanata = mkIf cfg.enable {
      enable = true;
      package = pkgs.kanata.override {
        rustPlatform =
          pkgs.rustPlatform
          // {
            buildRustPackage = args:
              pkgs.rustPlatform.buildRustPackage (args
                // {
                  version = "unstable-2024-06-07";
                  src = pkgs.fetchFromGitHub {
                    owner = "jtroo";
                    repo = "kanata";
                    rev = "306e172a05387f78c86eebfa41f665c7df1af710";
                    hash = "sha256-ZvQTX5nNOEx6RHbckyNys9ES2LZ0UUvwQb3fdHqadVE=";
                  };
                  cargoHash = "sha256-Q0aKF3Tr+rsgUz85AJqipE3AAxAqHqPqeqOLUM7q/og=";
                });
          };
      };

      keyboards.psilocybin = mkIf cfg.ansi.enable {
        extraDefCfg = defCfg;
        config = cfg.ansi.config + cfg.config + magic;
        inherit (cfg) devices;
      };
      keyboards.psilocybinjis = mkIf cfg.jis.enable {
        extraDefCfg = defCfg;
        config = cfg.jis.config + cfg.config + magic;
        inherit (cfg) devices;
      };
    };
  };
}
