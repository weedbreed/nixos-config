{ pkgs ? import <nixpkgs> {}, stdenv, fetchurl, ... }:

let
  ubuntuImage = pkgs.dockerTools.pullImage {
    imageName = "ubuntu";
    imageDigest = "sha256:e3d7ff9efd8431d9ef39a144c45992df5502c995b9ba3c53ff70c5b52a848d9c";
    sha256 = "1c31058y3dp72ml713ljmc6c1awpdw254h4pc0qyq1r3drry2f8n";
    os = "linux";
    arch = "amd64";
  };

  ccfsDebsPath = builtins.path { path = ./ccfs; name = "ccfs"; };
  ccfsImage = pkgs.dockerTools.buildImage {
    name = "ccfs";
    tag = "latest";
    fromImage = ubuntuImage;

    contents = [ ccfsDebsPath ];
    runAsRoot = ''
      export PATH=/usr/sbin:$PATH
      dpkg -i /*.deb
      mkdir /media/ccfsshare
    '';

    config = {
      ExposedPorts = { "7201" = {}; };
      Entrypoint = [ "/usr/local/bin/ccfs/CCFSNetCore" ];
    };
  };
in {
  environment.variables.CCFSInstall = "False";
  environment.variables.Fiddler = "False";

  virtualisation.oci-containers.containers = {
    ccfs = {
      image = "ccfs";
      imageFile = ccfsImage;
      volumes = [ "/media/ccfsshare:/media/ccfsshare" ];
      extraOptions = ["--network=host"];
    };
  };
}