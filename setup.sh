#!/bin/zsh
#
# setup.sh
#
# by Max Zangs
#

# Install Homebrew or update it
if [ ! -d /opt/homebrew ]; then
    print -P "%F{green}Installing Hombrew%f"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print -P "%F{green}Updating/-grading Homebrew%f"
    brew update
    brew upgrade
fi

# Install Oh My Zsh
if [ ! -d /Users/maxi/.oh-my-zsh ]; then
    print -P "%F{green}Installing Oh My Zsh%f"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
end

# Install Rosetta
sudo softwareupdate --install-rosetta

# Install essential formulae

brew install \
    mas \
    sdl2 \
    sdl2_image \
    sdl2_mixer \
    sdl2_ttf

# Install essential casks

brew install --cask \
    blender \
    citrix-workspace \
    devonthink \
    docker \
    fujitsu-scansnap-home \
    macdown \
    microsoft-powerpoint \
    microsoft-word \
    microsoft-excel \
    microsoft-teams \
    minecraft \
    moneymoney \
    nextcloud \
    sensei \
    sonos \
    spotify \
    visual-studio-code \
    vlc

# Install apps from AppStore

mas install 409203825 # Numbers
mas install 409201541 # Pages
mas install 409183694 # Keynote
mas install 497799835 # Xcode

# Configure Visual Studio Code

CODE_SETTINGS=/Users/$USER/Library/Application\ Support/Code/User/settings.json
if [ -e $CODE_SETTINGS ]; then
    rm $CODE_SETTINGS
    cp settings.json $CODE_SETTINGS
fi
