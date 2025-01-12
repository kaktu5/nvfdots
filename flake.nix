{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nvf = {
      url = "github:kaktu5/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    nvf,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      formatter = pkgs.alejandra;
      packages.neovim =
        (nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [./modules];
        })
        .neovim;
    });
}
