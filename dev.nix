{ pkgs, ... }:

{
  imports = 
    [
      ./vscode-with-extensions.nix
      # ./mysql.nix
    ];

  environment.systemPackages = with pkgs; [
    jetbrains.jdk
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
