{
  config,
  lib,
  ...
}:
with lib; let
  # workaround one-shot shift not working on keys with chord defined
  # https://github.com/jtroo/kanata/issues/900
  defCfg = ''
    rapid-event-delay 35
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
      @lrp @n    @r   @s   @t   @g   XX    XX   @b   @mgt @e   @a   @i
      XX   @j    @w   @p   @d   @q   XX    XX   @v   @h   @;   @'
      XX   @lmet               @spc            @ral @rmet @ral
    )

    (deflayer psilocybin-tp
      _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
      _    x     l    c    m    k    XX    XX   z    f    u    o    y    .
      _    n     r    s    t    g    XX    XX   b    @mgc e    a    i
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
      @lrp @n    @r   @s   @t   @g   XX    XX   @b   @mgt @e   @a   @i
      XX   @j    @w   @p   @d   @q   XX    XX   @v   @h   @;   @'   @'
      XX   XX    lalt @lmet     @spc       XX    XX  XX   @rmet @ral
    )

    (deflayer psilocybin-tp
      _    _     _    _    _    _    _     _    _    _    _    _    _    _    _
      _    x     l    c    m    k    XX    XX   z    f    u    o    y    .
      _    n     r    s    t    g    XX    XX   b    @mgc e    a    i
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
      the (one-shot 5000 (layer-toggle the))
      the-r (one-shot 5000 (layer-toggle the-r))
      the-r-e (one-shot 5000 (layer-toggle the-r-e))
      the-r-o (one-shot 5000 (layer-toggle the-r-o))
      tho (one-shot 5000 (layer-toggle tho))
      they (one-shot 5000 (layer-toggle they))
      for (one-shot 5000 (layer-toggle for))
      for-w (one-shot 5000 (layer-toggle for-w))
      for-n (one-shot 5000 (layer-toggle for-n))
      for-r (one-shot 5000 (layer-toggle for-r))
      be (one-shot 5000 (layer-toggle be))
      be-c (one-shot 5000 (layer-toggle be-c))
      be-f (one-shot 5000 (layer-toggle be-f))
      be-u (one-shot 5000 (layer-toggle be-u))
      beauty (one-shot 5000 (layer-toggle beauty))
      beautifully (one-shot 5000 (layer-toggle beautifully))
      be-t (one-shot 5000 (layer-toggle be-t))
      be-g (one-shot 5000 (layer-toggle be-g))
      wh (one-shot 5000 (layer-toggle wh))
      will (one-shot 5000 (layer-toggle will))
      when (one-shot 5000 (layer-toggle when))
      what (one-shot 5000 (layer-toggle what))
      whats (one-shot 5000 (layer-toggle whats))
    )

    ;; these word-builder rules aren't tested and likely wouldn't work on jis keyboard
    ;; <spc>*
    (deflayermap (the)
      spc (macro e spc) ;; <spc>*<spc> -> the<spc>
      ralt (macro e m) ;; <spc>*<rpt> -> them
      ] (macro e y) ;; <spc>*y -> they
      a (macro e n) ;; <spc>*n -> then
      d (macro e s e) ;; <spc>*s -> these
      s (macro r (on-press tap-vkey the-r)) ;; <spc>*r -> the**(including r)
      [ (macro o (on-press tap-vkey tho)) ;; <spc>*o -> tho**
    )
    (deflayermap (the-r)
      spc (macro bspc e i r spc) ;; <spc>*r<spc> -> their<spc>
      ; (macro e (on-press tap-vkey the-r-e)) ;; <spc>*re
      [ (macro o (on-press tap-vkey the-r-o)) ;; <spc>*ro
    )
    (deflayermap (the-r-e)
      spc (macro bspc bspc e r e spc) ;; <spc>*re<spc> -> there
    )
    (deflayermap (the-r-o)
      spc (macro u g h spc) ;; <spc>*ro<spc> -> through
    )
    (deflayermap (tho)
      d (macro s e) ;; <spc>*os  -> those
      . (macro u g h) ;; <spc>*oh -> though
    )
    (deflayermap (they)
      s (macro r e) ;; <spc>*y<rpt>r -> they're
      , (macro v e) ;; <spc>*y<rpt>v -> they've ;; this is the 4th hardest word in this layout
      w (macro l l) ;; <spc>*y<rpt>l -> they'll
    )
    ;; f<rpt>
    (deflayermap (for) ;; defaults to for
      v (macro bspc u n d) ;; f<rpt>d -> found
      g (macro e i g n) ;; f<rpt>g -> foreign
      x (on-press tap-vkey for-w) ;; f<rpt>w
      a (on-press tap-vkey for-n) ;; f<rpt>n
      s (on-press tap-vkey for-r) ;; f<rpt>r
    )
    ;; prevent confliction with forward
    (deflayermap (for-w)
      spc (macro bspc l l o w spc) ;; f<rpt>w<spc> -> follow
    )
    ;; prevent confliction with california
    (deflayermap (for-n)
      spc (macro g o t t e n spc) ;; f<rpt>n<spc> -> forgotten
    )
    (deflayermap (for-r)
      spc (macro e v e r spc) ;; f<rpt>r<spc> -> forever
      v (macro w a r d) ;; f<rpt>rd -> forward
    )
    ;; <spc><rpt>
    (deflayermap (be) ;; defaults to be
      t (macro bspc a c k) ;; <spc><rpt>k -> back
      e (macro c (on-press tap-vkey be-c)) ;; <spc><rpt>c
      o (macro f (on-press tap-vkey be-f)) ;; <spc><rpt>f
      p (macro u (on-press tap-vkey be-u)) ;; <spc><rpt>u
      f (macro t (on-press tap-vkey be-t)) ;; <spc><rpt>t
      g (macro g (on-press tap-vkey be-g)) ;; <spc><rpt>g
    )
    (deflayermap (be-c)
      spc (macro a u s e spc) ;; <spc><rpt>c<spc> -> because
      [ (macro o m e) ;; <spc><rpt>co -> become
      ' (macro a m e) ;; <spc><rpt>co -> became
      ret (macro o m i n g) ;; <spc><rpt>ci -> becoming
    )
    (deflayermap (be-f)
      spc (macro o r e spc) ;; <spc><rpt>f -> before
    )
    (deflayermap (be-u)
      spc (macro bspc bspc u t spc) ;; <spc><rpt>u<spc> -> but
      f (macro bspc a u t y (on-press tap-vkey beauty)) ;; <spc><rpt>ut -> beauty
    )
    (deflayermap (beauty)
      o (macro bspc i f u l (on-press tap-vkey beautifully)) ;; <spc><rpt>utf -> beautiful
      ] (macro bspc i f y) ;; <spc><rpt>uty -> beautify
    )
    (deflayermap (beautifully)
      ] (macro l y) ;; <spc><rpt>utfy -> beautifully
    )
    (deflayermap (be-t)
      a (macro w e e n) ;; <spc><rpt>tn -> between
      ; (macro t e r) ;; <spc><rpt>te -> better
      s (macro r a y) ;; <spc><rpt>tr -> betray
    )
    (deflayermap (be-g)
      ret (macro i n) ;; <spc><rpt>gi -> begin
      ' (macro a n) ;; <spc><rpt>ga -> began
      p (macro u n) ;; <spc><rpt>gu -> begun
    )
    ;; <spc><lrpt>
    (deflayermap (wh)
      l (macro bspc i t h) ;; <spc><lrpt>* -> with
      ralt (macro e n (on-press tap-vkey when)) ;; <spc><lrpt><rpt> -> when
      [ (macro o) ;; <spc><lrpt>o -> who
      ] (macro y) ;; <spc><lrpt>y -> why
      ' (macro a t (on-press tap-vkey what)) ;; <spc><lrpt>a -> what
      ret (macro bspc i l l (on-press tap-vkey will)) ;; <spc><lrpt>i -> will
      w (macro bspc e l l) ;; <spc><lrpt>l -> well
      . (macro i l e) ;; <spc><lrpt>h -> while
      e (macro i c h) ;; <spc><lrpt>c -> which
      ; (macro e r e) ;; <spc><lrpt>e -> where
      t (macro bspc o r k) ;; <spc><lrpt>k -> work
      p (macro bspc o u l d) ;; <spc><lrpt>u -> would
      v (macro bspc o r l d) ;; <spc><lrpt>d -> world
      f (macro e t h e r) ;; <spc><lrpt>t -> whether
    )
    (deflayermap (will)
      f (macro bspc bspc t h o u t) ;; <spc><lrpt>it -> without
    )
    (deflayermap (when)
      , (macro e v e r) ;; <spc><lrpt><rpt>v -> whenever
    )
    (deflayermap (what)
      , (macro e v e r) ;; <spc><lrpt>av -> whatever
      d (macro s (on-press tap-vkey whats)) ;; <spc><lrpt>as
    )
    (deflayermap (whats)
      spc (macro bspc ' s spc) ;; <spc><lrpt>as<spc> -> what's
      , (macro o e v e r) ;; <spc><lrpt>asv -> whatsoever
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


      magic (switch ;;🪄
        ;;;;;;;;;;;;;;;;;;;;;;;;
        ;; psilocybin
        ((key-history m 1)) p break ;; sfb
        ((key-history y 1)) . break ;; sfb
        ((and (key-history w 2) (key-history a 1))) s break ;; was ;; wao doesn't happen in english
        ((and (key-history w 2) (key-history i 1))) s break ;; wis ;; wion doesn't happen in english
        ((and (key-history w 2) (key-history e 1))) s break ;; wes ;; weu doesn't happen in english
        ((and (key-history m 4) (key-history a 3) (key-history k 2) (key-history e 1))) u break ;; prevent overwriting makeup
        ((and (key-history k 2) (key-history e 1))) d break ;; ked
        ((and (key-history a 5) (key-history m 4) (key-history a 3) (key-history t 2) (key-history e 1))) u break ;; te* -> ted unless amateur
        ((and (key-history l 3) (key-history m 2) (key-history a 1))) o break ;; stop converting lmao to lmat
        ((and (key-history m 2) (key-history a 1))) t break ;; ma* -> mat sfs
        ((and (key-history m 2) (key-history e 1))) t break ;; ma* -> met sfs
        ((and (key-history t 2) (key-history e 1))) d break ;; te* -> ted sfs
        ((and (key-history g 2) (key-history e 1))) d break ;; ge* -> ged sfs
        ((and (key-history d 2) (key-history a 1))) t break ;; da* -> dat sfs
        ((key-history e 1)) u break ;; sfb
        ;; most pms which is sfb are pment, use left rpt key for other pms
        ((and (key-history l 3)(key-history o 2) (key-history p 1))) (macro m e n t) break ;; opment
        ((and (key-history o 3)(key-history o 2) (key-history p 1))) (macro m e n t) break ;; opment
        ;; remove script from the rule below
        ((and (key-history s 5)(key-history c 4)(key-history r 3) (key-history i 2) (key-history p 1))) t break
        ((and (key-history i 2) (key-history p 1))) (macro m e n t) break ;; ipment
        ((key-history p 1)) t break ;; sfb
        ((key-history r 1)) l break ;; sfb
        ((key-history w 1)) s break ;; sfb
        ((and (key-history g 3) (key-history a 2) (key-history d 1))) g break ;; gadget
        ((and (key-history b 3) (key-history a 2) (key-history d 1))) g break ;; badge
        ((and (key-history a 2) (key-history d 1))) m break ;; dm sfb mostly consists of adm, otherwise cope with index middle
        ((key-history d 1)) g break ;; sfb
        ((key-history s 1)) w break ;; sfb
        ((key-history l 1)) r break ;; sfb
        ((key-history a 1)) o break ;; sfb
        ;;;;;;;;;;;;;;;
        ;;th is the most common english bigram
        ((or (key-history spc 1) (key-history tab 1) (key-history ret 1))) (macro t h (on-press tap-vkey the)) break
        ;;tment most common tm words are tment
        ;; Put delay to avoid macro being interrupted when the key isn't released. key-release didn't work
        ((and (key-history r 2) (key-history t 1))) (macro m e n 50 t) break ;; rtment
        ((and (key-history n 2) (key-history t 1))) (macro m e n 50 t) break ;; ntment
        ((and (key-history s 2) (key-history t 1))) (macro m e n 50 t) break ;; stment
        ((and (key-history f 2) (key-history t 1))) (macro m e n 50 t) break ;; ftment
        ((and (key-history e 3) (key-history a 2) (key-history t 1))) (macro m e n 50 t) break ;; eatment
        ((and (key-history u 3) (key-history i 2) (key-history t 1))) (macro m e n 50 t) break ;; uitment
        ((and (key-history m 3) (key-history i 2) (key-history t 1))) (macro m e n 50 t) break ;; mitment
        ;;ion
        ((key-history i 1)) (macro o n) break

        ;;tch
        ((key-history t 1)) (macro c h) break
        ;; ver
        ((key-history v 1)) (macro e r) break ;; press with index middle, otherwise it just makes another sfb
        ;; just, most frequent ngram that starts with j
        ((key-history j 1)) (macro u s t) break

        ;; ght is a common sfs
        ((key-history g 1)) (macro h t) break
        ;; got sfs
        ((and (key-history g 2) (key-history o 1))) t break
        ;; nts common redirect
        ((key-history n 1)) (macro t s) break
        ;; put sfs
        ((and (key-history c 5) (key-history a 4) (key-history m 3) (key-history p 2) (key-history u 1))) (macro s e) break ;; campuses prevent overwriting use with put
        ((and (key-history r 8) (key-history t 7) (key-history o 6) (key-history c 5) (key-history a 4) (key-history r 3) (key-history p 2) (key-history u 1))) (macro s e) break ;; artocarpuses prevent overwriting use with put
        ((and (key-history p 2) (key-history u 1))) t break
        ;; top
        ((and (key-history t 2) (key-history o 1))) p break
        ;; stud
        ((and (key-history s 3) (key-history t 2) (key-history u 1))) d break
        ;; use
        ((key-history u 1)) (macro s e) break

        ;; TODO somehow implement ious
      )
      mgc (chord esc *)
      mgt (multi @mgc @tp)

      repeat (switch
        ;; Use this thumb repeat key mostly when repeating left hand bigram like ll
        ;; they'
        ((and (key-history t 4) (key-history h 3) (key-history e 2) (key-history y 1))) (macro ' (on-press tap-vkey they)) break
        ;; ing
        ((key-history i 1)) (macro n g) break
        ((key-history y 1)) (macro i n g) break ;; sfb all common yis are ying
        ((and (key-history n 2) (key-history g 1))) (macro i n 50 g) break ;; nging
        ((and (key-history n 2) (key-history d 1))) (macro i n g) break ;; nding
        ((and (key-history o 2) (key-history w 1))) (macro i n g) break ;; owing
        ((and (key-history r 3) (key-history a 2) (key-history w 1))) (macro i n g) break ;; rawing
        ((and (key-history r 3) (key-history o 2) (key-history w 1))) (macro i n g) break ;; rowing
        ((and (key-history e 2) (key-history w 1))) (macro i n g) break ;; ewing
        ((key-history v 1)) (macro i n g) break ;; ving
        ((key-history h 1)) (macro a v) break ;; sfs
        ((key-history a 1)) (macro n d) break ;; common ngram
        ((key-history u 1)) (macro r e) break ;; ure
        ;; for
        ((key-history f 1)) (macro o r (on-press tap-vkey for)) break
        ;; be
        ((or (key-history spc 1) (key-history tab 1) (key-history ret 1))) (macro b e (on-press tap-vkey be)) break
        () rpt break
      )

      ral @repeat

      lrp (switch
        ((and (key-history i 2) (key-history p 1))) (macro t) break
        ((key-history p 1)) m break ;; sfb, use right repeat key for pp, magic key for pment
        ((key-history k 1)) (macro i n g) break ;; the rule is to put on the opposite hand repeat key
        ((key-history t 1)) p break ;; sfb
        ((key-history g 1)) (macro e t) break ;; get sfs
        ;; wh
        ((or (key-history spc 1) (key-history tab 1) (key-history ret 1))) (macro w h (on-press tap-vkey wh)) break
        () rpt break
      )

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

    (defchords esc 25
      (*    ) @magic
      (   f ) f
      (*  f ) esc
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
in {
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
    services.kanata = mkIf config.psilocybin.enable {
      enable = true;

      keyboards.psilocybin = mkIf config.psilocybin.ansi {
        extraDefCfg = defCfg;
        config = ansi + psilocybin;
        devices = config.psilocybin.devices;
      };
      keyboards.psilocybinjis = mkIf config.psilocybin.jis {
        extraDefCfg = defCfg;
        config = jis + psilocybin;
        devices = config.psilocybin.devices;
      };
    };
  };
}
