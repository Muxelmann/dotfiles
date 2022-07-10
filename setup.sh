#!/bin/zsh
#
# setup.sh
#
# by Max Zangs
#

# Copy dotfiles
cp .zshrc $HOME
cp .aliases $HOME

# Load profile for coloring
. ~/.zshrc

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
    adobe-creative-cloud \
    bartender \
    blender \
    cyberduck \
    devonthink \
    docker \
    firefox \
    fujitsu-scansnap-home \
    github \
    handbrake \
    istat-menus \
    macdown \
    microsoft-office \
    microsoft-teams \
    minecraft \
    parallels \
    sonos \
    spotify \
    steam \
    ultimaker-cura \
    visual-studio-code

# Optional casks

# brew install --cask \
#     displaylink \
#     remarkable \
#     skype \
#     synology-drive \
#     vlc

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

code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-vscode.cpptools
code --install-extension ms-azuretools.vscode-docker
code --install-extension samuelcolvin.jinjahtml
code --install-extension WyattFerguson.jinja2-snippet-kit
code --install-extension mblode.twig-language-2
# code --install-extension TabNine.tabnine-vscode # AI auto-completion
# code --install-extension vsciot-vscode.vscode-arduino

# Install Python 3.10.5 using pyenv

export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"

pyenv install 3.10.5
pyenv global 3.10.5
pip3 install virtualenv

# Install further (non essential) apps

if [ -z $install ]; then
    print -P "%F{green}Install further (non \"essential\") applications via Homebrew? [y/n]%f "
    read yn
elif [ $install = "everything" ]; then
    yn="y"
elif [ $install = "essential only" ]; then  
    yn="n"
fi

if [ $yn = "y" -o $yn = "Y" ]; then

    # Install further applications
    brew install --cask \
        sensei \
        wireshark \
        mactex-no-gui \
        latexit \
        google-drive \
        insta360-studio \
        audio-hijack \
        fission

    # For making
    brew install --cask \
        arduino \
        wch-ch34x-usb-serial-driver \ # CH34 driver for ESP
        paragon-extfs \
        eagle
fi
