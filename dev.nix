{ pkgs, ... }:

{
  imports = 
    [
      ./vscode-with-extensions.nix
      ./mysql.nix
      ./ccfs.nix
    ];

  environment.systemPackages = with pkgs; [
    oraclejdk14
    python3
  ];

  home-manager.users.laniakea.home.packages = with pkgs; [
    git jq

    nodejs nodePackages.npm

    scala sbt

    php

    docker docker-compose

    jetbrains.idea-ultimate

    dbeaver

    postman
  ];

}
