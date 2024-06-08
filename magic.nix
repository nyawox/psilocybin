{lib, ...}: {
  config = {
    # ⚝ -> nop0
    # ⬡ -> nop1
    # ⬢ -> nop2
    psilocybin.magic = lib.mkDefault ''
      (defalias
        mgc (chord esc *)
        ⚝ (multi (chord esc ⚝) @tp)
        ⬡ nop1
        ⬢ nop2
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
      (t! seq the (spc nop0 spc) (macro t (unmod h e spc)))
      (t! seq them (spc nop0 nop1) (macro t (unmod h e m)))
      ;; they, I will keep in this order to see if order matters in sequences
      (t! seq they (spc nop0 y) (macro t (unmod h e y)))
      (t! seq they're (spc nop0 y nop1 r) (macro t (unmod h e y ' r e)))
      (t! seq they've (spc nop0 y nop1 v) (macro t (unmod h e y ' v e)))
      (t! seq they'll (spc nop0 y nop1 l) (macro t (unmod h e y ' l l)))
      (t! seq then (spc nop0 n) (macro t (unmod h e n)))
      (t! seq these (spc nop0 s) (macro t (unmod h e s e)))
      (t! seq their (spc nop0 r spc) (macro t (unmod h e i r spc)))
      (t! seq there (spc nop0 r e spc) (macro t (unmod h e r e spc)))
      (t! seq through (spc nop0 r o spc) (macro t (unmod h r o u g h spc)))
      (t! seq those (spc nop0 o s) (macro t (unmod h o s e)))
      (t! seq though (spc nop0 o h) (macro t (unmod h o u g h)))
      (t! seq th (spc nop0) (macro t (unmod h)))
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
      (t! seq found (f nop1 d) (macro f (unmod o u n d)))
      (t! seq foreign (f nop1 g) (macro f (unmod o r e i g n)))
      (t! seq follow (f nop1 w spc) (macro f (unmod o l l o w spc))) ;; spc is necessary to prevent confliction with forward
      (t! seq forgotten (f nop1 n spc) (macro f (unmod o r g o t t e n spc))) ;; spc is necessary to prevent confliction with california
      (t! seq forever (f nop1 r spc) (macro f (unmod o u n d)))
      (t! seq forward (f nop1 r d) (macro f (unmod o r w a r d)))
      (t! seq for (f nop1) (macro f (unmod o r)))
      ;; be
      (t! seq because (spc nop1 c spc) (macro b (unmod e c a u s e spc)))
      (t! seq become (spc nop1 c o) (macro b (unmod e c o m e)))
      (t! seq became (spc nop1 c a) (macro b (unmod e c a m e)))
      (t! seq becoming (spc nop1 c i) (macro b (unmod e c o m i n g)))
      (t! seq before (spc nop1 f spc) (macro b (unmod e f o r e spc)))
      (t! seq but (spc nop1 u spc) (macro b (unmod u t spc)))
      (t! seq beauty (spc nop1 u t) (macro b (unmod e a u t y)))
      (t! seq beautiful (spc nop1 u t f) (macro b (unmod e a u t i f u l)))
      (t! seq beautifully (spc nop1 u t f y) (macro b (unmod e a u t i f u l l y)))
      (t! seq beautify (spc nop1 u t y) (macro b (unmod e a u t i f y)))
      (t! seq between (spc nop1 t n) (macro b (unmod e t w e e n)))
      (t! seq better (spc nop1 t e) (macro b (unmod e t t e r)))
      (t! seq betray (spc nop1 t r) (macro b (unmod e t r a y)))
      (t! seq begin (spc nop1 g i) (macro b (unmod e g i n)))
      (t! seq began (spc nop1 g a) (macro b (unmod e g a n)))
      (t! seq begun (spc nop1 g u) (macro b (unmod e g u n)))
      (t! seq back (spc nop1 k) (macro b (unmod a c k)))
      (t! seq be (spc nop1) (macro b (unmod e)))
      ;;⬢
      (t! seq ipt (i p nop2) (macro i (unmod p t)))
      (t! seq pm (p nop2) (macro p (unmod m))) ;; sfb
      (t! seq tp (t nop2) (macro t (unmod p))) ;; sfb
      (t! seq king (k nop2) (macro k (unmod i n g)))
      (t! seq get (g nop2) (macro g (unmod e t))) ;; sfs
      ;; wh
      (t! seq with (spc nop2 nop0) (macro w (unmod i t h)))
      (t! seq whenever (spc nop2 nop1 v) (macro w (unmod h e n e v e r)))
      (t! seq when (spc nop2 nop1) (macro w (unmod h e n)))
      (t! seq who (spc nop2 o) (macro w (unmod h o)))
      (t! seq why (spc nop2 y) (macro w (unmod h y)))
      (t! seq whatever (spc nop2 a v) (macro w (unmod h a t e v e r)))
      (t! seq whats (spc nop2 a s spc) (macro w (unmod h a t ' s spc)))
      (t! seq whatsoever (spc nop2 a s v) (macro w (unmod h a t s o e v e r)))
      (t! seq what (spc nop2 a) (macro w (unmod h a t)))
      (t! seq without (spc nop2 i t) (macro w (unmod i t h o u t)))
      (t! seq will (spc nop2 i) (macro w (unmod i l l)))
      (t! seq well (spc nop2 l) (macro w (unmod e l l)))
      (t! seq while (spc nop2 h) (macro w (unmod h i l e)))
      (t! seq which (spc nop2 c) (macro w (unmod h i c h)))
      (t! seq where (spc nop2 e) (macro w (unmod h e r e)))
      (t! seq would (spc nop2 u) (macro w (unmod o u l d)))
      (t! seq world (spc nop2 d) (macro w (unmod o r l d)))
      (t! seq whether (spc nop2 t) (macro w (unmod h e t h e r)))
      (t! seq wh (spc nop2) (macro w (unmod h))) ;; defaults to wh
      ;; default repeat keys to rpt
      (t! seq rpt (nop1) rpt)
      (t! seq lrpt (nop2) rpt)

    '';
  };
}
