{ pkgs, ... }:

{
  imports = 
    [
      ./unstable.nix
      ./dev.nix
    ];

  environment.systemPackages = with pkgs; [
    wget ne screenfetch
    
    plata-theme
    termite-unwrapped
    gnome3.gnome-tweaks

    htop unzip

    thunderbird
    vivaldi vivaldi-widevine vivaldi-ffmpeg-codecs
    
    tdesktop zoom slack gitter skype
    
    spotify
    
    inkscape
    pinta
    gimp
    blender
    
    libreoffice
  ];

}
