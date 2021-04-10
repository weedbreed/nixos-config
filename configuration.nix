# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

with lib;

let home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    # rev = "1ee1d01daa19b3a6d16b5fb680c31a2bc110ce24";
    ref = "release-20.09";
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      ./local.nix
      ./packages.nix
      (import "${home-manager}/nixos")
      # (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
    ];

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  boot.loader.systemd-boot.enable = true;
  
  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp58s0.useDHCP = true;

  # networking.hostName = "laniakea-g5-nixos";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.blueman.enable = true; 

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "cyr-sun16";
    keyMap = "us";
  };

  # Enable the GNOME 3 Desktop Environment.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  
  # Configure keymap in X11
  services.xserver.layout = "us,ru";
  services.xserver.xkbOptions = "eurosign:e,grp:rctrl_rshift_toggle";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.laniakea = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "docker" ];
  };

  nixpkgs.config.allowUnfree = true; 

  environment.sessionVariables.TERMINAL = [ "termite" ];

  virtualisation.docker.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.bash = {
    shellAliases = {
      ll = "ls -lah";
      ls = "ls --color=tty";
      cfg = "su -c 'cd /etc/nixos; bash'";
      pg = "ping -c 3 8.8.8.8";

      nstulpn = "netstat -tulpn";

      tunnel-adalisk-ums-mysql = "ssh -f -N adalisk-ums-mysql";
      tunnel-adalisk-mt-mysql  = "ssh -f -N adalisk-mt-mysql";
      tunnel-adalisk-cms-mysql = "ssh -f -N adalisk-cms-mysql";
    };

    promptInit = ''
      # Provide a nice prompt if the terminal supports it.
      if [ "$TERM" != "dumb" -o -n "$INSIDE_EMACS" ]; then
        PROMPT_COLOR="1;31m"
        let $UID && PROMPT_COLOR="1;32m"
        if [ -n "$INSIDE_EMACS" -o "$TERM" == "eterm" -o "$TERM" == "eterm-color" ]; then
          # Emacs term mode doesn't support xterm title escape sequence (\e]0;)
          PS1="\n\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
        else
          PS1="\n\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
        fi
        if test "$TERM" = "xterm"; then
          PS1="\[\033]2;\h:\u:\w\007\]$PS1"
        fi
      fi

      parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
      }

      PS1="$PS1\[\033[0;33m\]\$(parse_git_branch)\[\033[0m\]\n▸ "
    '';    
  };

  home-manager.users.root = {
    programs.home-manager = {
      enable = true;
      path = "…";
    };

    programs.git = {
      enable = true;
      userName = "Aleksandr Bogdanov (as root)";
      userEmail = "sasha_bogdanov_dev@yahoo.com";
    };
  };

  home-manager.users.laniakea = {
    programs.home-manager = {
      enable = true;
      path = "…";
    };

    programs.git = {
      enable = true;
      userName = "Aleksandr Bogdanov";
      userEmail = "sasha_bogdanov_dev@yahoo.com";
    };

    programs.termite = {
      enable = true;
      backgroundColor = "rgba(0,0,0,1.0)";
      font = "Monospace 10";
      allowBold = true;
    };
  };

  security.sudo.configFile = ''
    # Keep SSH_AUTH_SOCK so that pam_ssh_agent_auth.so can do its magic.
    Defaults env_keep+=SSH_AUTH_SOCK
    Defaults rootpw

    # "root" is allowed to do anything.
    root        ALL=(ALL:ALL) SETENV: ALL

    # extraRules
    %wheel	ALL=(ALL:ALL)	SETENV: ALL

    # Keep terminfo database for root and %wheel.
    Defaults:root,%wheel env_keep+=TERMINFO_DIRS
    Defaults:root,%wheel env_keep+=TERMINFO    
  '';

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}

