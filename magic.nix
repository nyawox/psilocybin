{lib, ...}: let
  nop3 = "nop3 nop3";
  nop4 = "nop3 nop4";
  nop5 = "nop3 nop5";
  nop6 = "nop3 nop6";
  nop7 = "nop3 nop7";
  nop8 = "nop3 nop8";
  nop9 = "nop3 nop9";
  nop10 = "nop4 nop3";
  nop11 = "nop4 nop4";
  nop12 = "nop4 nop5";
  nop13 = "nop4 nop6";
  nop14 = "nop4 nop7";
  nop15 = "nop4 nop8";
  nop16 = "nop4 nop9";
  nop17 = "nop5 nop3";
  nop18 = "nop5 nop4";
  nop19 = "nop5 nop5";
  nop20 = "nop5 nop6";
  nop21 = "nop5 nop7";
  nop22 = "nop5 nop8";
  nop23 = "nop5 nop9";
  nop24 = "nop6 nop3";
  nop25 = "nop6 nop4";
  nop26 = "nop6 nop5";
  nop27 = "nop6 nop6";
  nop28 = "nop6 nop7";
  nop29 = "nop6 nop8";
  nop30 = "nop6 nop9";
  nop31 = "nop7 nop3";
  nop32 = "nop7 nop4";
  nop33 = "nop7 nop5";
  nop34 = "nop7 nop6";
  nop35 = "nop7 nop7";
  nop36 = "nop7 nop8";
  nop37 = "nop7 nop9";
  nop38 = "nop8 nop3";
  nop39 = "nop8 nop4";
  nop40 = "nop8 nop5";
  nop41 = "nop8 nop6";
  nop42 = "nop8 nop7";
  nop43 = "nop8 nop8";
  nop44 = "nop8 nop9";
  nop45 = "nop9 nop3";
  nop46 = "nop9 nop4";
  nop47 = "nop9 nop5";
  nop48 = "nop9 nop6";
  nop49 = "nop9 nop7";
  nop50 = "nop9 nop8";
  nop51 = "nop9 nop9";
in {
  config = {
    # ⚝ -> nop0
    # ⬡ -> nop1
    # ⬢ -> nop2
    psilocybin.magic = lib.mkDefault ''
      (defalias
        mgc (chord esc *)
        ⚝ (multi (chord esc ⚝) @tp)
        ⬡ (multi nop1 rpt)
        ⬢ (multi nop2 rpt)
        ;; Using nop3 as prefix
        nop3 (macro nop3 nop3)
        nop4 (macro nop3 nop4)
        nop5 (macro nop3 nop5)
        nop6 (macro nop3 nop6)
        nop7 (macro nop3 nop7)
        nop8 (macro nop3 nop8)
        nop9 (macro nop3 nop9)
        ;; Using nop4 as prefix
        nop10 (macro nop4 nop3)
        nop11 (macro nop4 nop4)
        nop12 (macro nop4 nop5)
        nop13 (macro nop4 nop6)
        nop14 (macro nop4 nop7)
        nop15 (macro nop4 nop8)
        nop16 (macro nop4 nop9)
        ;; Using nop5 as prefix
        nop17 (macro nop5 nop3)
        nop18 (macro nop5 nop4)
        nop19 (macro nop5 nop5)
        nop20 (macro nop5 nop6)
        nop21 (macro nop5 nop7)
        nop22 (macro nop5 nop8)
        nop23 (macro nop5 nop9)
        ;; Using nop6 as prefix
        nop24 (macro nop6 nop3)
        nop25 (macro nop6 nop4)
        nop26 (macro nop6 nop5)
        nop27 (macro nop6 nop6)
        nop28 (macro nop6 nop7)
        nop29 (macro nop6 nop8)
        nop30 (macro nop6 nop9)
        ;; Using nop7 as prefix
        nop31 (macro nop7 nop3)
        nop32 (macro nop7 nop4)
        nop33 (macro nop7 nop5)
        nop34 (macro nop7 nop6)
        nop35 (macro nop7 nop7)
        nop36 (macro nop7 nop8)
        nop37 (macro nop7 nop9)
        ;; Using nop8 as prefix
        nop38 (macro nop8 nop3)
        nop39 (macro nop8 nop4)
        nop40 (macro nop8 nop5)
        nop41 (macro nop8 nop6)
        nop42 (macro nop8 nop7)
        nop43 (macro nop8 nop8)
        nop44 (macro nop8 nop9)
        ;; Using nop9 as prefix
        nop45 (macro nop9 nop3)
        nop46 (macro nop9 nop4)
        nop47 (macro nop9 nop5)
        nop48 (macro nop9 nop6)
        nop49 (macro nop9 nop7)
        nop50 (macro nop9 nop8)
        nop51 (macro nop9 nop9)
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
      ;;⚝
      (t! seq mp (m nop0) (macro m (unmod p))) ;; sfb
      (t! seq y. (y nop0) (macro y (unmod .))) ;; sfb
      (t! seq was (w a nop0) (macro w (unmod a s))) ;; wao doesn't happen
      (t! seq wis (w i nop0) (macro w (unmod i s))) ;; wion doesn't happen
      (t! seq wes (w e nop0) (macro w (unmod e s))) ;; weu doesn't happen
      (t! seq makeup (m a k e nop0) (macro m (unmod a k e u))) ;; prevent ked overriding makeup
      (t! seq ked (k e nop0) (macro k (unmod e d))) ;; sfs
      (t! seq amateur (a m a t e nop0) (macro a (unmod m a t e u))) ;; prevent ted overriding amateur
      (t! seq lmao (l m a nop0) (macro l (unmod m a o))) ;; prevent mat overriding lmao
      (t! seq mat (m a nop0) (macro m (unmod a t))) ;; sfs
      (t! seq met (m e nop0) (macro m (unmod e t))) ;; sfs
      (t! seq ted (t e nop0) (macro t (unmod e d))) ;; sfs
      (t! seq ged (g e nop0) (macro g (unmod e d))) ;; sfs
      (t! seq dat (d a nop0) (macro d (unmod a t))) ;; sfs
      (t! seq eu (e nop0) (macro e (unmod u))) ;; sfb
      (t! seq lopment (l o p nop0) (macro l (unmod o p m e n t))) ;; opment
      (t! seq oopment (o o p nop0) (macro o (unmod o p m e n t))) ;; opment
      (t! seq script (s c r i p nop0) (macro s (unmod c r i p t))) ;; prevent ipment overriding script
      (t! seq ipment (i p nop0) (macro i (unmod p m e n t))) ;; ipment
      (t! seq pt (p nop0) (macro p (unmod t))) ;; sfb
      (t! seq rl (r nop0) (macro r (unmod l))) ;; sfb
      (t! seq ws (w nop0) (macro w (unmod s))) ;; sfb
      (t! seq gadget (g a d nop0) (macro g (unmod a d g))) ;; prevent adm overriding gadget
      (t! seq badge (b a d nop0) (macro b (unmod a d g))) ;; prevent adm overriding badge
      (t! seq adm (a d nop0) (macro a (unmod d m))) ;; most of dm sfb
      (t! seq dg (d nop0) (macro d (unmod g))) ;; sfb
      (t! seq sw (s nop0) (macro s (unmod w))) ;; sfb
      (t! seq lr (l nop0) (macro l (unmod r))) ;; sfb
      (t! seq ao (a nop0) (macro a (unmod o))) ;; sfb
      ;; th
      (t! seq th (spc nop0) (macro t (unmod h) @nop3))
      (t! seq the (${nop3} spc) (macro e spc))
      (t! seq them (${nop3} nop1) (macro e e m))
      (t! seq they (${nop3} y) (macro e y @nop4))
      (t! seq they're (${nop4} nop1 r) (macro ' r e))
      (t! seq they've (${nop4} nop1 v) (macro ' v e))
      (t! seq they'll (${nop4} nop1 l) (macro ' l l))
      (t! seq then (${nop3} n) (macro e n))
      (t! seq these (${nop3} s) (macro e s e))
      (t! seq their (${nop3} r spc) (macro e i r spc))
      (t! seq there (${nop3} r e spc) (macro e r e spc))
      (t! seq through (${nop3} r o spc) (macro r o u g h spc))
      (t! seq those (${nop3} o s) (macro o s e))
      (t! seq though (${nop3} o h) (macro o u g h))
      ;; most common tm words are tment
      ;; put delay to avoid macro being interrupted when the key isn't released yet.
      (t! seq rtment (r t nop0) (macro r (unmod t m e n) 50 (unmod t))) ;; rtment
      (t! seq ntment (n t nop0) (macro n (unmod t m e n) 50 (unmod t))) ;; ntment
      (t! seq stment (s t nop0) (macro s (unmod t m e n) 50 (unmod t))) ;; stment
      (t! seq ftment (f t nop0) (macro f (unmod t m e n) 50 (unmod t))) ;; ftment
      (t! seq eatment (e a t nop0) (macro e (unmod a t m e n t))) ;; eatment
      (t! seq uitment (u i t nop0) (macro u (unmod i t m e n t))) ;; uitment
      (t! seq mitment (m i t nop0) (macro m (unmod i t m e n t))) ;; mitment

      (t! seq ion (i nop0) (macro i (unmod o n))) ;; ion
      (t! seq tch (t nop0) (macro t (unmod c h))) ;; tch
      (t! seq ver (v nop0) (macro v (unmod e r))) ;; ver
      (t! seq just (j nop0) (macro j (unmod u s t))) ;; just
      (t! seq ght (g nop0) (macro g (unmod h t))) ;; ght sfs
      (t! seq got (g o nop0) (macro g (unmod o t))) ;; got sfs
      (t! seq nts (n nop0) (macro n (unmod t s))) ;; nts sfs
      ;; put sfs
      (t! seq campuse (c a m p u nop0) (macro c (unmod a m p u s e))) ;; prevent put overriding campuses
      (t! seq artocarpuses (a r t o c a r p u nop0) (macro a (unmod r t o c a r p u s e))) ;; prevent put overriding artocarpuses
      (t! seq put (p u nop0) (macro p (unmod u t)))

      (t! seq top (t o nop0) (macro t (unmod o p))) ;; sfs
      (t! seq stud (s t u d nop0) (macro s (unmod t u d))) ;; most of the tud sfs
      (t! seq use (u s nop0) (macro u (unmod s e))) ;; sfs
      ;;⬡
      (t! seq ing (i nop1) (macro i (unmod n g)))
      (t! seq ying (y nop1) (macro y (unmod i n g)))
      (t! seq nging (n g nop1) (macro n (unmod g i n) 50 (unmod g)))
      (t! seq nding (n d nop1) (macro n (unmod d i n g)))
      (t! seq owing (o w nop1) (macro o (unmod w i n g)))
      (t! seq rawing (r a w nop1) (macro r (unmod a w i n g)))
      (t! seq ewing (e w nop1) (macro e (unmod w i n g)))
      (t! seq ving (v nop1) (macro v (unmod i n g)))
      (t! seq hav (h nop1) (macro h (unmod a v))) ;; sfs
      (t! seq and (a nop1) (macro a (unmod n d)))
      (t! seq ure (u nop1) (macro u (unmod r e)))
      ;; for
      (t! seq for (f nop1) (macro f (unmod o r) @nop5))
      (t! seq found (${nop5} d) (macro bspc u n d))
      (t! seq foreign (${nop5} g) (macro e i g n))
      (t! seq follow (${nop5} w spc) (macro bspc l l o w spc)) ;; spc is necessary to prevent confliction with forward
      (t! seq forgotten (${nop5} n spc) (macro g o t t e n spc)) ;; spc is necessary to prevent confliction with california
      (t! seq forever (${nop5} r spc) (macro e v e r))
      (t! seq forward (${nop5} r d) (macro w a r d))
      ;; be
      (t! seq be (spc nop1) (macro b (unmod e) @nop6))
      (t! seq because (${nop6} c spc) (macro c a u s e spc))
      (t! seq become (${nop6} c o) (macro c o m e))
      (t! seq became (${nop6} c a) (macro c a m e))
      (t! seq becoming (${nop6} c i) (macro c o m i n g))
      (t! seq before (${nop6} f spc) (macro f o r e spc))
      (t! seq but (${nop6} u spc) (macro bspc u t spc))
      (t! seq beauty (${nop6} u t) (macro a u t y @nop7))
      (t! seq beautiful (${nop7} f) (macro bspc i f u l @nop8))
      (t! seq beautifully (${nop8} y) (macro l y))
      (t! seq beautify (${nop7} y) (macro bspc i f y))
      (t! seq between (${nop6} t n) (macro t w e e n))
      (t! seq better (${nop6} t e) (macro t t e r))
      (t! seq betray (${nop6} t r) (macro t r a y))
      (t! seq begin (${nop6} g i) (macro g i n))
      (t! seq began (${nop6} g a) (macro g a n))
      (t! seq begun (${nop6} g u) (macro g u n))
      (t! seq back (${nop6} k) (macro bspc a c k))
      ;;⬢
      (t! seq ipt (i p nop2) (macro i (unmod p t)))
      (t! seq pm (p nop2) (macro p (unmod m))) ;; sfb
      (t! seq tp (t nop2) (macro t (unmod p))) ;; sfb
      (t! seq king (k nop2) (macro k (unmod i n g)))
      (t! seq get (g nop2) (macro g (unmod e t))) ;; sfs
      ;; wh
      (t! seq wh (spc nop2) (macro w (unmod h) @nop9)) ;; defaults to wh
      (t! seq with (${nop9} nop0) (macro bspc i t h))
      (t! seq who (${nop9} o) o)
      (t! seq why (${nop9} y) y)

      (t! seq when (${nop9} nop1) (macro e n @nop10))
      (t! seq whenever (${nop10} v) (macro e v e r))

      (t! seq what (${nop9} a) (macro a t @nop11))
      (t! seq whatever (${nop11} v) (macro e v e r))
      (t! seq whats (${nop11} s spc) (macro ' s spc))
      (t! seq whatsoever (${nop11} s v) (macro s o e v e r))
      (t! seq will (${nop9} i) (macro w (unmod i l l) @nop12))
      (t! seq without (${nop12} t) (macro o u t))
      (t! seq well (${nop9} l) (macro bspc (unmod e l l)))
      (t! seq while (${nop9} h) (macro i l e))
      (t! seq which (${nop9} c) (macro i c h))
      (t! seq where (${nop9} e) (macro e r e))
      (t! seq would (${nop9} u) (macro bspc o u l d))
      (t! seq world (${nop9} d) (macro bspc o r l d))
      (t! seq whether (${nop9} t) (macro e t h e r))
    '';
  };
}
