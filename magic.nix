{lib, ...}: let
  magic = "nop0";
  rpt = "nop1";
  lrpt = "nop2";
  th = "nop3 nop0";
  they = "nop3 nop1";
  for = "nop3 nop2";
  be = "nop3 nop3";
  beauty = "nop3 nop4";
  beautiful = "nop3 nop5";
  wh = "nop3 nop6";
  when = "nop3 nop7";
  what = "nop3 nop8";
  will = "nop3 nop9";
  # nop13 = "nop4 nop0";
  # nop14 = "nop4 nop1";
  # nop15 = "nop4 nop2";
  # nop16 = "nop4 nop3";
  # nop17 = "nop4 nop4";
  # nop18 = "nop4 nop5";
  # nop19 = "nop4 nop6";
  # nop20 = "nop4 nop7";
  # nop21 = "nop4 nop8";
  # nop22 = "nop4 nop9";
  # nop23 = "nop5 nop0";
  # nop24 = "nop5 nop1";
  # nop25 = "nop5 nop2";
  # nop26 = "nop5 nop3";
  # nop27 = "nop5 nop4";
  # nop28 = "nop5 nop5";
  # nop29 = "nop5 nop6";
  # nop30 = "nop5 nop7";
  # nop31 = "nop5 nop8";
  # nop32 = "nop5 nop9";
  # nop33 = "nop6 nop0";
  # nop34 = "nop6 nop1";
  # nop35 = "nop6 nop2";
  # nop36 = "nop6 nop3";
  # nop37 = "nop6 nop4";
  # nop38 = "nop6 nop5";
  # nop39 = "nop6 nop6";
  # nop40 = "nop6 nop7";
  # nop41 = "nop6 nop8";
  # nop42 = "nop6 nop9";
  # nop43 = "nop7 nop0";
  # nop44 = "nop7 nop1";
  # nop45 = "nop7 nop2";
  # nop46 = "nop7 nop3";
  # nop47 = "nop7 nop4";
  # nop48 = "nop7 nop5";
  # nop49 = "nop7 nop6";
  # nop50 = "nop7 nop7";
  # nop51 = "nop7 nop8";
  # nop52 = "nop7 nop9";
  # nop53 = "nop8 nop0";
  # nop54 = "nop8 nop1";
  # nop55 = "nop8 nop2";
  # nop56 = "nop8 nop3";
  # nop57 = "nop8 nop4";
  # nop58 = "nop8 nop5";
  # nop59 = "nop8 nop6";
  # nop60 = "nop8 nop7";
  # nop61 = "nop8 nop8";
  # nop62 = "nop8 nop9";
  # nop63 = "nop9 nop0";
  # nop64 = "nop9 nop1";
  # nop65 = "nop9 nop2";
  # nop66 = "nop9 nop3";
  # nop67 = "nop9 nop4";
  # nop68 = "nop9 nop5";
  # nop69 = "nop9 nop6";
  # nop70 = "nop9 nop7";
  # nop71 = "nop9 nop8";
  # nop72 = "nop9 nop9";
  ruleTemplate = {
    name,
    inputs,
    outputs,
  }: ''
    (t! seq ${name} (${inputs}) (macro ${outputs}))
  '';
  rules = [
    {
      name = "mp";
      inputs = "m ${magic}";
      outputs = "m p";
    }
    {
      name = "y.";
      inputs = "y ${magic}";
      outputs = "y .";
    }
  ];
  generatedRules = lib.concatMapStringsSep "\n" ruleTemplate rules;
in {
  config = {
    psilocybin.magic = lib.mkDefault ''
      (defalias
        ⚝ (multi (chord esc ⚝) @tp)
        ⬡ (macro rpt nop1)
        ⬢ (macro rpt nop2)
      )
      (defchords esc 25
        (⚝    ) ${magic}
        (   f ) f
        (⚝  f ) esc
      )
      (deftemplate seq (vk-name input-keys output-action)
            (deffakekeys $vk-name $output-action)
            (defseq $vk-name $input-keys)
      )

      ;;⚝
      ;;(t! seq mp (m ${magic}) (macro m (unmod p))) ;; sfb
      ;;(t! seq y. (y ${magic}) (macro y (unmod .))) ;; sfb
      ${generatedRules}
      (t! seq was (w a ${magic}) (macro w (unmod a s))) ;; wao doesn't happen
      (t! seq wis (w i ${magic}) (macro w (unmod i s))) ;; wion doesn't happen
      (t! seq wes (w e ${magic}) (macro w (unmod e s))) ;; weu doesn't happen
      (t! seq makeup (m a k e ${magic}) (macro m (unmod a k e u))) ;; prevent ked overriding makeup
      (t! seq ked (k e ${magic}) (macro k (unmod e d))) ;; sfs
      (t! seq amateur (a m a t e ${magic}) (macro a (unmod m a t e u))) ;; prevent ted overriding amateur
      (t! seq lmao (l m a ${magic}) (macro l (unmod m a o))) ;; prevent mat overriding lmao
      (t! seq mat (m a ${magic}) (macro m (unmod a t))) ;; sfs
      (t! seq met (m e ${magic}) (macro m (unmod e t))) ;; sfs
      (t! seq ted (t e ${magic}) (macro t (unmod e d))) ;; sfs
      (t! seq ged (g e ${magic}) (macro g (unmod e d))) ;; sfs
      (t! seq dat (d a ${magic}) (macro d (unmod a t))) ;; sfs
      (t! seq eu (e ${magic}) (macro e (unmod u))) ;; sfb
      (t! seq lopment (l o p ${magic}) (macro l (unmod o p m e n t))) ;; opment
      (t! seq oopment (o o p ${magic}) (macro o (unmod o p m e n t))) ;; opment
      (t! seq script (s c r i p ${magic}) (macro s (unmod c r i p t))) ;; prevent ipment overriding script
      (t! seq ipment (i p ${magic}) (macro i (unmod p m e n t))) ;; ipment
      (t! seq pt (p ${magic}) (macro p (unmod t))) ;; sfb
      (t! seq rl (r ${magic}) (macro r (unmod l))) ;; sfb
      (t! seq ws (w ${magic}) (macro w (unmod s))) ;; sfb
      (t! seq gadget (g a d ${magic}) (macro g (unmod a d g))) ;; prevent adm overriding gadget
      (t! seq badge (b a d ${magic}) (macro b (unmod a d g))) ;; prevent adm overriding badge
      (t! seq adm (a d ${magic}) (macro a (unmod d m))) ;; most of dm sfb
      (t! seq dg (d ${magic}) (macro d (unmod g))) ;; sfb
      (t! seq sw (s ${magic}) (macro s (unmod w))) ;; sfb
      (t! seq lr (l ${magic}) (macro l (unmod r))) ;; sfb
      (t! seq ao (a ${magic}) (macro a (unmod o))) ;; sfb
      ;; th
      (t! seq th (spc ${magic}) (macro spc t (unmod h) ${th}))
      (t! seq the (${th} spc) (macro e spc))
      (t! seq them (${th} ${rpt}) (macro bspc e e m))
      (t! seq they (${th} y) (macro e y ${they}))
      (t! seq they're (${they} ${rpt} r) (macro bspc ' r e))
      (t! seq they've (${they} ${rpt} v) (macro bspc ' v e))
      (t! seq they'll (${they} ${rpt} l) (macro bspc ' l l))
      (t! seq then (${th} n) (macro e n))
      (t! seq these (${th} s) (macro e s e))
      (t! seq their (${th} r spc) (macro e i r spc))
      (t! seq there (${th} r e spc) (macro e r e spc))
      (t! seq through (${th} r o spc) (macro r o u g h spc))
      (t! seq those (${th} o s) (macro o s e))
      (t! seq though (${th} o h) (macro o u g h))
      ;; most common tm words are tment
      ;; put delay to avoid macro being interrupted when the key isn't released yet.
      (t! seq rtment (r t ${magic}) (macro r (unmod t m e n) 50 (unmod t))) ;; rtment
      (t! seq ntment (n t ${magic}) (macro n (unmod t m e n) 50 (unmod t))) ;; ntment
      (t! seq stment (s t ${magic}) (macro s (unmod t m e n) 50 (unmod t))) ;; stment
      (t! seq ftment (f t ${magic}) (macro f (unmod t m e n) 50 (unmod t))) ;; ftment
      (t! seq eatment (e a t ${magic}) (macro e (unmod a t m e n t))) ;; eatment
      (t! seq uitment (u i t ${magic}) (macro u (unmod i t m e n t))) ;; uitment
      (t! seq mitment (m i t ${magic}) (macro m (unmod i t m e n t))) ;; mitment

      (t! seq ion (i ${magic}) (macro i (unmod o n))) ;; ion
      (t! seq tch (t ${magic}) (macro t (unmod c h))) ;; tch
      (t! seq ver (v ${magic}) (macro v (unmod e r))) ;; ver
      (t! seq just (j ${magic}) (macro j (unmod u s t))) ;; just
      (t! seq ght (g ${magic}) (macro g (unmod h t))) ;; ght sfs
      (t! seq got (g o ${magic}) (macro g (unmod o t))) ;; got sfs
      (t! seq nts (n ${magic}) (macro n (unmod t s))) ;; nts sfs
      ;; put sfs
      (t! seq campuse (c a m p u ${magic}) (macro c (unmod a m p u s e))) ;; prevent put overriding campuses
      (t! seq artocarpuses (a r t o c a r p u ${magic}) (macro a (unmod r t o c a r p u s e))) ;; prevent put overriding artocarpuses
      (t! seq put (p u ${magic}) (macro p (unmod u t)))

      (t! seq top (t o ${magic}) (macro t (unmod o p))) ;; sfs
      (t! seq stud (s t u d ${magic}) (macro s (unmod t u d))) ;; most of the tud sfs
      (t! seq use (u ${magic}) (macro u (unmod s e))) ;; sfs
      ;;⬡
      (t! seq ing (i ${rpt}) (macro bspc i (unmod n g)))
      (t! seq ying (y ${rpt}) (macro bspc y (unmod i n g)))
      (t! seq nging (n g ${rpt}) (macro bspc n (unmod g i n) 50 (unmod g)))
      (t! seq nding (n d ${rpt}) (macro bspc n (unmod d i n g)))
      (t! seq owing (o w ${rpt}) (macro bspc o (unmod w i n g)))
      (t! seq rawing (r a w ${rpt}) (macro bspc r (unmod a w i n g)))
      (t! seq ewing (e w ${rpt}) (macro bspc e (unmod w i n g)))
      (t! seq ving (v ${rpt}) (macro v bspc (unmod i n g)))
      (t! seq hav (h ${rpt}) (macro h bspc (unmod a v))) ;; sfs
      (t! seq and (a ${rpt}) (macro a bspc (unmod n d)))
      (t! seq ure (u ${rpt}) (macro u bspc (unmod r e)))
      ;; for
      (t! seq for (f ${rpt}) (macro bspc f (unmod o r) ${for}))
      (t! seq found (${for} d) (macro bspc u n d))
      (t! seq foreign (${for} g) (macro e i g n))
      (t! seq follow (${for} w spc) (macro bspc l l o w spc)) ;; spc is necessary to prevent confliction with forward
      (t! seq forgotten (${for} n spc) (macro g o t t e n spc)) ;; spc is necessary to prevent confliction with california
      (t! seq forever (${for} r spc) (macro e v e r))
      (t! seq forward (${for} r d) (macro w a r d))
      ;; be
      (t! seq be (spc ${rpt}) (macro bspc spc b (unmod e) ${be}))
      (t! seq because (${be} c spc) (macro c a u s e spc))
      (t! seq become (${be} c o) (macro c o m e))
      (t! seq became (${be} c a) (macro c a m e))
      (t! seq becoming (${be} c i) (macro c o m i n g))
      (t! seq before (${be} f spc) (macro f o r e spc))
      (t! seq but (${be} u spc) (macro bspc u t spc))
      (t! seq beauty (${be} u t) (macro a u t y ${beauty}))
      (t! seq beautiful (${beauty} f) (macro bspc i f u l ${beautiful}))
      (t! seq beautifully (${beautiful} y) (macro l y))
      (t! seq beautify (${beauty} y) (macro bspc i f y))
      (t! seq between (${be} t n) (macro t w e e n))
      (t! seq better (${be} t e) (macro t t e r))
      (t! seq betray (${be} t r) (macro t r a y))
      (t! seq begin (${be} g i) (macro g i n))
      (t! seq began (${be} g a) (macro g a n))
      (t! seq begun (${be} g u) (macro g u n))
      (t! seq back (${be} k) (macro bspc a c k))
      ;;⬢
      (t! seq ipt (i p ${lrpt}) (macro bspc i (unmod p t)))
      (t! seq pm (p ${lrpt}) (macro bspc p (unmod m))) ;; sfb
      (t! seq tp (t ${lrpt}) (macro bspc t (unmod p))) ;; sfb
      (t! seq king (k ${lrpt}) (macro bspc k (unmod i n g)))
      (t! seq get (g ${lrpt}) (macro bspc g (unmod e t))) ;; sfs
      ;; wh
      (t! seq wh (spc ${lrpt}) (macro bspc spc w (unmod h) ${wh})) ;; defaults to wh
      (t! seq with (${wh} ${magic}) (macro bspc i t h))
      (t! seq work (${wh} k) (macro bspc o r k))
      (t! seq who (${wh} o) o)
      (t! seq why (${wh} y) y)

      (t! seq when (${wh} ${rpt}) (macro bspc e n ${when}))
      (t! seq whenever (${when} v) (macro e v e r))

      (t! seq what (${wh} a) (macro a t ${what}))
      (t! seq whatever (${what} v) (macro e v e r))
      (t! seq whats (${what} s spc) (macro ' s spc))
      (t! seq whatsoever (${what} s v) (macro s o e v e r))

      (t! seq will (${wh} i) (macro bspc i l 5 l ${will}))
      (t! seq without (${will} t) (macro bspc bspc t h o u t))

      (t! seq well (${wh} l) (macro bspc e l 5 l))
      (t! seq while (${wh} h) (macro i l e))
      (t! seq which (${wh} c) (macro i c h))
      (t! seq where (${wh} e) (macro e r e))
      (t! seq would (${wh} u) (macro bspc o u l d))
      (t! seq world (${wh} d) (macro bspc o r l d))
      (t! seq whether (${wh} t) (macro e t h e r))
    '';
  };
}
