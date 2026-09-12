sudo apt update
sudo apt install -y git curl

# copy or paste with wl-copy, wl-paste
sudo apt install wl-clipboard

# install mise & tools
curl https://mise.run | sh
mise install aqua:gokcehan/lf aqua:noborus/ov bat delta eza fd fzf gh helix jq ripgrep zellij zoxide

# clone dotfiles
cd ~/.config
git clone git@github.com:RenovZ/dotfiles.git
cd dotfiles && git submodule update --recursive --init && cd -

# configure lf
ln -s dotfiles/lf ~/.config/lf

# install fish shell
curl -OL https://github.com/fish-shell/fish-shell/releases/download/4.9.3/fish-4.9.3-linux-x86_64.tar.xz
tar -xJf fish-4.9.3-linux-x86_64.tar.xz
sudo install fish /usr/local/fish
rm fish-4.9.3-linux-x86_64.tar.xz
ln -s dotfiles/fish ~/.config/fish
sudo usermod -s /usr/local/bin/fish $(whoami)
chsh -s "$(command -v fish)"

# configure helix
ln -s dotfiles/helix ~/.config/helix

# install bun
curl -fsSL https://bun.sh/install | bash

# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
