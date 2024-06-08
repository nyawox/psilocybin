{
  config,
  lib,
  ...
}: let
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
  cfg = config.psilocybin;
  ruleTemplate = {
    name,
    inputs,
    outputs,
  }: ''
    (t! seq ${name} (${inputs}) (macro ${outputs}))
  '';
  generatedRules = lib.concatMapStringsSep "\n" ruleTemplate cfg.psilocybin.magic.rules;
  rptRuleTemplate = {
    name,
    inputs,
    outputs,
  }: ''
    (t! seq ${name} (${inputs}) (macro bspc ${outputs}))
  '';
  generatedRptRules = lib.concatMapStringsSep "\n" rptRuleTemplate cfg.psilocybin.magic.rptRules;
in {
  config = {
    psilocybin.magic.extraConfig = lib.mkDefault ''
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

      ${generatedRules}
      ${generatedRptRules}
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
    psilocybin.magic.rules = [
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
      {
        name = "was";
        inputs = "w a ${magic}";
        outputs = "w a s";
      } # wao doesn't happen
      {
        name = "wis";
        inputs = "w i ${magic}";
        outputs = "w i s";
      } # wion doesn't happen
      {
        name = "wes";
        inputs = "w e ${magic}";
        outputs = "w e s";
      } # weu doesn't happen
      {
        name = "makeup";
        inputs = "m a k e ${magic}";
        outputs = "m a k e u";
      } # prevent ked overriding makeup
      {
        name = "ked";
        inputs = "k e ${magic}";
        outputs = "k e d";
      } # sfs
      {
        name = "amateur";
        inputs = "a m a t e ${magic}";
        outputs = "a m a t e u";
      } # prevent ted overriding amateur
      {
        name = "lmao";
        inputs = "l m a ${magic}";
        outputs = "l m a o";
      } # prevent mat overriding lmao
      {
        name = "mat";
        inputs = "m a ${magic}";
        outputs = "m a t";
      } # sfs
      {
        name = "met";
        inputs = "m e ${magic}";
        outputs = "m e t";
      } # sfs
      {
        name = "ted";
        inputs = "t e ${magic}";
        outputs = "t e d";
      } # sfs
      {
        name = "ged";
        inputs = "g e ${magic}";
        outputs = "g e d";
      } # sfs
      {
        name = "dat";
        inputs = "d a ${magic}";
        outputs = "d a t";
      } # sfs
      {
        name = "eu";
        inputs = "e ${magic}";
        outputs = "e u";
      } # sfb
      {
        name = "lopment";
        inputs = "l o p ${magic}";
        outputs = "l o p m e n t";
      } # opment
      {
        name = "oopment";
        inputs = "o o p ${magic}";
        outputs = "o o p m e n t";
      } # opment
      {
        name = "script";
        inputs = "s c r i p ${magic}";
        outputs = "s c r i p t";
      } # prevent ipment overriding script
      {
        name = "ipment";
        inputs = "i p ${magic}";
        outputs = "i p m e n t";
      } # ipment
      {
        name = "pt";
        inputs = "p ${magic}";
        outputs = "p t";
      } # sfb
      {
        name = "rl";
        inputs = "r ${magic}";
        outputs = "r l";
      } # sfb
      {
        name = "ws";
        inputs = "w ${magic}";
        outputs = "w s";
      } # sfb
      {
        name = "gadget";
        inputs = "g a d ${magic}";
        outputs = "g a d g";
      } # prevent adm overriding gadget
      {
        name = "badge";
        inputs = "b a d ${magic}";
        outputs = "b a d g";
      } # prevent adm overriding badge
      {
        name = "adm";
        inputs = "a d ${magic}";
        outputs = "a d m";
      } # most of dm sfb
      {
        name = "dg";
        inputs = "d ${magic}";
        outputs = "d g";
      } # sfb
      {
        name = "sw";
        inputs = "s ${magic}";
        outputs = "s w";
      } # sfb
      {
        name = "lr";
        inputs = "l ${magic}";
        outputs = "l r";
      } # sfb
      {
        name = "ao";
        inputs = "a ${magic}";
        outputs = "a o";
      } # sfb
      {
        name = "th";
        inputs = "spc ${magic}";
        outputs = "spc t h ${th}";
      } # defaults to th
      {
        name = "the";
        inputs = "${th} spc";
        outputs = "e spc";
      }
      {
        name = "them";
        inputs = "${th} ${rpt}";
        outputs = "e m";
      }
      {
        name = "they";
        inputs = "${th} y";
        outputs = "e y ${they}";
      }
      {
        name = "they're";
        inputs = "${they} ${rpt} r";
        outputs = "' r e";
      }
      {
        name = "they've";
        inputs = "${they} ${rpt} v";
        outputs = "' v e";
      }
      {
        name = "they'll";
        inputs = "${they} ${rpt} l";
        outputs = "' l l";
      }
      {
        name = "then";
        inputs = "${th} n";
        outputs = "e n";
      }
      {
        name = "these";
        inputs = "${th} s";
        outputs = "e s e";
      }
      {
        name = "their";
        inputs = "${th} r spc";
        outputs = "e i r spc";
      }
      {
        name = "there";
        inputs = "${th} r e spc";
        outputs = "e r e spc";
      }
      {
        name = "through";
        inputs = "${th} r o spc";
        outputs = "r o u g h spc";
      }
      {
        name = "those";
        inputs = "${th} o s";
        outputs = "o s e";
      }
      {
        name = "though";
        inputs = "${th} o h";
        outputs = "o u g h";
      }
      {
        name = "rtment";
        inputs = "r t ${magic}";
        outputs = "r t m e n 50 t";
      } # rtment
      {
        name = "ntment";
        inputs = "n t ${magic}";
        outputs = "n t m e n 50 t";
      } # ntment
      {
        name = "stment";
        inputs = "s t ${magic}";
        outputs = "s t m e n 50 t";
      } # stment
      {
        name = "ftment";
        inputs = "f t ${magic}";
        outputs = "f t m e n 50 t";
      } # ftment
      {
        name = "eatment";
        inputs = "e a t ${magic}";
        outputs = "e a t m e n t";
      } # eatment
      {
        name = "uitment";
        inputs = "u i t ${magic}";
        outputs = "u i t m e n t";
      } # uitment
      {
        name = "mitment";
        inputs = "m i t ${magic}";
        outputs = "m i t m e n t";
      } # mitment
      {
        name = "ion";
        inputs = "i ${magic}";
        outputs = "i o n";
      } # ion
      {
        name = "tch";
        inputs = "t ${magic}";
        outputs = "t c h";
      } # tch
      {
        name = "ver";
        inputs = "v ${magic}";
        outputs = "v e r";
      } # ver
      {
        name = "just";
        inputs = "j ${magic}";
        outputs = "j u s t";
      } # just
      {
        name = "ght";
        inputs = "g ${magic}";
        outputs = "g h t";
      } # ght sfs
      {
        name = "got";
        inputs = "g o ${magic}";
        outputs = "g o t";
      } # got sfs
      {
        name = "nts";
        inputs = "n ${magic}";
        outputs = "n t s";
      } # nts sfs
      {
        name = "campuses";
        inputs = "c a m p u ${magic}";
        outputs = "c a m p u s e";
      } # prevent put overriding campuses
      {
        name = "artocarpuses";
        inputs = "a r t o c a r p u ${magic}";
        outputs = "a r t o c a r p u s e";
      } # prevent put overriding artocarpuses
      {
        name = "put";
        inputs = "p u ${magic}";
        outputs = "p u t";
      } # sfs
      {
        name = "top";
        inputs = "t o ${magic}";
        outputs = "t o p";
      } # sfs
      {
        name = "stud";
        inputs = "s t u d ${magic}";
        outputs = "s t u d";
      } # most of the tud sfs
      {
        name = "use";
        inputs = "u ${magic}";
        outputs = "u s e";
      } # sfs
    ];
    psilocybin.magic.rptRules = [
      {
        name = "ing";
        inputs = "i ${rpt}";
        outputs = "i n g";
      }
      {
        name = "ying";
        inputs = "y ${rpt}";
        outputs = "y i n g";
      }
      {
        name = "nging";
        inputs = "n g ${rpt}";
        outputs = "n g i n 50 g";
      }
      {
        name = "nding";
        inputs = "n d ${rpt}";
        outputs = "n d i n g";
      }
      {
        name = "owing";
        inputs = "o w ${rpt}";
        outputs = "o w i n g";
      }
      {
        name = "rawing";
        inputs = "r a w ${rpt}";
        outputs = "r a w i n g";
      }
      {
        name = "ewing";
        inputs = "e w ${rpt}";
        outputs = "e w i n g";
      }
      {
        name = "ving";
        inputs = "v ${rpt}";
        outputs = "v i n g";
      }
      {
        name = "hav";
        inputs = "h ${rpt}";
        outputs = "h a v";
      } # sfs
      {
        name = "and";
        inputs = "a ${rpt}";
        outputs = "a n d";
      }
      {
        name = "ure";
        inputs = "u ${rpt}";
        outputs = "u r e";
      }
    ];
  };
}
