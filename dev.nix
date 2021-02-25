{ pkgs, ... }:

{
  imports = 
    [
      ./vscode-with-extensions.nix
      ./mysql.nix
    ];

  home-manager.users.laniakea.home.packages = with pkgs; [
    git

    nodejs nodePackages.npm

    jdk14 scala sbt

    php

    docker

    jetbrains.idea-ultimate

    dbeaver
  ];

}
