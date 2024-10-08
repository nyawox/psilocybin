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
  str = "nop4 nop0";
  though = "nop4 nop1";
  stroke = "nop4 nop2";
  those = "nop4 nop3";
  them = "nop4 nop4";
  strip = "nop4 nop5";
  strike = "nop4 nop6";
  thumb = "nop4 nop7";
  stretch = "nop4 nop8";
  stress = "nop4 nop9";
  which = "nop5 nop0";
  strange = "nop5 nop1";
  structure = "nop5 nop2";
  work = "nop5 nop3";
  thank = "nop5 nop4";
  third = "nop5 nop5";
  thing = "nop5 nop6";
  think = "nop5 nop7";
  mp = "nop5 nop8";
  follower = "nop5 nop9";
  back = "nop6 nop0";
  works = "nop6 nop1";
  force = "nop6 nop2";
  who = "nop6 nop3";
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
in {
  config = {
    psilocybin.magic.wordStartingRptRules = lib.mkDefault [
      {
        name = "be";
        inputs = "${rpt}";
        outputs = "b e ${be}";
      }
      {
        name = "wh";
        inputs = "${lrpt}";
        outputs = "w h ${wh}";
      } # defaults to wh
      {
        name = "strange";
        inputs = "s t ${rpt}";
        outputs = "s t r a n g e ${strange}";
      }
    ];
    psilocybin.magic.wordStartingRules = lib.mkDefault [
      {
        name = "th";
        inputs = "${magic}";
        outputs = "t h ${th}";
      } # defaults to th
      {
        name = "str";
        inputs = "s t ${magic}";
        outputs = "s t r ${str}";
      }
      {
        name = "map";
        inputs = "m ${magic} spc";
        outputs = "m a p spc";
      }
      {
        name = "maps";
        inputs = "m ${magic} ${rpt}";
        outputs = "m a p s";
      }
      {
        name = "maple";
        inputs = "m ${magic} l";
        outputs = "m a p l e";
      }
      {
        name = "mapping";
        inputs = "m ${magic} i";
        outputs = "m a p p i n g";
      }
    ];
    psilocybin.magic.rules = lib.mkDefault [
      {
        name = "mp";
        inputs = "m ${magic}";
        outputs = "m p ${mp}";
      }
      {
        name = "keymap";
        inputs = "k e y m ${magic}";
        outputs = "k e y m a p";
      }
      {
        name = "heatmap";
        inputs = "h e a t m ${magic}";
        outputs = "h e a t m a p";
      }
      {
        name = "remap";
        inputs = "r e m ${magic}";
        outputs = "r e m a p";
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
        name = "the";
        inputs = "${th} spc";
        outputs = "e spc";
      }
      {
        name = "them";
        inputs = "${th} ${rpt}";
        outputs = "e m ${them}";
      }
      {
        name = "this";
        inputs = "${th} i spc";
        outputs = "i s spc";
      }
      {
        name = "thin";
        inputs = "${th} i n";
        outputs = "i n";
      } # attempt to fix conflicting with then
      {
        name = "thick";
        inputs = "${th} i c";
        outputs = "i c k";
      }
      {
        name = "thank";
        inputs = "${th} a k";
        outputs = "a n k ${thank}";
      }
      {
        name = "thanks";
        inputs = "${thank} ${magic}";
        outputs = "s";
      }
      {
        name = "thanking";
        inputs = "${thank} i";
        outputs = "i n g";
      }
      {
        name = "third";
        inputs = "${th} i d";
        outputs = "i r d ${third}";
      }
      {
        name = "thirdly";
        inputs = "${third} y";
        outputs = "l y";
      }
      {
        name = "think";
        inputs = "${th} i k";
        outputs = "i n k ${think}";
      }
      {
        name = "thinks";
        inputs = "${think} ${magic}";
        outputs = "s";
      }
      {
        name = "thinking";
        inputs = "${think} i";
        outputs = "i n g";
      }
      {
        name = "things";
        inputs = "${thing} ${magic}";
        outputs = "s";
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
        name = "therefore";
        inputs = "${th} r f";
        outputs = "e r e f o r e";
      }
      {
        name = "through";
        inputs = "${th} r o spc";
        outputs = "r o u g h spc";
      }
      {
        name = "those";
        inputs = "${th} o s";
        outputs = "o s e ${those}";
      }
      {
        name = "thousand";
        inputs = "${those} d";
        outputs = "bspc bspc u s a n d";
      }
      {
        name = "thoughts";
        inputs = "${though} s";
        outputs = "t s";
      }
      {
        name = "themselves";
        inputs = "${them} s";
        outputs = "s e l v e s";
      }
      {
        name = "theme";
        inputs = "${th} m";
        outputs = "e m e";
      }
      {
        name = "thumb";
        inputs = "${th} u m";
        outputs = "u m b";
      }
      {
        name = "thump";
        inputs = "${thumb} ${magic}";
        outputs = "bspc p";
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
        name = "pot";
        inputs = "p o ${magic}";
        outputs = "p o t";
      } # sfs
      {
        name = "pet";
        inputs = "p e ${magic}";
        outputs = "p e t";
      } # sfs
      {
        name = "top";
        inputs = "t o ${magic}";
        outputs = "t o p";
      } # sfs
      {
        name = "tup";
        inputs = "t u ${magic}";
        outputs = "t u p";
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

      ### for
      {
        name = "force";
        inputs = "${for} c";
        outputs = "c e ${force}";
      }
      {
        name = "forced";
        inputs = "${force} ${rpt}";
        outputs = "d";
      }
      {
        name = "forces";
        inputs = "${force} ${magic}";
        outputs = "s";
      }
      {
        name = "forcing";
        inputs = "${force} i";
        outputs = "bspc i n g";
      }
      {
        name = "found";
        inputs = "${for} d";
        outputs = "bspc u n d";
      }
      {
        name = "foreign";
        inputs = "${for} g spc";
        outputs = "e i g n spc";
      }
      {
        name = "forgot";
        inputs = "${for} g o";
        outputs = "g o t";
      }
      {
        name = "forget";
        inputs = "${for} g e";
        outputs = "g e t";
      }
      {
        name = "follow";
        inputs = "${for} w spc";
        outputs = "bspc l l o w spc";
      } # spc is necessary to prevent confliction with forward
      {
        name = "following";
        inputs = "${for} w i";
        outputs = "bspc l l o w i n g";
      }
      {
        name = "follows";
        inputs = "${for} w ${magic}";
        outputs = "bspc l l o w s";
      }
      {
        name = "follower";
        inputs = "${for} w e";
        outputs = "bspc l l o w e r ${follower}";
      }
      {
        name = "followers";
        inputs = "${follower} ${magic}";
        outputs = "s";
      }
      {
        name = "followed";
        inputs = "${follower} ${rpt}";
        outputs = "bspc d";
      }
      {
        name = "forgotten";
        inputs = "${for} n spc";
        outputs = "g o t t e n spc";
      } # spc is necessary to prevent confliction with california
      {
        name = "forever";
        inputs = "${for} r spc";
        outputs = "e v e r spc";
      }
      {
        name = "forward";
        inputs = "${for} r d";
        outputs = "w a r d";
      }
      ### be
      {
        name = "because";
        inputs = "${be} c spc";
        outputs = "c a u s e spc";
      }
      {
        name = "become";
        inputs = "${be} c o";
        outputs = "c o m e";
      }
      {
        name = "became";
        inputs = "${be} c a";
        outputs = "c a m e";
      }
      {
        name = "becoming";
        inputs = "${be} c i";
        outputs = "c o m i n g";
      }
      {
        name = "before";
        inputs = "${be} f spc";
        outputs = "f o r e spc";
      }
      {
        name = "but";
        inputs = "${be} u spc";
        outputs = "bspc u t spc";
      }
      {
        name = "beauty";
        inputs = "${be} u t";
        outputs = "a u t y ${beauty}";
      }
      {
        name = "beautiful";
        inputs = "${beauty} f";
        outputs = "bspc i f u l ${beautiful}";
      }
      {
        name = "beautifully";
        inputs = "${beautiful} y";
        outputs = "l y";
      }
      {
        name = "beautify";
        inputs = "${beauty} y";
        outputs = "bspc i f y";
      }
      {
        name = "between";
        inputs = "${be} t n";
        outputs = "t w e e n";
      }
      {
        name = "better";
        inputs = "${be} t e";
        outputs = "t t e r";
      }
      {
        name = "betray";
        inputs = "${be} t r";
        outputs = "t r a y";
      }
      {
        name = "begin";
        inputs = "${be} g i";
        outputs = "g i n";
      }
      {
        name = "began";
        inputs = "${be} g a";
        outputs = "g a n";
      }
      {
        name = "begun";
        inputs = "${be} g u";
        outputs = "g u n";
      }
      {
        name = "being";
        inputs = "${be} i";
        outputs = "i n g";
      }
      {
        name = "back";
        inputs = "${be} k";
        outputs = "bspc a c k ${back}";
      }
      {
        name = "background";
        inputs = "${back} o";
        outputs = "g r o u n d";
      }
      ## wh
      {
        name = "with";
        inputs = "${wh} ${magic}";
        outputs = "bspc i t h";
      }
      {
        name = "work";
        inputs = "${wh} p";
        outputs = "bspc o r k ${work}";
      }
      {
        name = "working";
        inputs = "${work} i";
        outputs = "i n g";
      }
      {
        name = "workman";
        inputs = "${work} m";
        outputs = "m a n";
      }
      {
        name = "works";
        inputs = "${work} ${magic}";
        outputs = "s ${works}";
      }
      {
        name = "workspace";
        inputs = "${works} a";
        outputs = "p a c e";
      }
      {
        name = "workstation";
        inputs = "${works} i";
        outputs = "t a t i o n";
      }
      {
        name = "workshop";
        inputs = "${works} o";
        outputs = "h o p";
      }
      {
        name = "workers";
        inputs = "${works} e";
        outputs = "bspc e r s";
      }
      {
        name = "workaround";
        inputs = "${work} a";
        outputs = "a r o u n d";
      }
      {
        name = "workable";
        inputs = "${work} b";
        outputs = "a b l e";
      }
      {
        name = "worked";
        inputs = "${work} e";
        outputs = "e d";
      }
      {
        name = "workplace";
        inputs = "${work} ${rpt}";
        outputs = "p l a c e";
      }
      {
        name = "workflow";
        inputs = "${work} f";
        outputs = "f l o w";
      }
      {
        name = "workout";
        inputs = "${work} o";
        outputs = "o u t";
      }
      {
        name = "who";
        inputs = "${wh} o";
        outputs = "o ${who}";
      }
      {
        name = "whoever";
        inputs = "${who} v";
        outputs = "e v e r";
      }
      {
        name = "whole";
        inputs = "${who} l";
        outputs = "l e";
      }
      {
        name = "whose";
        inputs = "${who} s";
        outputs = "s e";
      }
      {
        name = "when";
        inputs = "${wh} ${rpt}";
        outputs = "e n ${when}";
      }
      {
        name = "whenever";
        inputs = "${when} v";
        outputs = "e v e r";
      }
      {
        name = "what";
        inputs = "${wh} a";
        outputs = "a t ${what}";
      }
      {
        name = "whatever";
        inputs = "${what} v";
        outputs = "e v e r";
      }
      {
        name = "whats";
        inputs = "${what} s spc";
        outputs = "' s spc";
      }
      {
        name = "whatsoever";
        inputs = "${what} s v";
        outputs = "s o e v e r";
      }
      {
        name = "will";
        inputs = "${wh} i";
        outputs = "bspc i l 5 l ${will}";
      }
      {
        name = "willing";
        inputs = "${will} ${rpt}";
        outputs = "i n g";
      }
      {
        name = "without";
        inputs = "${will} t";
        outputs = "bspc bspc t h o u t";
      }
      {
        name = "well";
        inputs = "${wh} l";
        outputs = "bspc e l 5 l";
      }
      {
        name = "while";
        inputs = "${wh} h";
        outputs = "i l e";
      }
      {
        name = "which";
        inputs = "${wh} c";
        outputs = "i c h ${which}";
      }
      {
        name = "whichever";
        inputs = "${which} v";
        outputs = "e v e r";
      }
      {
        name = "where";
        inputs = "${wh} e";
        outputs = "e r e";
      }
      {
        name = "would";
        inputs = "${wh} u";
        outputs = "bspc o u l d";
      }
      {
        name = "world";
        inputs = "${wh} d";
        outputs = "bspc o r l d";
      }
      {
        name = "whether";
        inputs = "${wh} t";
        outputs = "e t h e r";
      }
      # str
      {
        name = "strong";
        inputs = "${str} o spc";
        outputs = "o n g spc";
      }
      {
        name = "strongly";
        inputs = "${str} o y";
        outputs = "o n g l y";
      }
      {
        name = "strokes";
        inputs = "${stroke} ${magic}";
        outputs = "s";
      }
      {
        name = "string";
        inputs = "${str} i spc";
        outputs = "i n g spc";
      }
      {
        name = "strings";
        inputs = "${str} i ${magic}";
        outputs = "i n g s";
      }
      {
        name = "strike";
        inputs = "${str} ${lrpt}";
        outputs = "i k e ${strike}";
      }
      {
        name = "striking";
        inputs = "${strike} i";
        outputs = "bspc i n g";
      }
      {
        name = "strive";
        inputs = "${str} v spc";
        outputs = "i v e spc";
      }
      {
        name = "striving";
        inputs = "${str} v i";
        outputs = "i v i n g";
      }
      {
        name = "striped";
        inputs = "${strip} e";
        outputs = "e d";
      }
      {
        name = "stripped";
        inputs = "${strip} ${rpt}";
        outputs = "p e d";
      }
      {
        name = "stripes";
        inputs = "${strip} ${magic}";
        outputs = "e s";
      }
      {
        name = "stripping";
        inputs = "${strip} ${lrpt}";
        outputs = "p i n g";
      }
      {
        name = "street";
        inputs = "${str} e spc";
        outputs = "e e t spc";
      }
      {
        name = "stretching";
        inputs = "${stretch} i";
        outputs = "i n g";
      }
      {
        name = "stretched";
        inputs = "${stretch} ${rpt}";
        outputs = "e d";
      }
      {
        name = "stretches";
        inputs = "${stretch} ${magic}";
        outputs = "e s";
      }
      {
        name = "stressed";
        inputs = "${stress} e";
        outputs = "e d";
      }
      {
        name = "straight";
        inputs = "${str} a spc";
        outputs = "a i g h t spc";
      }
      {
        name = "struggle";
        inputs = "${str} u spc";
        outputs = "u g g l e spc";
      }
      {
        name = "struggling";
        inputs = "${str} u i";
        outputs = "u g g l i n g";
      }
      {
        name = "structure";
        inputs = "${str} ${rpt}";
        outputs = "u c t u r e ${structure}";
      }
      {
        name = "structural";
        inputs = "${structure} a";
        outputs = "bspc a l";
      }
      {
        name = "stroke";
        inputs = "${strange} o";
        outputs = "bspc bspc bspc bspc o k e ${stroke}";
      }
      {
        name = "stretch";
        inputs = "${strange} e";
        outputs = "bspc bspc bspc bspc e t c h ${stretch}";
      }
      {
        name = "struck";
        inputs = "${strange} u";
        outputs = "bspc bspc bspc bspc u c k";
      }
      {
        name = "strip";
        inputs = "${strange} i";
        outputs = "bspc bspc bspc bspc i p ${strip}";
      }
      {
        name = "stress";
        inputs = "${strange} ${magic}";
        outputs = "bspc bspc bspc bspc e s s ${stress}";
      }
      {
        name = "unmap";
        inputs = "u n m ${magic} spc";
        outputs = "u n m a p spc";
      }
      {
        name = "unmapping";
        inputs = "u n m ${magic} i";
        outputs = "u n m a p i n g";
      }
    ];
    psilocybin.magic.rptRules = lib.mkDefault [
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
      {
        name = "ipt";
        inputs = "i p ${lrpt}";
        outputs = "i p t";
      }
      {
        name = "pm";
        inputs = "p ${lrpt}";
        outputs = "p m";
      } # sfb
      {
        name = "tp";
        inputs = "t ${lrpt}";
        outputs = "t p";
      } # sfb
      {
        name = "king";
        inputs = "k ${lrpt}";
        outputs = "k i n g";
      }
      {
        name = "get";
        inputs = "g ${lrpt}";
        outputs = "g e t";
      } # sfs
      {
        name = "for";
        inputs = "f ${rpt}";
        outputs = "f o r ${for}";
      }
      {
        name = "strength";
        inputs = "${str} e ${rpt}";
        outputs = "e n g t h";
      }
      {
        name = "stronger";
        inputs = "${str} o ${rpt}";
        outputs = "o n g e r";
      }
      {
        name = "strongest";
        inputs = "${str} o ${lrpt}";
        outputs = "o n g e s t";
      }
      {
        name = "though";
        inputs = "${th} o ${rpt}";
        outputs = "o u g h ${though}";
      }
      {
        name = "thing";
        inputs = "${th} i ${rpt}";
        outputs = "i n g ${thing}";
      }
    ];
  };
}
