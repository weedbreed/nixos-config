{ pkgs ? import <nixpkgs> {}, stdenv, fetchurl, ... }:

let
  ubuntuImage = pkgs.dockerTools.pullImage {
    imageName = "ubuntu";
    imageDigest = "sha256:e3d7ff9efd8431d9ef39a144c45992df5502c995b9ba3c53ff70c5b52a848d9c";
    sha256 = "1c31058y3dp72ml713ljmc6c1awpdw254h4pc0qyq1r3drry2f8n";
    os = "linux";
    arch = "amd64";
  };

  ccfsPath = builtins.path { path = ./.ccfs; name = "ccfs"; };

  ccfsImg = builtins.path { path = ./ccfs.dimg; };

  ccfsImage = pkgs.dockerTools.buildImage {
    name = "ccfs-image";
    tag = "latest";
    fromImage = ubuntuImage;

    contents = [ ccfsPath ];
    runAsRoot = ''
      apt update
      apt install libunwind8 icu-devtools openssl -y
      dpkg -i /ccfs.deb
      mkdir /mnt/ccfsshare
    '';

    config = {
      ExposedPorts = { "7201" = {}; "80" = {}; };
      Env = [ "Fiddler=False" "CCFSInstall=False" ];
      Entrypoint = [ "/usr/local/bin/ccfs/CCFSNetCore" ];
    };
  };
in {
  # nix.useSandbox = false;
  environment.variables.CCFSInstall = "False";
  environment.variables.Fiddler = "False";

  virtualisation.oci-containers.containers = {
    ccfs = {
      image = "ccfs";
      imageFile = ccfsImg; # "ccfs-image:latest";
      ports = [ "7201:7201" ];
    };
  };
}