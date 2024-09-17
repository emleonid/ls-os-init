#!/bin/bash

# Update the package list
sudo apt update

# Upgrade all installed packages
sudo apt upgrade -y

### Remove some default apps

# Get the current list of favorite apps
FAVORITES=$(gsettings get org.gnome.shell favorite-apps)

# Remove 'thunderbird.desktop' from the list
NEW_FAVORITES=$(echo "$FAVORITES" | sed "s/'thunderbird_thunderbird.desktop',//g")

# Remove others
NEW_FAVORITES=$(echo "$NEW_FAVORITES" | sed "s/'org.gnome.Rhythmbox3.desktop',//g")
NEW_FAVORITES=$(echo "$NEW_FAVORITES" | sed "s/'libreoffice-writer.desktop',//g")

# Set the modified list back into the settings
gsettings set org.gnome.shell favorite-apps "$NEW_FAVORITES"

sudo apt-get remove --purge thunderbird -y
rm -rf ~/.thunderbird

### Customize GNOME UI

# Set theme to Olive

gsettings set org.gnome.shell.ubuntu color-scheme 'default'
gsettings set org.gnome.desktop.interface gtk-theme Yaru-olive
gsettings set org.gnome.desktop.interface color-scheme 'default'

# Move the sidebar to the bottom and set height to 64px
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Other settings
gsettings set org.gnome.desktop.interface enable-hot-corners true

# Add Ukrainian keyboard
CURRENT_SOURCES=$(gsettings get org.gnome.desktop.input-sources sources)
UPDATED_SOURCES=$(echo "$CURRENT_SOURCES" | sed "s/^\(\[.*\)\]$/\1, ('xkb', 'ua')]/")
gsettings set org.gnome.desktop.input-sources sources "$UPDATED_SOURCES"

### Install apps and packages

# Install some essential packages
sudo apt install -y curl git tree openjdk-17-jdk

### Install apps from Snap

sudo snap install chromium --channel=latest/stable
sudo snap install rider --channel=2024.1/stable --classic
sudo snap install webstorm --channel=2024.1/stable --classic
sudo snap install code --channel=latest/stable
sudo snap install okular --channel=latest/stable
sudo snap install htop --channel=latest/stable
sudo snap install telegram-desktop --channel=latest/stable
sudo snap install okular --channel=latest/stable
sudo snap install slack --channel=latest/stable
sudo snap install teams-for-linux --channel=latest/stable
sudo snap install postman --channel=latest/stable
sudo snap install notepad-plus-plus --channel=latest/stable
sudo snap install dotnet-sdk --channel=lts/stable --classic
sudo snap install dotnet-sdk --channel=8.0/stable --classic
sudo snap install dotnet-sdk --channel=7.0/stable --classic
sudo snap install dotnet-sdk --channel=6.0/stable --classic
sudo snap install dbeaver-ce --channel=latest/stable
sudo snap install docker --channel=latest/stable

# Finish moves
gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'chromium_chromium.desktop', 'slack_slack.desktop', 'teams-for-linux_teams-for-linux.desktop', 'telegram-desktop_telegram-desktop.desktop', 'rider_rider.desktop', 'webstorm_webstorm.desktop', 'dbeaver-ce_dbeaver-ce.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop']"

#wget https://raw.githubusercontent.com/emleonid/ls-os-init/dev/files/frame1.png
wget https://raw.githubusercontent.com/emleonid/ls-os-init/dev/files/frame2.png

#sudo cp frame1.png /usr/share/plymouth/themes/spinner/bgrt-fallback.png
sudo cp frame2.png /usr/share/plymouth/themes/spinner/watermark.png
sudo cp frame2.png /usr/share/plymouth/ubuntu-logo.png

#rm frame1.png
rm frame2.png

# Print a message when the setup is complete
echo "Setup completed successfully!"
