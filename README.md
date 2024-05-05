# Psilocybin

![Psilocybin](assets/base_layout.png)

Designed for row stagger, with slides and magic key in mind.
Full layout can be seen [here](assets/full_layout.png)

## Magic rules 🪄
Magic rules are mostly used to address bad patterns, effectively reducing sfbs to almost 0 percent!

⚝ is the `magic` key(home row right index)\
⬡ is the `right repeat` key(right thumb)\
⬢ is the `left repeat` key(left outer pinky)\
⎵ is white space

| Combo  | Output  |
| ------ | ------- |
| m⚝     | mp      |
| y⚝     | y.      |
| e⚝     | eu      |
| a⚝     | ao      |
| p⚝     | pt      |
| p⬢     | pm      |
| r⚝     | rl      |
| l⚝     | lr      |
| w⚝     | ws      |
| s⚝     | sw      |
| n⚝     | nts     |
| i⚝     | ion     |
| i⬡     | ing     |
| ad⚝    | adm     |
| d⚝     | dg      |
| v⚝     | ver     |
| igh⚝   | ighbo   |
| t⚝     | tch     |
| t⬢     | tp      |
| ⎵⚝     | th      |
| ⎵⚝⎵    | the     |
| ⎵⚝⬡    | them    |
| ⎵⚝y⬡   | they'   |
| ⎵⚝y⬡r  | they're |
| ⎵⚝y⬡v  | they've |
| ⎵⚝y⬡l  | they'll |
| ⎵⚝r⎵   | their   |
| ⎵⚝re   | there   |
| ⎵⚝n    | then    |
| ⎵⚝s    | these   |
| ⎵⚝o    | tho     |
| ⎵⚝os   | those   |
| ⎵⚝oh   | though  |
| scrip⚝ | script  |
| ip⚝    | ipment  |
| lop⚝   | lopment |
| oop⚝   | oopment |
| rt⚝    | rtment  |
| nt⚝    | ntment  |
| st⚝    | stment  |
| ft⚝    | ftment  |
| eat⚝   | eatment |
| uit⚝   | uitment |
| mit⚝   | mitment |
| i⬡     | ing     |
| y⬡     | ying    |
| v⬡     | ving    |
| k⬢     | king    |
| ng⬡    | nging   |
| nd⬡    | nding   |
| ow⬡    | owing   |
| raw⬡   | rawing  |
| row⬡   | rowing  |
| ew⬡    | ewing   |
| g⚝     | ght     |
| g⬢     | get     |
| w⬢     | was     |
| h⬡     | hav     |
| j⚝     | just    |
| a⬡     | and     |
| pu⚝    | put     |
| to⚝    | top     |
| te⚝    | ted     |

## Fingering and slides

| Keys  | Fingering              |
| ----- | ---------------------- |
| sc/cs | index-middle           |
| tm/mt | index-middle           |
| gt    | index-middle           |
| pd    | middle-index           |
| dt    | index-middle           |
| bv    | maybe slide?           |
| 'a/a' | pinky-ring             |
| ue    | slide                  |
| oa    | slide                  |
| i'    | pinky ring             |

## Usage

```nix
  description = "Your NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    psilocybin = {
      url = "github:nyawox/psilocybin";
      # Recommended to not clutter your flake.lock
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, psilocybin, ...}: {
    nixosConfigurations = {
      yourHost = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # This is not a complete configuration and you need to reference
          # your normal configuration here.

          # Import the module
          psilocybin.nixosModules.psilocybin

          ({
            psilocybin = {
              enable = true;
              # ansi = true;
              # jis = true;
            };
          })
        ];
      };
    };
  };
}
```
