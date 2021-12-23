#
# .setup.sh
#
# by Max Zangs
#

# Copy dotfiles
cp .zshrc $HOME
cp .aliases $HOME

# Load profile for coloring
. ~/.zshrc

# Install command line tools
xcode-select --install

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

# Install my essential applications
brew install --cask bartender                   # https://macbartender.com/
brew install --cask istat-menus                 # https://bjango.com/mac/istatmenus/
brew install --cask firefox                     # https://mozilla.org/firefox/
brew install --cask skype                       # https://www.skype.com/
brew install --cask vlc                         # https://videolan.org/vlc/
brew install --cask spotify                     # https://spotify.com/
brew install --cask handbrake

# Install Office applications
brew install --cask microsoft-office            # https://products.office.com/mac/microsoft-office-for-mac/
brew install --cask synology-drive              # https://www.synology.com/en-us/releaseNote/SynologyDriveClient
brew install --cask devonthink                  # https://devontechnologies.com/apps/devonthink/
brew install --cask microsoft-teams             # https://teams.microsoft.com/downloads
brew install --cask adobe-creative-cloud        # https://www.adobe.com/creativecloud.html
brew install --cask fujitsu-scansnap-home
brew install --cask displaylink

# Install Developer applications
brew install --cask github                      # https://desktop.github.com/
brew install --cask macdown                     # https://macdown.uranusjr.com/
brew install --cask visual-studio-code          # https://code.visualstudio.com/

# Installs extensions for VS Code
code --install-extension ms-python.python
code --install-extension ms-toolsai.jupyter
code --install-extension ms-vscode.cpptools
code --install-extension samuelcolvin.jinjahtml
code --install-extension WyattFerguson.jinja2-snippet-kit
# code --install-extension TabNine.tabnine-vscode # AI auto-completion
# code --install-extension vsciot-vscode.vscode-arduino

print -P "%F{green}Install further (non \"essential\") applications? [y/n]%f "
read yn
if [ $yn = "y" -o $yn = "Y" ]; then
    break
else
    exit
fi

# Install further applications
brew install --cask sensei                      # https://sensei.app/
brew install --cask wireshare                   # https://www.wireshark.org
brew install --cask cyberduck                   # https://cyberduck.io/
brew install --cask mactex-no-gui               # https://www.tug.org/mactex/
brew install --cask latexit                     # https://www.chachatelier.fr/latexit/
# brew install --cask unity-hub                   # https://unity3d.com/get-unity/download
brew install --cask google-drive                # https://www.google.com/drive/
brew install --cask insta360-studio
brew install --cask audio-hijack                # https://rogueamoeba.com/audiohijack/
brew install --cask fission                     # https://rogueamoeba.com/fission/
brew install --cask minecraft

# For making
brew install --cask arduino                     # https://www.arduino.cc/
brew install --cask wch-ch34x-usb-serial-driver # CH34 driver for ESP
brew install --cask paragon-extfs               # https://www.paragon-software.com/ufsdhome/extfs-mac/
brew install --cask blender                     # https://www.blender.org/
brew install --cask eagle
brew install --cask pronterface
brew install --cask ultimaker-cura
