{ pkgs, ... }:

{
  imports = 
    [
      ./unstable.nix
      ./dev.nix
      ./blender.nix
    ];

  environment.systemPackages = with pkgs; [
    openssl

    home-manager
    skopeo

    lshw 
    transmission_gtk
    pciutils
    alsa-firmware
    pavucontrol

    bash binutils stdenv wget dpkg nix-index stdenv.cc patchelf
    xclip
    ne screenfetch

    plata-theme
    termite-unwrapped
    gnome3.gnome-tweaks

    htop unzip
  ];

  home-manager.users.laniakea.home.packages = with pkgs; [
    # unstable.gnomeExtensions.material-shell

    thunderbird
    vivaldi vivaldi-widevine vivaldi-ffmpeg-codecs
    torbrowser
    
    tdesktop zoom-us slack gitter skype

    spotify
    
    inkscape
    pinta
    gimp
    vlc
    
    libreoffice
  ];

}
