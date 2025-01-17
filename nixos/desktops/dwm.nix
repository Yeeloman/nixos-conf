# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  #services.xserver.displayManager.defaultSession = "none+dwm";
  services.xserver.windowManager.dwm.enable = true;
  nixpkgs.overlays = [
  (final: prev: {
    dwm = prev.dwm.overrideAttrs (old: { src = /home/yeeloman/Documents/GitHub/suckless/dwm ;});
  })
	(final: prev: {
	 dmenu = prev.dmenu.overrideAttrs (old: { src = /home/yeeloman/Documents/GitHub/suckless/dmenu ;});
	 })
	(final: prev: {
	 slstatus = prev.slstatus.overrideAttrs (old: { src = /home/yeeloman/Documents/GitHub/suckless/slstatus ;});
	 })
  ];

}

