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
    thunderbird
    vivaldi vivaldi-widevine vivaldi-ffmpeg-codecs
    tdesktop
  ];

}
