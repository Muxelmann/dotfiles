#!/bin/zsh
#
# setup.sh
#
# by Max Zangs
#

# Copy dotfiles
cp .zprofile $HOME
cp .aliases $HOME

# Load profile for coloring
. ~/.zprofile

# Test if everything should be installed by default
if [ -n "$1" -a "$1" = "-all" ]; then
    print -P "%F{red}Everything will be installed, i.e. asking Y/N is skipped!%f"
    install="everything"
elif [ -n "$1" -a "$1" = "-skip" ]; then
    print -P "%F{red}Everything non-essential will be skipped!%f"
    install="essential only"
else
    install=""
fi

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

# Also install MacOS Applications included in the tap: homebrew/cask-drivers
brew tap homebrew/cask-drivers

# Install essential formulae

brew install \
    java \
    mas \
    pyenv \
    sdl2 \
    sdl2_image \
    sdl2_mixer \
    sdl2_ttf

# Install essential casks

brew install --cask \
    blender \
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
    parallels \
    sensei \
    sonos \
    spotify \
    visual-studio-code \
    vlc

# Install apps from AppStore

if [ -z $install ]; then
    print -P "%F{green}Install further (non \"essential\") applications from AppStore? [y/n]%f "
    read yn
elif [ $install = "everything" ]; then
    yn="y"
elif [ $install = "essential only" ]; then  
    yn="n"
fi

if [ $yn = "y" -o $yn = "Y" ]; then
    brew install mas
    mas install 409203825 # Numbers
    mas install 409201541 # Pages
    mas install 409183694 # Keynote
    mas install 497799835 # Xcode
    mas install 425264550 # Blackmagic Disk Speed Test
    mas install 441258766 # Magnet
fi

# Configure Visual Studio Code

CODE_SETTINGS=/Users/$USER/Library/Application\ Support/Code/User/settings.json
if [ -e $CODE_SETTINGS ]; then
    rm $CODE_SETTINGS
    cp settings.json $CODE_SETTINGS
fi
