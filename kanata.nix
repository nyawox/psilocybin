{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  defCfg = ''
    ${lib.optionalString (cfg.magic.timeout != 0) "rapid-event-delay" + toString cfg.rapidEventDelay}
    ${lib.optionalString (cfg.magic.timeout != 0) "sequence-timeout" + toString cfg.magic.timeout}
    ${lib.optionalString cfg.magic.enable "sequence-always-on true"}
    ${lib.optionalString (cfg.magic.mode != "") "sequence-input-mode" + cfg.magic.mode}
    ${lib.optionalString (cfg.extraDefCfg != "") cfg.extraDefCfg}
  '';
  ansi = ''
    (defsrc
      esc  1     2    3    4    5    6     7    8    9    0    -    =    \    grv
      tab  q     w    e    r    t    y     u    i    o    p    [    ]    bspc
      lctl a     s    d    f    g    h     j    k    l    ;    '    ret
      lsft z     x    c    v    b    n     m    ,    .    /    rsft
      caps lmet                 spc             ralt rmet rctl
    )

    (deflayer psilocybin
      XX   XX    XX   XX   XX   XX   XX    XX   XX   XX   XX   XX   XX   XX   XX
      XX   @x    @l   @c   @m   @k   XX    XX   @z   @f   @u   @o   @y   @.
      @⬢   @n    @r   @s   @t   @g   XX    XX   @b   @⚝   @e   @a   @i
      XX   @j    @w   @p   @d   @q   XX    XX   @v   @h   @;   @'
      XX   @lmet               @spc            @⬡   @rmet @⬡
    )

    (deflayer psilocybin-tp
      _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
      _    x     l    c    m    k    XX    XX   z    f    u    o    y    .
      _    n     r    s    t    g    XX    XX   b    @⚝   e    a    i
      _    j     w    p    d    q    XX    XX   v    h    ;    '
      _    _                    _               _    _    _
    )

    (deflayer nav
      _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
      _    ⭾    XX   esc  @cls XX   XX   XX   @lng ⇤    ▲    ⇥    ⌦    _
      _    @sft @ctl @alt @cmd XX   XX   XX   @cbs ◀    ▼    ▶    ⌫
      _    XX   prnt @cpy @pst XX   XX   XX   XX   ;    ⇪    ⏎
      _    _                   _              _    _    _
    )

    (deflayer sym
      _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
      _    @<   [    @{   @lp  @~   XX   XX   @^   @rp  @}   ]    @>   `
      _    -    @*   =    @_   @$   XX   XX   @#   @cmd @alt @ctl @sft
      _    @:   @dq  @at  /    @|   XX   XX   \    @&   @?   @!
      _    _                   _              _    _    _
    )
    (deflayer num
      _    f1   f2   f3   f4   f5   XX   XX   f6   f7   f8   f9   f10  f11  f12
      _    ⭾    XX   esc  XX   XX   XX   XX   ⁄    7    8    9    🔢∗  .
      _    @sft @ctl @alt @cmd XX   XX   XX   -    4    5    6    0
      _    XX   XX   XX   @%   XX   XX   XX   🔢₊  1    2    3
      _    _                   _              _    _    _
    )

    (deflayer game
      esc  1     2    3    4    5    6    7    8    9    0    -    =    /    grv
      tab  q     w    e    r    t    y    u    i    o    p    [    ]    @cbs
      lctl a     s    d    f    g    h    j    k    l    ;    '    ret
      lsft z     x    c    v    b    n    m    ,    .    /    rsft
      _    _                    _              _    _    _
    )
  '';
  jis = ''
    (defsrc
      grv  1    2    3    4    5    6    7    8    9    0    -    =    ¥   bspc
      tab  q    w    e    r    t    y    u    i    o    p    [    ]    ret
      caps a    s    d    f    g    h    j    k    l    ;    '    \
      lsft z    x    c    v    b    n    m    ,    .    /    ro   rsft
      lctl lmet lalt mhnk      spc       henk  kana ralt prtsc rctl
    )

    (deflayer psilocybin
      XX   XX    XX   XX   XX   XX   XX    XX   XX   XX   XX   XX   XX   XX  XX
      XX   @x    @l   @c   @m   @k   XX    XX   @z   @f   @u   @o   @y   @.
      @⬢   @n    @r   @s   @t   @g   XX    XX   @b   @⚝   @e   @a   @i
      XX   @j    @w   @p   @d   @q   XX    XX   @v   @h   @;   @'   @'
      XX   XX    lalt @lmet     @spc       XX    XX  XX   @rmet @⬡
    )

    (deflayer psilocybin-tp
      _    _     _    _    _    _    _     _    _    _    _    _    _    _    _
      _    x     l    c    m    k    XX    XX   z    f    u    o    y    .
      _    n     r    s    t    g    XX    XX   b    @⚝   e    a    i
      _    j     w    p    d    q    XX    XX   v    h    ;    '    '
      _    _     _    _         _          _     _    _     _   _
    )

    (deflayer nav
      _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
      _    ⭾    XX   esc  @cls XX   XX   XX   @lng ⇤    ▲    ⇥    ⌦    _
      _    @sft @ctl @alt @cmd XX   XX   XX   @cbs ◀    ▼    ▶    ⌫
      _    XX   prnt @cpy @pst XX   XX   XX   XX   ;    ⇪    ⏎    ⏎
      _    _     _    _         _          _     _    _     _   _
    )

    (deflayer sym
      _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
      _    @<   [    @{   @lp  @~   XX   XX   @^   @rp  @}   ]    @>   `
      _    -    @*   =    @_   @$   XX   XX   @#   @cmd @alt @ctl @sft
      _    @:   @dq  @at  /    @|   XX   XX   \    @&   @?   @!   @!
      _    _     _    _         _          _     _    _     _   _
    )
    (deflayer num
      _    f1   f2   f3   f4   f5   XX   XX   f6   f7   f8   f9   f10  f11  f12
      _    ⭾    XX   esc  XX   XX   XX   XX   ⁄    7    8    9    🔢∗  .
      _    @sft @ctl @alt @cmd XX   XX   XX   -    4    5    6    0
      _    XX   XX   XX   @%   XX   XX   XX   🔢₊  1    2    3    3
      _    _     _    _         _          _     _    _     _   _
    )

    (deflayer game
      esc  1     2    3    4    5    6    7    8    9    0    -    =    /    grv
      tab  q     w    e    r    t    y    u    i    o    p    [    ]    @cbs
      lctl a     s    d    f    g    h    j    k    l    ;    '    ret
      lsft z     x    c    v    b    n    m    ,    .    /    rsft rsft
      _    _     _    _         _          _     _    _     _   _
    )

  '';
  psilocybin = ''
    ;; typing layer are used to disable chord while typing fast
    (deffakekeys
      to-base (layer-switch psilocybin)
    )

    (defalias
      tp (multi
        (one-shot 35 (layer-toggle psilocybin-tp))
        (on-idle-fakekey to-base tap 30)
      )

      psi (layer-switch psilocybin)
      gam (layer-switch game)
      cbs C-bspc
      lng hngl ;; ime toggle
      cls M-q
      cpy C-c
      pst C-v

      ;; one-shot modifiers
      sft (one-shot 2000 lsft)
      ctl (one-shot 2000 lctl)
      alt (one-shot 2000 lalt)
      cmd (one-shot 2000 lmet)

      spc (tap-hold 200 300 spc lctl)
      lmet (chord thumb lm)
      rmet (chord thumb rm)
      nav (layer-toggle nav)
      ;;nav (tap-hold-press 200 300 r (layer-toggle nav)) thumb-r is just a concept, still needs to fix delay
      sym (tap-hold-press 200 300 , (layer-toggle sym))
      num (layer-toggle num)

      ;; shifted keys
      { S-[
      } S-]
      lp S-9 ;; left parantheses (
      rp S-0 ;; right parantheses )
      ~ S-`
      ^ S-6
      * S-8
      _ S--
      $ S-4
      # S-3
      | S-\
      at S-2
      % S-5
      & S-7
      ? S-/
      ! S-1
      < S-,
      > S-.
      dq S-'
      : S-;

      x (multi x @tp)
      l (multi l @tp)
      b (multi b @tp)
      g (multi g @tp)
      v (multi v @tp)
      ' (multi ' @tp)
      f (multi (chord esc f) @tp)
      o (multi o @tp)
      u (multi u @tp)
      j (multi j @tp)
      - (multi - @tp)
      = (multi = @tp)
      n (multi n @tp)
      r (multi r @tp)
      s (multi s @tp)
      t (multi t @tp)
      d (multi d @tp)
      y (multi y @tp)
      e (multi e @tp)
      a (multi a @tp)
      i (multi i @tp)
      , (multi (fork , ' (lsft rsft)) @tp)
      q (multi q @tp)
      c (multi c @tp)
      m (multi m @tp)
      w (multi w @tp)
      z (multi z @tp)
      p (multi p @tp)
      k (multi k @tp)
      h (multi (chord backspace h) @tp)
      ; (multi (chord backspace ;) @tp)
      / (multi / @tp)
      . (multi . @tp)
    )

    (defchords thumb 2000
      (lm    ) @nav
      (   rm ) @sym
      (lm rm ) @num
    )

    (defchords backspace 25
      (h   ) h
      (  ; ) ;
      (h ; ) bspc
    )

    (deflocalkeys-linux
      hngl 122 ;;ime on/off
    )
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

  magic = lib.mkDefault ''
    (defalias
      ⚝ (multi (chord esc ⚝) @tp)
      ⬡ (macro rpt nop1)
      ⬢ (macro rpt nop2)
    )
    (defchords esc 25
      (⚝    ) nop0
      (   f ) f
      (⚝  f ) esc
    )
    (deftemplate seq (vk-name input-keys output-action)
          (deffakekeys $vk-name $output-action)
          (defseq $vk-name $input-keys)
    )

    ${rules}
    ${rptRules}
  '';
  cfg = config.psilocybin;
in {
  imports = [./magic.nix];
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
        };
        rptRules = mkOption {
          type = types.listOf types.attrs;
          description = ''
            Put magic rules that activates via repeat key here
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
      ansi = mkOption {
        type = types.bool;
        default =
          if config.psilocybin.jis
          then false
          else true;
      };
      jis = mkOption {
        type = types.bool;
        default = false;
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

      keyboards.psilocybin = mkIf cfg.ansi {
        extraDefCfg = defCfg;
        config = ansi + psilocybin + magic;
        inherit (cfg) devices;
      };
      keyboards.psilocybinjis = mkIf cfg.jis {
        extraDefCfg = defCfg;
        config = jis + psilocybin + magic;
        inherit (cfg) devices;
      };
    };
  };
}
