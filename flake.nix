{
  description = "Qeden's nixos configuration";

  inputs = {
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    catppuccin-cava = {
      url = "github:catppuccin/cava";
      flake = false;
    };

    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib.url = "github:hyprwm/contrib";

    hyprpicker.url = "github:hyprwm/hyprpicker";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";


  };

  outputs = { nixpkgs, self, ...} @ inputs:
  let
    selfPkgs = import ./pkgs;
    username = "qeden";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
    overlays.default = selfPkgs.overlay;
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ (import ./hosts/desktop) ];
        specialArgs = { host="desktop"; inherit self inputs username ; };
      };
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ (import ./hosts/laptop) ];
        specialArgs = { host="laptop"; inherit self inputs username ; };
      };
       vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ (import ./hosts/vm) ];
        specialArgs = { host="vm"; inherit self inputs username ; };
      };
    };
  };
}
