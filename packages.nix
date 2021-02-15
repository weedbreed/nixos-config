{ pkgs, ... }:

{
  imports = 
    [
      ./unstable.nix
      ./dev.nix
    ];

  environment.systemPackages = with pkgs; [
    home-manager
    
    wget ne screenfetch
    
    plata-theme
    termite-unwrapped
    gnome3.gnome-tweaks

    htop unzip

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
