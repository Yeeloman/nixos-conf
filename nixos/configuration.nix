# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# https://releases.nixos.org/nixos/unstable/

{ config, pkgs, ... }:

let
	home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./core-packages.nix
      ./desktop-packages.nix
      ./home-manager.nix
      (import "${home-manager}/nixos")
      ./env-vars.nix
      #./virtualbox.nix
      #./desktops/hyprland.nix
      ./desktops/dwm.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # to remove a conflict
  #home-manager.backupFileExtension = "backup";

  # adding docker
  virtualisation.docker.enable = true;


  # Swappiness
  # boot.kernel.sysctl = { "vm.swappiness" = 10;};

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Network
  networking = {
    hostName = "TheJester"; # Define your hostname.
    enableIPv6 = false;
    firewall.enable = true;
    nameservers = [ "20.199.16.140" ];
    # If using NetworkManager:
    networkmanager.dns = "none";
    networkmanager.enable = true; # Enable networking
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  environment.etc."fuse.conf".text = ''
    user_allow_other
  '';
  security.wrappers = {
    fusermount.source  = "${pkgs.fuse}/bin/fusermount";
  };

  # Disabling X11 - go for startx
  #services.xserver.autorun = false;
  #services.xserver.displayManager.startx.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.xserver.desktopManager.plasma5.enable = true;
  # for wayland dark theme  
  #programs.dconf.enable = true;

  # https://mynixos.com/options/services.xserver.desktopManager
  
  #services.xserver.desktopManager.budgie
  #services.xserver.desktopManager.cde
  #services.xserver.desktopManager.cinnamon
  #services.xserver.desktopManager.deepin
  #services.xserver.desktopManager.enlightenment
  #services.xserver.desktopManager.gnome
  #services.xserver.desktopManager.kodi
  #services.xserver.desktopManager.lumina
  #services.xserver.desktopManager.lxqt
  #services.xserver.desktopManager.mate
  #services.xserver.desktopManager.pantheon
  #services.xserver.desktopManager.phosh
  #services.xserver.desktopManager.plasma
  #services.xserver.desktopManager.retroarch
  #services.xserver.desktopManager.surf-display
  #services.xserver.desktopManager.wallpaper
  #services.xserver.desktopManager.xfce
  #services.xserver.desktopManager.xterm

  #https://mynixos.com/options/services.xserver.windowManager

  # Configure keymap in X11
  services = {
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        tapping = true;
      };
    };
    xserver = {
      enable = true;
      displayManager = {
        lightdm = {
          enable = true;
          greeters.slick ={
            enable = true;
            font.name = "FiraCode Nerd Font";
          };
	        background = "/etc/nixos/desktops/pics/joint.png";
        };
      };
      xkb.layout = "fr";
      xkb.variant = "";
      # dpi = 96;
    };
  };

  # Select internationalisation properties.
  # console = {
  # keyMap = "be-latin1";
  #  packages=[ pkgs.terminus_font ];
  #  font="${pkgs.terminus_font}/share/consolefonts/ter-i22b.psf.gz";
  #  #useXkbConfig = true; # use xkbOptions in tty.
  #};

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  # services.printing.drivers = [pkgs.cnijfilter2];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yeeloman = {
    isNormalUser = true;
    description = "yeeloman";
    extraGroups = [ "docker" "mlocate" "networkmanager" "wheel" "vboxusers" ];
			shell = pkgs.zsh;
    packages = with pkgs; [
       firefox
    ];
  };

	programs = { 
		zsh = {
			enable = true;
			syntaxHighlighting = {
				enable = true;
			};
		};
    gpaste = {
      enable = true;
    };
	};

  # Enable automatic login for the user.
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "erik";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.nvidia.acceptLicense = true;
  
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #nix.settings.auto-optimise-store = true;

  # Auto system update
  system.autoUpgrade = {
      enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.locate = {
    enable = true;
    interval = "hourly";
  };

  #services.avahi = {
  #  enable = true;
  #  nssmdns = true;
  #  #nssmdns4 = true;
  #  ipv4 = true;
  #  ipv6 = true;
  #  publish = {
	#	  enable = true;
  #    workstation = true;
  #	};
  #};

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };

  # programs.bash = {
	#enableCompletion = true;
  #  shellInit = ''
  #    . ~/.bashrc-personal
  #  '';
  # };

  #programs.steam.enable =  true;

  services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output Virtual1 --primary --mode 1600x900 --pos 0x0 --rotate normal
  '';

  # Dbus
  #services.dbus.enable = true;

  # Fonts.

	fonts.fontDir.enable = true;
	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		liberation_ttf
		font-awesome
		cantarell-fonts
		redhat-official-fonts
		dejavu_fonts
		fira-code
		(nerdfonts.override { fonts = [ "FiraCode"]; })
	];

  # for wayland dark theme  
  #programs.dconf.enable = true;

  security.polkit.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Gvfs
  services.gvfs.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

	environment.pathsToLink = [ "/share/zsh" ];

  # Faster shutdown and reboot
   systemd.extraConfig = ''
   DefaultTimeoutStopSec=10s
   DefaultDeviceTimeoutStopSec=10s
   '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.permittedInsecurePackages = [
  	"openssl-1.1.1w" "electron-19.1.9"
  ];
}
