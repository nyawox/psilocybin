{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  # workaround one-shot shift not working on keys with chord defined
  # https://github.com/jtroo/kanata/issues/900
  defCfg = ''
    rapid-event-delay 35
    sequence-timeout 2000
    sequence-input-mode visible-backspaced
    sequence-always-on true
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
        rules = mkOption {
          type = types.listOf types.attrs;
        };
        rptRules = mkOption {
          type = types.listOf types.attrs;
        };
        extraConfig = mkOption {
          type = types.str;
        };
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
        config = ansi + psilocybin + cfg.magic.extraConfig;
        devices = cfg.devices;
      };
      keyboards.psilocybinjis = mkIf cfg.jis {
        extraDefCfg = defCfg;
        config = jis + psilocybin + cfg.magic.extraConfig;
        devices = cfg.devices;
      };
    };
  };
}
