!include /usr/share/ublue-os/just/bling.just

# Install all flatpaks defined in recipe.yml
setup-flatpaks:
  #!/usr/bin/env bash
  echo 'Installing flatpaks from the ublue recipe ...'
  flatpaks=$(yq -- '.firstboot.flatpaks[]' "/usr/share/ublue-os/recipe.yml")
  for pkg in $flatpaks; do \
      echo "Installing: ${pkg}" && \
      flatpak install --user --noninteractive flathub $pkg; \
  done

# Include some of your custom scripts here!
#toolbox-boxkit:
#  echo 'Creating a BoxKit Toolbox...'
#  toolbox create --image ghcr.io/ublue-os/boxkit boxtool-${RANDOM}

# Install starship in home
starship-me-up:
  #!/usr/bin/env bash
  echo 'Installing starship binary to homedir...'
  [ ! -d ~/.local/bin ] && mkdir ~/.local/bin
  cp /usr/bin/starship ~/.local/bin/

# Assemble Distrobox Containers
assemble-distrobox:
  #!/usr/bin/env bash
  [[ ! -d ~/Containers/arch-devel ]] && mkdir -p ~/Containers/arch-devel
  [[ ! -d ~/Containers/arch-latex ]] && mkdir -p ~/Containers/arch-latex
  distrobox assemble create --file /usr/etc/distrobox/distrobox.ini

# Setup VSCode to connect to Distrobox Named Containers
VSCode-Containers:
  #!/usr/bin/env bash
  local path=${XDG_CONFIG_HOME:-${HOME}/.config}/Code/User/globalStorage/ms-vscode-remote.remote.containers/nameConfigs
  [[ ! -d "$path" ]] && mkdir -p $path
  cp /usr/share/ublue-os/ContainerSetup/arch-devel.json "$path"
  cp /usr/share/ublue-os/ContainerSetup/arch-latex.json "$path"