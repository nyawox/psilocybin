{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  defCfg = concatStringsSep "\n" [
    (optionalString (cfg.magic.timeout != 0) "rapid-event-delay ${toString cfg.rapidEventDelay}")
    (optionalString (cfg.magic.timeout != 0) "sequence-timeout ${toString cfg.magic.timeout}")
    (optionalString cfg.magic.enable "sequence-always-on true")
    (optionalString (cfg.magic.mode != "") "sequence-input-mode ${cfg.magic.mode}")
    cfg.extraDefCfg
  ];
  capitalizeFirst = s: "S-${s}";

  generateRule = template: rules: lib.concatMapStringsSep "\n" template rules;

  ruleTemplate = {
    name,
    inputs,
    outputs,
  }: ''
    (t! seq ${name} (${inputs}) (macro ${outputs}))
  '';

  rptRuleTemplate = {
    name,
    inputs,
    outputs,
  }: ''
    (t! seq ${name} (${inputs}) (macro bspc ${outputs}))
  '';

  shiftRuleTemplate = {
    name,
    inputs,
    outputs,
  }: ''
    (t! seq ${name}-shift (lsft ${inputs}) (macro ${capitalizeFirst outputs}))
  '';

  shiftRptRuleTemplate = {
    name,
    inputs,
    outputs,
  }: ''
    (t! seq ${name}-shift-rpt (lsft ${inputs}) (macro bspc ${capitalizeFirst outputs}))
  '';

  rules = generateRule ruleTemplate cfg.magic.rules;
  rptRules = generateRule rptRuleTemplate cfg.magic.rptRules;
  shiftRules = generateRule shiftRuleTemplate cfg.magic.rules;
  shiftRptRules = generateRule shiftRptRuleTemplate cfg.magic.rptRules;

  # S-9 -> (
  # S-' -> "
  # S-; -> :
  # S-. -> <
  # S-[ -> {
  # S-6 -> ^
  # S-3 -> #
  startingKeys = ["spc" "tab" "." "`" ";" "/" "-" "S-;" "S-." "S-3" "S-9" "S-[" "S-'" "S-6" "🔢₊" "S-ret" "ret" "Home" "End"];
  isExcludedKey = startingKey:
    (startingKey == "tab" && !cfg.magic.includeTab)
    || (startingKey == "ret" && !cfg.magic.includeReturn)
    || (startingKey == "/" && !cfg.magic.includeSlash)
    || (startingKey == "Home")
    || (startingKey == "End");

  generateWordStartingRules = {
    templateFunc,
    ruleSet,
    shiftMode ? false,
  }:
    lib.concatStringsSep "\n" (map (
        startingKey:
          lib.concatMapStringsSep "\n" (
            rule: let
              baseInputs =
                if shiftMode
                then "lsft ${rule.inputs}"
                else rule.inputs;
              baseOutputs =
                if shiftMode
                then capitalizeFirst rule.outputs
                else rule.outputs;
            in
              templateFunc {
                name = "${rule.name}-${startingKey}${
                  if shiftMode
                  then "-shift"
                  else ""
                }";
                inputs = "${startingKey} ${baseInputs}";
                outputs =
                  if isExcludedKey startingKey
                  then baseOutputs
                  else "${startingKey} ${baseOutputs}";
              }
          )
          ruleSet
      )
      startingKeys);

  wordStartingRules = generateWordStartingRules {
    templateFunc = ruleTemplate;
    ruleSet = cfg.magic.wordStartingRules;
  };

  wordStartingRptRules = generateWordStartingRules {
    templateFunc = rptRuleTemplate;
    ruleSet = cfg.magic.wordStartingRptRules;
  };

  shiftWordStartingRules = generateWordStartingRules {
    templateFunc = ruleTemplate;
    ruleSet = cfg.magic.wordStartingRules;
    shiftMode = true;
  };

  shiftWordStartingRptRules = generateWordStartingRules {
    templateFunc = rptRuleTemplate;
    ruleSet = cfg.magic.wordStartingRptRules;
    shiftMode = true;
  };

  magic = ''
    (deftemplate seq (vk-name input-keys output-action)
      (deffakekeys $vk-name $output-action)
      (defseq $vk-name $input-keys)
    )

    ${wordStartingRules}
    ${wordStartingRptRules}
    ${shiftWordStartingRules}
    ${shiftWordStartingRptRules}
    ${rules}
    ${rptRules}
    ${shiftRules}
    ${shiftRptRules}
  '';
  cfg = config.psilocybin;
in {
  imports = [./layout];
  options.psilocybin = {
    enable = mkEnableOption "psilocybin";

    devices = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "List of input devices for kanata to intercept. Empty list means detect all keyboards.";
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
        description = "Magic rules that activate via the repeat key, automatically deleting the repeated character.";
      };

      wordStartingRules = mkOption {
        type = types.listOf types.attrs;
      };

      wordStartingRptRules = mkOption {
        type = types.listOf types.attrs;
      };

      includeReturn = mkEnableOption "include return in outputs";
      includeTab = mkEnableOption "include tab in outputs";
      includeSlash = mkEnableOption "include slash in outputs";

      mode = mkOption {
        type = types.enum ["visible-backspaced" "hidden-suppressed" "hidden-delay-type"];
        default = "visible-backspaced";
        description = "Sequence input mode for kanata.";
      };

      timeout = mkOption {
        type = types.int;
        default = 2000;
        description = "Timeout for key sequences in milliseconds.";
      };
    };

    rapidEventDelay = mkOption {
      type = types.int;
      default = 20;
      description = "Delay for rapid events to handle chords and one-shot shifts.";
    };

    ansi = {
      enable = mkOption {
        type = types.bool;
        default = !cfg.jis.enable;
      };
      config = mkOption {
        type = types.str;
        description = "Configuration for ANSI layout.";
      };
    };

    jis = {
      enable = mkEnableOption "JIS keyboard layout";
      config = mkOption {
        type = types.str;
        description = "Configuration for JIS layout.";
      };
    };

    config = mkOption {
      type = types.str;
      description = "Additional kanata configuration (e.g., defalias, defchord).";
    };

    extraDefCfg = mkOption {
      type = types.str;
      default = "";
      description = "Extra kanata defcfg options.";
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
                  version = "git";
                  src = pkgs.fetchFromGitHub {
                    owner = "jtroo";
                    repo = "kanata";
                    rev = "60ce29a23c217fb31729945f850b505a7a9e0273";
                    hash = "sha256-DienE4An34F+/tR5LxP346ACU5GsP3PSOvl0w6o450Q=";
                  };
                  cargoHash = "sha256-3N6PoStpQAvyBcPIFWaqqjuT27rxz9N02VeW07g0gQU=";
                });
          };
      };

      keyboards = {
        psilocybin = mkIf cfg.ansi.enable {
          extraDefCfg = defCfg;
          config = cfg.ansi.config + cfg.config + magic;
          inherit (cfg) devices;
        };
        psilocybinjis = mkIf cfg.jis.enable {
          extraDefCfg = defCfg;
          config = cfg.jis.config + cfg.config + magic;
          inherit (cfg) devices;
        };
      };
    };
  };
}
