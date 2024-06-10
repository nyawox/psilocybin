# Psilocybin

This flake defaults to my own layout, but it can be also used to easily configure your own magic layout🪄⭐  
You can see the details of the default layout [here](layout/README.md)  

## Usage

This enables the default psilocybin layout on your NixOS system  
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
              # ansi.enable = true;
              # jis.enable = true;
            };
          })
        ];
      };
    };
  };
}
```

### Using your own layout
Visit [here](layout/) for examples of how to configure your layout.  
Ensure you set `psilocybin.ansi.config` for layers,  
`psilocybin.config` for aliases and chords, as well as `psilocybin.magic.rules` and `psilocybin.magic.rptRules` `psilocybin.magic.wordStartingRules`, etc for your custom magic rules.  
Use `psilocybin.magic.rptRules` for magic rules that activate via repeat keys.  
If you are using your own layout, make sure to overwrite all configurations set for my layout. I plan to introduce an option like `psilocybin.customLayout = true` later on.
