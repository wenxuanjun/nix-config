{ lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/all-hardware.nix")
  ];

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "ehci_pci" "ahci" "xhci_pci" "nvme" "usbhid" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0771-5EEB";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=25%" "mode=755" ];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-uuid/9758cc25-9432-4b0b-b7aa-0a0a7be11f87";
    neededForBoot = true;
    fsType = "btrfs";
    options = [ "subvol=@root" "compress=zstd" ];
  };

  fileSystems."/persist/home" = {
    device = "/dev/disk/by-uuid/9758cc25-9432-4b0b-b7aa-0a0a7be11f87";
    fsType = "btrfs";
    options = [ "subvol=@home" "compress=zstd" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/9758cc25-9432-4b0b-b7aa-0a0a7be11f87";
    fsType = "btrfs";
    options = [ "subvol=@nix" "compress=zstd" "noatime" ];
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 200;
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
