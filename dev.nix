{ pkgs, ... }:

{
  imports = 
    [
      ./vscode-with-extensions.nix
    ];

  environment.systemPackages = with pkgs; [
    git
    nodejs nodePackages.npm
    jdk11
    sbt
  ];

}
