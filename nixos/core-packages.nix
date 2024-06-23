# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# never put virtualbox,mlocate in this list

{
  environment.systemPackages = with pkgs; [
	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	wget
	btop
	neovim
	#telegram-desktop
	unzip
	unrar
	tmux
	#vscode
	neofetch
	#gparted
	trash-cli
	#zsync
	nodejs
	cargo
	lazygit
	fzf
	#apple-cursor
	papirus-icon-theme
	starship
	#celluloid
	gcc
	#github-desktop
	gitkraken
	#nordic
	libgtop
	zoxide
	eza
	arandr
	#arc-theme
	#avahi
	#baobab
	bash-completion
	bat
	bibata-cursors
	blueberry
	curl
	dex
	#discord
	dmenu
	duf
	#edid-decode
	#evince
	feh
	flameshot
	font-manager
	#fsearch
	gimp
	git
	hack-font
	hblock
	hw-probe
	#inkscape
	kitty
	warp-terminal # warp 
	lm_sensors
	#lollypop
	lshw
	#meld # for merging in git
	#most
	neofetch
	networkmanagerapplet
	nixos-generators
	#nomacs
	#qbittorrent-qt5
	rxvt-unicode
	#spotify
	tree
	#variety
	volumeicon
	widevine-cdm
	xorg.xkill
	betterlockscreen
	dunst
	xcolor
	brightnessctl
	#pamixer
	#playerctl
	#sshfs
	python3
	docker
	stremio
  lightdm-slick-greeter
  insomnia
  vieb
  appimage-run
  wineWow64Packages.base # add wine
  zellij # like tmux 
  anydesk # just for SATm
  zsh-autopair
  zsh-nix-shell
  zsh-fzf-tab
  zsh-fzf-history-search
  zsh-f-sy-h
  zsh-better-npm-completion


  # for clipboars=d things
  gnome.gpaste
  xclip
  xdotool
  coreutils-prefixed
  qrencode
  gnome.zenity
  ];
}
