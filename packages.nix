{ pkgs, ... }:

{
  imports = 
    [
      ./unstable.nix
      ./dev.nix
    ];

  environment.systemPackages = with pkgs; [
    home-manager
    skopeo

    pciutils
    pavucontrol

    bash binutils stdenv wget dpkg nix-index stdenv.cc patchelf
    ne screenfetch

    plata-theme
    termite-unwrapped
    gnome3.gnome-tweaks

    htop unzip
  ];

  home-manager.users.laniakea.home.packages = with pkgs; [

    thunderbird
    vivaldi vivaldi-widevine vivaldi-ffmpeg-codecs
    
    tdesktop zoom-us slack gitter skype

    spotify
    
    inkscape
    pinta
    gimp
    blender
    
    libreoffice
  ];

}
