{ config, lib, pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mysql;
    # dataDir = "~/.mysql/data";
    bind = "127.0.0.1";
    port = 3306;
  };

  home-manager.users.laniakea.home.packages = with pkgs; [ 
    mysql57 
    mysql-workbench 
  ];
}