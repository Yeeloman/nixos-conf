{ config, pkgs, ... }:

{
  users.users.yeeloman.isNormalUser = true;

  home-manager.users.yeeloman = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie ];
    #programs.kitty = {
	  #	enable = true;
	  #	font = {
	  #		name = "FiraCode";
	  #		size = 15;
	  #	};
	  #	theme = "Catppuccin-Mocha";
	  #	settings = {
	  #		background_opacity = "0.7";
	  #		window_decorations = "NONE";
	  #		hide_window_decorations = "yes";
	  #	};
	  #};
    programs.zsh = {
		enable = true;
    # if you want a normal zellij startup
    # eval "$(zellij setup --generate-auto-start zsh)"
    initExtra = ''
      source ~/.config/myScripts/zellijSession
    '';
		autocd = true;
		autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;
		defaultKeymap = "viins";
		dotDir = ".config/zsh";
		history = {
			path = ".cache/zsh/history";
			save = 20000;
			size = 20000;
		};
		completionInit = ''
			autoload -Uz compinit
			compinit
		'';
		historySubstringSearch = {
			enable = true;
			searchDownKey = [ "^[[A" "^P" ];
			searchUpKey = [ "^[[B" "^N" ];
		};
		envExtra = '' 
			export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
			export PATH=$HOME/.local/bin:$HOME/.bin:$PATH
		'';
		initExtraBeforeCompInit = ''
			zstyle ':completion:*' completer _menu _expand _complete _correct _approximate
			zstyle ':completion:*' completions 0
			zstyle ':completion:*' glob 0
			zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
			zstyle ':completion:*' max-errors 10
			zstyle ':completion:*' special-dirs true
			zstyle ':completion:*' substitute 1
			zstyle :compinstall filename '/home/yeeloman/.config/zsh/.zshrc'
		'';

    plugins = with pkgs; [
      {
        name = "formarks";
        src = fetchFromGitHub {
          owner = "wfxr";
          repo = "formarks";
          rev = "8abce138218a8e6acd3c8ad2dd52550198625944";
          sha256 = "1wr4ypv2b6a2w9qsia29mb36xf98zjzhp3bq4ix6r3cmra3xij90";
        };
        file = "formarks.plugin.zsh";
      }
      {
        # https://github.com/Yumasi/nixos-home/blob/main/zsh.nix
        # for more zsh plugins
        # to get rev go to the commit you want copy paste
        # to get the sha256 do this commmand
        # nix-prefetch-url --unpack https://github.com/User/Repo/rev.tar.gz
        name = "zsh-autopair";
        src = fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "34a8bca0c18fcf3ab1561caef9790abffc1d3d49";
          sha256 = "1h0vm2dgrmb8i2pvsgis3lshc5b0ad846836m62y8h3rdb3zmpy1";
        };
        file = "autopair.zsh";
      }
      {
        name = "fzf-tab";
        src = fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "14e16f0d36ae9938e28b2f6efdb7344cd527a1a6";
          sha256 = "0cp2f7qrggpn8sdi57v5a4qf8dbhqjc06py5ihxp5qkw76fn1j53";
        };
        file = "fzf-tab.plugin.zsh";
      }
      {
        name = "zsh-f-sy-h";
        src = fetchFromGitHub {
          owner = "z-shell";
          repo = "F-Sy-H";
          rev = "3dea11a9018061e6e3a77e529b79e5654679d3a0";
          sha256 = "1j6l8wqxdjna7hq7ch79nkgb3952syp9b3fx9gaj3jxg3l9qciq0";
        };
        file = "F-Sy-H.plugin.zsh";
      }
      {
        name = "zsh-better-npm-completion";
        src = fetchFromGitHub {
          owner = "lukechilds";
          repo = "zsh-better-npm-completion";
          rev = "47e5987ca422de43784f9d76311d764f82af2717";
          sha256 = "0n9pd29rr7y6k5v4rzhpd94nsixsscdmhgvwisvbfz843pfikr5f";
        };
        file = "zsh-better-npm-completion.plugin.zsh";
      }
      {
        name = "zsh-nix-shell";
        src = fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "82ca15e638cc208e6d8368e34a1625ed75e08f90";
          sha256 = "1l99ayc9j9ns450blf4rs8511lygc2xvbhkg1xp791abcn8krn26";
        };
        file = "nix-shell.plugin.zsh";
      }
      #{
      # name = "";
      # src = fetchFromGitHub {
      #   owner = "";
      #   repo = "";
      #   rev = "";
      #   sha256 = "";
      # };
      # file = "";
      #}
    ];
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

	home.shellAliases = {
	l = "eza -1 --icons";
 	ls="exa --icons -s extension --group-directories-first";
 	ll = "eza -la --icons";
 	ld = "eza -lD --icons";
 	cp = "cp -i";
 	mv = "mv -i";
 	mkdir = "mkdir -p";
 	cat = "bat";
 	da = "date '+Y-%m-%d %A %T %Z'";
	grep = "grep --color=always";
	du = "dust -r";
	df = "df -h";
	cd = "z";
 	diff = "diff --color=always";
 	#grep = "grep --color=always";
 	duf = "duf -hide-fs tmpfs,devtmpfs";
 	cc = "cd ~/.config";
 	wget = "wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'";
 	wifi = "nmtui";
  gall = "~/.config/myScripts/gitall";
  novelwriter = "appimage-run ~/.bin/novelWriter-2.4.4.AppImage";


	n="nvim ";
	sn="sudo nvim";
	sys="n ~/.zshrc";
	src="source ~/.zshrc  ";
	mk="mkdir -p";
	readme="touch README.md";
	rm="trash-put ";
	rme="trash-empty";
	rml="trash-list";
	rmr="trash-restore";
	tch="touch";
	fzf="fzf --preview 'cat {}'";
  gclone="~/.config/myScripts/gclone";
	
	nconf="z /etc/nixos";
	nrebuild="sudo nixos-rebuild switch";
	nlist="nix-env --list-generations";
	nclean="sudo nix-collect-garbage  --delete-old";
	nboot="sudo /run/current-system/bin/switch-to-configuration boot";



	# Alias's for safe and forced reboots
 	rebootsafe = "sudo shutdown -r now";
 	rebootforce = "sudo shutdown -r -n now";
 	shutdown = "sudo shutdown now";

	# Alias chmod commands
 	mx = "chmod a+x";
 	#000 = "chmod -R 000";
 	#644 = "chmod -R 644";
 	#666 = "chmod -R 666";
 	#755 = "chmod -R 755";
 	#777 = "chmod -R 777";
	
 	# Search running processes
 	p = "ps aux | grep ";
 	topcpu = "/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10";

 	# Change directory aliases
 	home = "cd ~";
 	#cd.. = "cd ..";
 	#.. = "cd ..";
 	#... = "cd ../..";
 	#.... = "cd ../../..";
 	#..... = "cd ../../../..";

 	f = "find . | grep ";

	# Alias's to show disk space and space used in a folder
	diskspace = "du -S | sort -n -r |more";
	folders = "du -h --max-depth=1";
	folderssort = "find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn";
	tree = "tree -CAhF --dirsfirst";
	treed = "tree -CAFd";
	mountedinfo = "df -hT";
	#grep = "/usr/bin/grep $GREP_OPTIONS";
	};
	programs.zoxide = {
	enable = true;
	};
	programs.starship = {
	  enable = true;
    settings = {
      format = "$directory";
      right_format = "$all";
      continuation_prompt = "▶▶ ";
    };
	};
	xresources.properties = {
		"Xcursor.theme" = "Bibata-Original-Amber"; #"macOS-Monterey";
		"Xft.dpi" = "90";  # change the font of the system
	};
	xdg.userDirs = {
		enable = true;
		createDirectories = true;
	};

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.05";
  };
}
