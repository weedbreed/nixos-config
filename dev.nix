{ pkgs, ... }:

{
  imports = 
    [
      ./vscode-with-extensions.nix
      ./mysql.nix
      ./ccfs.nix
    ];

  environment.systemPackages = with pkgs; [
    jdk14
    python3
  ];

  home-manager.users.laniakea.home.packages = with pkgs; [
    git jq

    nodejs nodePackages.npm

    scala sbt

    php

    docker

    jetbrains.idea-ultimate

    dbeaver

    postman
  ];

}
