!include /usr/share/ublue-os/just/100-bling.just

# Include some of your custom scripts here!

# Assemble distrobox containers
assemble:
  echo 'Assembling and replacing distroboxes ...'
  distrobox assemble create --replace --file /usr/etc/distrobox/distrobox.ini

# Replace Fedora distrobox
replace-fedora:
  echo 'Replacing Fedora Distrobox'
  distrobox assemble create --replace --file /usr/etc/distrobox/distrobox.ini --name fedora

# Install Homebrew for Linux
brew:
  echo "Installing homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to shell rc files
brew-shell:
  #!/usr/bin/env bash
  set -euxo pipefail
  echo "Adding homebrew to shell configuration"
  touch $HOME/.zprofile
  touch $HOME/.bash_profile
  if grep -q "linuxbrew" $HOME/.zprofile
  then
    echo "Brew configuration already present in .zprofile"
  else 
    echo "Adding Brew configuration to .zprofile"
    echo 'eval "$(/var/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zprofile
  fi
  if grep -q "linuxbrew" $HOME/.bash_profile
  then
    echo "Brew configuration already present in .bash_profile"
  else 
    echo "Adding Brew configuration to .bash_profile"
    echo 'eval "$(/var/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
  fi

# Create a universal developer container
distrobox-universal:
  echo 'Creating Universal Development distrobox ...'
  distrobox create --image mcr.microsoft.com/devcontainers/universal:latest -n universal -Y