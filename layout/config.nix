{lib, ...}: {
  psilocybin.config = lib.mkDefault ''
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

    ;; magic keys
    (defalias
      ⚝ (multi (chord esc ⚝) @tp)
      ⬡ (macro rpt nop1)
      ⬢ (macro rpt nop2)
    )
    (defchords esc 20
      (⚝    ) nop0
      (   f ) f
      (⚝  f ) esc
    )

    (defchords thumb 2000
      (lm    ) @nav
      (   rm ) @sym
      (lm rm ) @num
    )

    (defchords backspace 20
      (h   ) h
      (  ; ) ;
      (h ; ) bspc
    )

    (deflocalkeys-linux
      hngl 122 ;;ime on/off
    )
  '';
}
