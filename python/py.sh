#!/usr/bin/env bash

# pkgs=(
#   autojump bind fpp gdb git-filter-repo grc httpie meson mpv percol pipx rtv thefuck trash-cli yt-dlp

#   adwaita-icon-theme cairo cairomm cairomm@1.14 desktop-file-utils ffmpeg@4 ffmpegthumbnailer fontforge gdk-pixbuf glib glibmm gobject-introspection graphviz gsettings-desktop-schemas gts harfbuzz itstool libass libcroco liblqr libnotify librsvg mercurial mitmproxy mycli pango pgcli py2cairo py3cairo pygobject3 python-tabulate tbb vapoursynth

#   ffmpeg@4  fontforge  gobject-introspection  graphviz  harfbuzz  libass  librsvg  pango  py2cairo  py3cairo pygobject3

#   graphviz  harfbuzz  libass  librsvg  pango pygobject3

#   libass librsvg pango

#   pynvim

# )

pkgs=`cat pkgs.txt`

for pkg in ${pkgs[@]}; do
  echo $pkg

  brew uninstall --ignore-dependencies ${pkg}
  pip install -U ${pkg}
done
