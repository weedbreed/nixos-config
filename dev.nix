{ pkgs, ... }:

{
  imports = 
    [
      ./vscode-with-extensions.nix
    ];

  home-manager.users.laniakea.home.packages = with pkgs; [
    git

    nodejs nodePackages.npm

    jdk11 scala sbt

    php

    docker

    jetbrains.idea-ultimate
  ];

}
