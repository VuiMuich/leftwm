{ config, pkgs, ... }:
{
  system.stateVersion = "23.05";
  boot.initrd.availableKernelModules = [
    "virtio_net"
    "virtio_pci"
    "virtio_mmio"
    "virtio_blk"
    "virtio_scsi"
    "9p"
    "9pnet_virtio"
  ];
  boot.initrd.kernelModules = [
    "virtio_balloon"
    "virtio_console"
    "virtio_rng"
  ];

  virtualisation.diskImage = "./.nixos-vm/${config.system.name}.qcow2";

  nix.settings.experimental-features = "nix-command flakes";

  users.users.leftwm = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "";
    home = "/home/leftwm";
  };

  networking = {
    hostName = "leftwm";
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    bat
    helix
    nushell
  ];

  programs.git.enable = true;
  services = {
    openssh.enable = true;
    spice-vdagentd.enable = true;
    qemuGuest.enable = true;

    xserver = {
      videoDrivers = [ "qxl" ];
      enable = true;

      desktopManager.xterm.enable = false;
      windowManager.leftwm.enable = true;
      xkb = {
        layout = "vou";
        extraLayouts.vou = {
          description = "VOU layout";
          languages = [
            "eng"
            "de"
          ];
          symbolsFile =
            builtins.fetchTree {
              type = "github";
              owner = "VuiMuich";
              repo = "vou-layout";
              rev = "085825d9779c80e7579e6b3bc659a8f33976a6ff";
            }
            + "/xkb-custom/symbols/vou";
        };
      };
    };
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "leftwm";
  };

}
