{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "devel01"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  users.users.hpidcock = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    packages = with pkgs; [ home-manager ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDeEbmFNlByddlrbMW9VPQiI7KlGe6znUhJtweFefexT9brmgHNKaSoD63bYqVjrVYf3lEdilPGFpnirSbpg1hZPqFrEKAoJbDFM9R7ObXgEVt7WqKl5WNgH1tNSChCCn8Hne6BUKeqP8MQOQo5HQFZSIglsRNfumGLCH9BLIojeXeivVgXtH5ekdqR+fK+HHVdHd5bT7NfQOvT9MFNBjdSRjVTTG9xtFFuJzYqZd9ZvbXBhTq3sEAkYkFnu2SfU5LdRr+UvDQ64e/erLCLh5zqn2mbsieNaKmA/Z/Yg6LmHAgeqDmyCTf4wOPjtONHWWFEAF9b8J+NbiVxD6kVM3g7gWcKz/N1Bttleh6/+QemlzuckpDdrwOUOisZXwUS5or0DY9sJLG2cFIZNz76zZuIRXW9PI3pIcOtTXjshslupyrrP1XMtNbDDu4VSuvEk3PrS6is6bi9M1v0BbnmPbTpyV4REeJUCtPli2m0anWhFKsHMQyG+MD5sZ36s/qeYb3kdjFvU6ljYY7vDAS3Ch6WOHEKv1eT3AfzS6EwOi6HTDZ8oucGh+DMWASF4jC0+nesAjYrlBLrpn3Eh56Krkv4nxLGpjC+VJKCFG3aeT7pjw9oUMbjZpeqmIICeG74Sg2iNwMuOVEYplMLNw8mgGxzbMT51VZhjmE/dNovm+Vt4Q== haza55@gmail.com"
    ];
  };

  users.users.tlm = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    packages = with pkgs; [ home-manager ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHxsBSstfw6+55P/YPS8PyH6m58hxt3q2RK2OP1P6J/2"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  virtualisation.lxd = {
    enable = true;
  };

  services.tailscale.enable = true;
  services.openssh.enable = true;
  networking.firewall.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment?
}
