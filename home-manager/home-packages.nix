{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    #desktop apps
    librewolf
    imv
    mpv
    obs-studio
    pavucontrol
    vesktop
    stremio

    #cli utils
    bc
    bottom
    brightnessctl
    cliphist
    ffmpeg
    ffmpegthumbnailer
    fzf
    git-graph
    grimblast
    htop
    hyprpicker
    ntfs3g
    mediainfo
    microfetch
    playerctl
    ripgrep
    showmethekey
    silicon
    udisks
    ueberzugpp
    unzip
    unrar
    w3m
    wget
    wl-clipboard
    wtype
    yt-dlp
    zip
    cava
    cmatrix
    tt

    #coding stuff
    openjdk23
    nodejs
    python311
    nixd

    #wm stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    #other
    bemoji
    nix-prefetch-scripts
    protonup
    mangohud
    scientifica
  ];
}
