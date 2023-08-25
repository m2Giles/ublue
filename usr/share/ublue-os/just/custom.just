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