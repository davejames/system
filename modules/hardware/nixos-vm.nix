{
  lib,
  modulesPath,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  boot ={
      initrd= {
        availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
        kernelModules = [];
      };
      kernelModules = [];
      extraModulePackages = [];
      loader.grub = {
        enable = true;
        device = "/dev/sda";
        useOSProber = true;
      };
  };
  networking = {
    hostName = "nixos-vm";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/06c155a8-1f1c-41dd-8d10-0c99c88430f7";
    fsType = "ext4";
  };
  swapDevices = [];

  virtualisation.virtualbox.guest.enable = true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}