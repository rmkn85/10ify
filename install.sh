#!/usr/bin/env bash
PICTURES_FOLDER=$(xdg-user-dir PICTURES)
CURR_DIRR=$(pwd)

#-- Install Dependencies  ------------------------------------
echo "Installing Dependencies";
sudo apt install apt -y make gnome-shell-extensions gnome-tweak-tool gnome-menus gettext libgettextpo-dev;

#-- Remove Ubuntu nonsense ------------------------------------
gnome-extensions disable "ubuntu-dock@ubuntu.com";

echo "Installing Extensions"

#-- Install Animation Tweaks  ------------------------------------
git clone "https://github.com/Selenium-H/Animation-Tweaks.git";
cd "Animation-Tweaks/";
chmod +x INSTALL.sh && ./INSTALL.sh;
gnome-extensions enable "animation-tweaks@Selenium-H";
cd ..

#-- Install Dash to Panel  ------------------------------------
git clone "https://github.com/home-sweet-gnome/dash-to-panel.git";
cd "dash-to-panel/";
make install;
gnome-extensions enable "dash-to-panel@jderose9.github.com";
cd ..

#-- Install Arc Menu  ------------------------------------
git clone "https://gitlab.com/LinxGem33/Arc-Menu.git";
cd "Arc-Menu/";
make install;
gnome-extensions enable "arc-menu@linxgem33.com";
cd ..

#-- Install User Themes  ------------------------------------
gnome-extensions enable "user-theme@gnome-shell-extensions.gcampax.github.com";

echo "Changing Themes and Icons"
#-- Windows 10 Icons, Wallpaper and Theme ------------------------------------
[[ -e ~/.local/share/themes ]] || mkdir -p ~/.local/share/themes
[[ -e ~/.local/share/icons ]] || mkdir -p ~/.local/share/icons
wget https://cdn.wallpaperhub.app/cloudcache/7/c/2/f/3/4/7c2f345bdfcadb8a3faf483ebaa2e9aea712bbdb.jpg && mv 7c2f345bdfcadb8a3faf483ebaa2e9aea712bbdb.jpg "$CURR_DIR"/wallpaper-windows.png
gsettings set org.gnome.desktop.background picture-uri file:///"$CURR_DIR"/wallpaper-windows.png

#-- Copy schemas ------------------------------------
sudo cp ~/.local/share/gnome-shell/extensions/arc-menu@linxgem33.com/schemas/org.gnome.shell.extensions.arc-menu.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas/org.gnome.shell.extensions.dash-to-panel.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/animation-tweaks@Selenium-H/schemas/org.gnome.shell.extensions.animation-tweaks.gschema.xml /usr/share/glib-2.0/schemas/

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

#-- Finally set custom settings ------------------------------------

#-- Configure Dash to Panel  ------------------------------------
gsettings set org.gnome.shell.extensions.dash-to-panel show-showdesktop-hover false
gsettings set org.gnome.shell.extensions.dash-to-panel scroll-panel-action 'SWITCH_WORKSPACE'
gsettings set org.gnome.shell.extensions.dash-to-panel shortcut ['<Super>q']
gsettings set org.gnome.shell.extensions.dash-to-panel show-favorites-all-monitors true
gsettings set org.gnome.shell.extensions.dash-to-panel focus-highlight-dominant true
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-2 ['<Shift><Super>2']
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-9 ['<Ctrl><Super>9']
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide false
gsettings set org.gnome.shell.extensions.dash-to-panel enter-peek-mode-timeout 500
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-title-font-color '#dddddd'
gsettings set org.gnome.shell.extensions.dash-to-panel animate-show-apps true
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-1 '#5294e2'
gsettings set org.gnome.shell.extensions.dash-to-panel hotkey-prefix-text 'Super'
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-10 ['<Shift><Super>KP_0']
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-3 ['<Shift><Super>3']
gsettings set org.gnome.shell.extensions.dash-to-panel primary-monitor -1
gsettings set org.gnome.shell.extensions.dash-to-panel overlay-timeout 750
gsettings set org.gnome.shell.extensions.dash-to-panel version-to-install ''
gsettings set org.gnome.shell.extensions.dash-to-panel taskbar-position 'LEFTPANEL'
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-2 '#5294e2'
gsettings set org.gnome.shell.extensions.dash-to-panel trans-bg-color '#000'
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-dominant true
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-4 ['<Shift><Super>4']
gsettings set org.gnome.shell.extensions.dash-to-panel appicon-margin 2
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-3 '#5294e2'
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-unfocused-different false
gsettings set org.gnome.shell.extensions.dash-to-panel stockgs-force-hotcorner false
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-fixed-x false
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-5 ['<Shift><Super>5']
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-override false
gsettings set org.gnome.shell.extensions.dash-to-panel stockgs-panelbtn-click-only false
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-manual-styling false
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-4 '#5294e2'
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-aspect-ratio-x 16
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-key-toggle ['<Super>i']
gsettings set org.gnome.shell.extensions.dash-to-panel stockgs-keep-dash false
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-fixed-y true
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-6 ['<Shift><Super>6']
gsettings set org.gnome.shell.extensions.dash-to-panel tray-padding -1
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-aspect-ratio-y 9
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-key-toggle-text '<Super>i'
gsettings set org.gnome.shell.extensions.dash-to-panel minimize-shift true
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-7 ['<Shift><Super>7']
gsettings set org.gnome.shell.extensions.dash-to-panel peek-mode-opacity 40
gsettings set org.gnome.shell.extensions.dash-to-panel middle-click-action 'LAUNCH'
gsettings set org.gnome.shell.extensions.dash-to-panel activate-single-window true
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-enable-start-delay 2000
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-8 ['<Shift><Super>8']
gsettings set org.gnome.shell.extensions.dash-to-panel trans-gradient-top-color '#000000'
gsettings set org.gnome.shell.extensions.dash-to-panel location-clock 'STATUSLEFT'
gsettings set org.gnome.shell.extensions.dash-to-panel leave-timeout 100
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-pressure-time 1000
gsettings set org.gnome.shell.extensions.dash-to-panel dot-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-panel isolate-monitors false
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-use-pressure false
gsettings set org.gnome.shell.extensions.dash-to-panel focus-highlight-opacity 25
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-9 ['<Shift><Super>9']
gsettings set org.gnome.shell.extensions.dash-to-panel shortcut-timeout 2000
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-unfocused-1 '#5294e2'
gsettings set org.gnome.shell.extensions.dash-to-panel show-showdesktop-time 300
gsettings set org.gnome.shell.extensions.dash-to-panel check-update false
gsettings set org.gnome.shell.extensions.dash-to-panel show-appmenu false
gsettings set org.gnome.shell.extensions.dash-to-panel show-clock-all-monitors true
gsettings set org.gnome.shell.extensions.dash-to-panel force-check-update false
gsettings set org.gnome.shell.extensions.dash-to-panel dot-style-focused 'METRO'
gsettings set org.gnome.shell.extensions.dash-to-panel show-window-previews true
gsettings set org.gnome.shell.extensions.dash-to-panel preview-custom-opacity 80
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-unfocused-2 '#5294e2'
gsettings set org.gnome.shell.extensions.dash-to-panel group-apps-underline-unfocused true
gsettings set org.gnome.shell.extensions.dash-to-panel group-apps-label-font-weight 'inherit'
gsettings set org.gnome.shell.extensions.dash-to-panel panel-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-panel trans-dynamic-anim-target 0.40000000000000002
gsettings set org.gnome.shell.extensions.dash-to-panel shortcut-previews false
gsettings set org.gnome.shell.extensions.dash-to-panel group-apps-use-launchers false
gsettings set org.gnome.shell.extensions.dash-to-panel tray-size 0
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-title-font-weight 'inherit'
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-hide-from-windows false
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-unfocused-3 '#5294e2'
gsettings set org.gnome.shell.extensions.dash-to-panel leftbox-size 0
gsettings set org.gnome.shell.extensions.dash-to-panel showdesktop-button-width 8
gsettings set org.gnome.shell.extensions.dash-to-panel show-showdesktop-delay 1000
gsettings set org.gnome.shell.extensions.dash-to-panel trans-dynamic-distance 20
gsettings set org.gnome.shell.extensions.dash-to-panel customize-click true
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-1 ['<Super>1']
gsettings set org.gnome.shell.extensions.dash-to-panel dot-style-unfocused 'METRO'
gsettings set org.gnome.shell.extensions.dash-to-panel focus-highlight true
gsettings set org.gnome.shell.extensions.dash-to-panel secondarymenu-contains-showdetails false
gsettings set org.gnome.shell.extensions.dash-to-panel show-apps-icon-file ''
gsettings set org.gnome.shell.extensions.dash-to-panel click-action 'CYCLE-MIN'
gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-unfocused-4 '#5294e2'
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-10 ['<Ctrl><Super>KP_0']
gsettings set org.gnome.shell.extensions.dash-to-panel focus-highlight-color '#eeeeee'
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-1 ['<Shift><Super>KP_1']
gsettings set org.gnome.shell.extensions.dash-to-panel scroll-icon-action 'CYCLE_WINDOWS'
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-2 ['<Super>2']
gsettings set org.gnome.shell.extensions.dash-to-panel group-apps-use-fixed-width true
gsettings set org.gnome.shell.extensions.dash-to-panel scroll-panel-delay 0
gsettings set org.gnome.shell.extensions.dash-to-panel panel-size 42
gsettings set org.gnome.shell.extensions.dash-to-panel progress-show-bar true
gsettings set org.gnome.shell.extensions.dash-to-panel trans-dynamic-behavior 'ALL_WINDOWS'
gsettings set org.gnome.shell.extensions.dash-to-panel trans-gradient-bottom-color '#000000'
gsettings set org.gnome.shell.extensions.dash-to-panel show-favorites true
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-2 ['<Shift><Super>KP_2']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-10 ['<Super>0']
gsettings set org.gnome.shell.extensions.dash-to-panel isolate-workspaces false
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-3 ['<Super>3']
gsettings set org.gnome.shell.extensions.dash-to-panel show-tooltip true
gsettings set org.gnome.shell.extensions.dash-to-panel shortcut-text '<Super>q'
gsettings set org.gnome.shell.extensions.dash-to-panel dot-size 3
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-1 ['<Ctrl><Super>KP_1']
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-animation-time 260
gsettings set org.gnome.shell.extensions.dash-to-panel peek-mode true
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-3 ['<Shift><Super>KP_3']
gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-custom-gradient true
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-1 ['<Super>KP_1']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-4 ['<Super>4']
gsettings set org.gnome.shell.extensions.dash-to-panel show-apps-icon-side-padding 8
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-animation-time 200
gsettings set org.gnome.shell.extensions.dash-to-panel preview-use-custom-opacity true
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-2 ['<Ctrl><Super>KP_2']
gsettings set org.gnome.shell.extensions.dash-to-panel group-apps-label-font-color '#dddddd'
gsettings set org.gnome.shell.extensions.dash-to-panel show-show-apps-button false
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-4 ['<Shift><Super>KP_4']
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-hide-immediate-click false
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-2 ['<Super>KP_2']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-5 ['<Super>5']
gsettings set org.gnome.shell.extensions.dash-to-panel scroll-icon-delay 0
gsettings set org.gnome.shell.extensions.dash-to-panel shift-click-action 'MINIMIZE'
gsettings set org.gnome.shell.extensions.dash-to-panel trans-gradient-top-opacity 0.20000000000000001
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-3 ['<Ctrl><Super>KP_3']
gsettings set org.gnome.shell.extensions.dash-to-panel status-icon-padding -1
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-size 240
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-title-position 'TOP'
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-5 ['<Shift><Super>KP_5']
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-1 ['<Ctrl><Super>1']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-3 ['<Super>KP_3']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-6 ['<Super>6']
gsettings set org.gnome.shell.extensions.dash-to-panel group-apps true
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-show-title true
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-padding 8
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-4 ['<Ctrl><Super>KP_4']
gsettings set org.gnome.shell.extensions.dash-to-panel animate-app-switch true
gsettings set org.gnome.shell.extensions.dash-to-panel hotkeys-overlay-combo 'TEMPORARILY'
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-6 ['<Shift><Super>KP_6']
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-2 ['<Ctrl><Super>2']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-4 ['<Super>KP_4']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-7 ['<Super>7']
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-5 ['<Ctrl><Super>KP_5']
gsettings set org.gnome.shell.extensions.dash-to-panel hot-keys false
gsettings set org.gnome.shell.extensions.dash-to-panel multi-monitors true
gsettings set org.gnome.shell.extensions.dash-to-panel leftbox-padding -1
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-3 ['<Ctrl><Super>3']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-5 ['<Super>KP_5']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-8 ['<Super>8']
gsettings set org.gnome.shell.extensions.dash-to-panel show-running-apps true
gsettings set org.gnome.shell.extensions.dash-to-panel show-window-previews-timeout 100
gsettings set org.gnome.shell.extensions.dash-to-panel animate-window-launch true
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-6 ['<Ctrl><Super>KP_6']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-10 ['<Super>KP_0']
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-10 ['<Shift><Super>0']
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-7 ['<Shift><Super>KP_7']
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-8 ['<Shift><Super>KP_8']
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-4 ['<Ctrl><Super>4']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-6 ['<Super>KP_6']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-9 ['<Super>9']
gsettings set org.gnome.shell.extensions.dash-to-panel progress-show-count true
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-title-font-size 14
gsettings set org.gnome.shell.extensions.dash-to-panel group-apps-label-font-size 14
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-7 ['<Ctrl><Super>KP_7']
gsettings set org.gnome.shell.extensions.dash-to-panel preview-middle-click-close true
gsettings set org.gnome.shell.extensions.dash-to-panel trans-panel-opacity 0.40000000000000002
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-kp-9 ['<Shift><Super>KP_9']
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-show-in-fullscreen false
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-5 ['<Ctrl><Super>5']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-7 ['<Super>KP_7']
gsettings set org.gnome.shell.extensions.dash-to-panel show-activities-button false
gsettings set org.gnome.shell.extensions.dash-to-panel shortcut-num-keys 'BOTH'
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-8 ['<Ctrl><Super>KP_8']
gsettings set org.gnome.shell.extensions.dash-to-panel shift-middle-click-action 'LAUNCH'
gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-custom-bg false
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-6 ['<Ctrl><Super>6']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-8 ['<Super>KP_8']
gsettings set org.gnome.shell.extensions.dash-to-panel show-status-menu-all-monitors true
gsettings set org.gnome.shell.extensions.dash-to-panel appicon-padding 8
gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-dynamic-opacity false
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-kp-9 ['<Ctrl><Super>KP_9']
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-only-secondary false
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-7 ['<Ctrl><Super>7']
gsettings set org.gnome.shell.extensions.dash-to-panel app-hotkey-kp-9 ['<Super>KP_9']
gsettings set org.gnome.shell.extensions.dash-to-panel trans-dynamic-anim-time 300
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-behaviour 'FOCUSED_WINDOWS'
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-pressure-threshold 100
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-10 ['<Ctrl><Super>0']
gsettings set org.gnome.shell.extensions.dash-to-panel secondarymenu-contains-appmenu true
gsettings set org.gnome.shell.extensions.dash-to-panel trans-gradient-bottom-opacity 0.5
gsettings set org.gnome.shell.extensions.dash-to-panel show-showdesktop-button true
gsettings set org.gnome.shell.extensions.dash-to-panel taskbar-locked false
gsettings set org.gnome.shell.extensions.dash-to-panel app-shift-hotkey-1 ['<Shift><Super>1']
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-close-delay 400
gsettings set org.gnome.shell.extensions.dash-to-panel group-apps-label-max-width 160
gsettings set org.gnome.shell.extensions.dash-to-panel app-ctrl-hotkey-8 ['<Ctrl><Super>8']
gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-custom-opacity true


#-- Configure User Theme  ------------------------------------
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

#-- Configure Arc Menu  ------------------------------------
gsettings set org.gnome.shell.extensions.arc-menu enable-custom-shortcuts false
gsettings set org.gnome.shell.extensions.arc-menu menu-position-alignment 50
gsettings set org.gnome.shell.extensions.arc-menu avatar-style 'Square'
gsettings set org.gnome.shell.extensions.arc-menu enable-clock-widget-raven true
gsettings set org.gnome.shell.extensions.arc-menu position-in-panel 'Left'
gsettings set org.gnome.shell.extensions.arc-menu indicator-text-color 'rgba(196, 196, 196, 0.3)'
gsettings set org.gnome.shell.extensions.arc-menu ubuntu-dash-separator-index 5
gsettings set org.gnome.shell.extensions.arc-menu activate-on-hover true
gsettings set org.gnome.shell.extensions.arc-menu multi-monitor true
gsettings set org.gnome.shell.extensions.arc-menu enable-custom-arc-menu true
gsettings set org.gnome.shell.extensions.arc-menu custom-menu-button-icon 'icons8-windows-10-symbolic.svg'
gsettings set org.gnome.shell.extensions.arc-menu menu-arrow-size 0
gsettings set org.gnome.shell.extensions.arc-menu menu-keybinding-text '<Super>x'
gsettings set org.gnome.shell.extensions.arc-menu menu-corner-radius 5
gsettings set org.gnome.shell.extensions.arc-menu menu-layout 'Whisker'
gsettings set org.gnome.shell.extensions.arc-menu show-lock-button true
gsettings set org.gnome.shell.extensions.arc-menu hot-corners 'Default'
gsettings set org.gnome.shell.extensions.arc-menu border-color 'rgb(41,50,55)'
gsettings set org.gnome.shell.extensions.arc-menu custom-menu-button-text 'Applications'
gsettings set org.gnome.shell.extensions.arc-menu color-themes [['Arc Menu Theme', 'rgba(28, 28, 28, 0.98)', 'rgba(211, 218, 227, 1)', 'rgb(63,62,64)', 'rgba(238, 238, 236, 0.1)', 'rgb(63,62,64)', '9', '0', '0', '0', '0', 'false'], ['Dark Blue Theme', 'rgb(25,31,34)', 'rgb(189,230,251)', 'rgb(41,50,55)', 'rgb(41,50,55)', 'rgb(41,50,55)', '9', '1', '5', '12', '24', 'true'], ['Light Blue Theme', 'rgb(255,255,255)', 'rgb(51,51,51)', 'rgb(235,235,235)', 'rgba(189,230,251,0.9)', 'rgba(189,230,251,0.9)', '9', '1', gsettings set '5', '12', '24', 'true']]
gsettings set org.gnome.shell.extensions.arc-menu application-shortcuts-list [['Software', 'system-software-install-symbolic', 'ArcMenu_Software'], ['Settings', 'preferences-system-symbolic', 'gnome-control-center.desktop'], ['Tweaks', 'org.gnome.tweaks-symbolic', 'org.gnome.tweaks.desktop'], ['Terminal', 'utilities-terminal-symbolic', 'org.gnome.Terminal.desktop'], ['Activities Overview', 'view-fullscreen-symbolic', 'ArcMenu_ActivitiesOverview']]
gsettings set org.gnome.shell.extensions.arc-menu disable-user-avatar false
gsettings set org.gnome.shell.extensions.arc-menu gap-adjustment 0
gsettings set org.gnome.shell.extensions.arc-menu enable-custom-arc-menu-layout true
gsettings set org.gnome.shell.extensions.arc-menu ubuntu-dash-pinned-app-list ['Home', 'ArcMenu_Home', 'ArcMenu_Home', 'Documents', 'ArcMenu_Documents', 'ArcMenu_Documents', 'Downloads', 'ArcMenu_Downloads', 'ArcMenu_Downloads', 'Software', 'org.gnome.Software', 'org.gnome.Software.desktop', 'Files', 'system-file-manager', 'org.gnome.Nautilus.desktop', 'Log Out', 'application-exit-symbolic', 'ArcMenu_LogOut', 'Lock', 'changes-prevent-symbolic', 'ArcMenu_Lock', 'Power Off', 'system-shutdown-symbolic', gsettings set 'ArcMenu_PowerOff']
gsettings set org.gnome.shell.extensions.arc-menu show-bookmarks false
gsettings set org.gnome.shell.extensions.arc-menu custom-hot-corner-cmd "sh -c 'notify-send \"$(date)\"'"
gsettings set org.gnome.shell.extensions.arc-menu menu-height 627
gsettings set org.gnome.shell.extensions.arc-menu menu-color 'rgb(46,52,54)'
gsettings set org.gnome.shell.extensions.arc-menu menu-foreground-color 'rgb(238,238,236)'
gsettings set org.gnome.shell.extensions.arc-menu arc-menu-placement 'DTP'
gsettings set org.gnome.shell.extensions.arc-menu menu-hotkey 'Super_L'
gsettings set org.gnome.shell.extensions.arc-menu menu-button-active-color 'rgb(255,255,255)'
gsettings set org.gnome.shell.extensions.arc-menu custom-menu-button-icon-size 25.0
gsettings set org.gnome.shell.extensions.arc-menu enable-sub-menus true
gsettings set org.gnome.shell.extensions.arc-menu highlight-color 'rgb(41,50,55)'
gsettings set org.gnome.shell.extensions.arc-menu enable-large-icons true
gsettings set org.gnome.shell.extensions.arc-menu menu-button-color 'rgb(255,255,255)'
gsettings set org.gnome.shell.extensions.arc-menu show-logout-button true
gsettings set org.gnome.shell.extensions.arc-menu recently-installed-apps @as []
gsettings set org.gnome.shell.extensions.arc-menu show-suspend-button false
gsettings set org.gnome.shell.extensions.arc-menu vert-separator true
gsettings set org.gnome.shell.extensions.arc-menu disable-hotkey-onkeyrelease false
gsettings set org.gnome.shell.extensions.arc-menu button-icon-padding 2
gsettings set org.gnome.shell.extensions.arc-menu dtp-dtd-state [true, false]
gsettings set org.gnome.shell.extensions.arc-menu enable-pinned-apps true
gsettings set org.gnome.shell.extensions.arc-menu enable-clock-widget-ubuntu false
gsettings set org.gnome.shell.extensions.arc-menu disable-tooltips false
gsettings set org.gnome.shell.extensions.arc-menu enable-horizontal-flip false
gsettings set org.gnome.shell.extensions.arc-menu show-external-devices false
gsettings set org.gnome.shell.extensions.arc-menu menu-keybinding ['<Super>x']
gsettings set org.gnome.shell.extensions.arc-menu show-power-button true
gsettings set org.gnome.shell.extensions.arc-menu searchbar-location-redmond 'Bottom'
gsettings set org.gnome.shell.extensions.arc-menu disable-category-arrows false
gsettings set org.gnome.shell.extensions.arc-menu disable-searchbox-border false
gsettings set org.gnome.shell.extensions.arc-menu menu-width 300
gsettings set org.gnome.shell.extensions.arc-menu krunner-show-details true
gsettings set org.gnome.shell.extensions.arc-menu remove-menu-arrow false
gsettings set org.gnome.shell.extensions.arc-menu right-panel-width 312
gsettings set org.gnome.shell.extensions.arc-menu mint-separator-index 5
gsettings set org.gnome.shell.extensions.arc-menu reload-theme false
gsettings set org.gnome.shell.extensions.arc-menu mint-pinned-app-list ['Firefox', 'firefox', 'firefox.desktop', 'Terminal', 'utilities-terminal', 'org.gnome.Terminal.desktop', 'Settings', 'emblem-system-symbolic', 'gnome-control-center.desktop', 'Software', 'system-software-install-symbolic', 'org.gnome.Software.desktop', 'Files', 'system-file-manager', 'org.gnome.Nautilus.desktop', 'Log Out', 'application-exit-symbolic', 'ArcMenu_LogOut', 'Lock', 'changes-prevent-symbolic', 'ArcMenu_Lock', 'Power Off', gsettings set 'system-shutdown-symbolic', 'ArcMenu_PowerOff']
gsettings set org.gnome.shell.extensions.arc-menu menu-font-size 12
gsettings set org.gnome.shell.extensions.arc-menu menu-border-size 1
gsettings set org.gnome.shell.extensions.arc-menu directory-shortcuts-list [['Home', 'ArcMenu_Home', 'ArcMenu_Home'], ['Documents', 'ArcMenu_Documents', 'ArcMenu_Documents'], ['Downloads', 'ArcMenu_Downloads', 'ArcMenu_Downloads'], ['Music', 'ArcMenu_Music', 'ArcMenu_Music'], ['Pictures', 'ArcMenu_Pictures', 'ArcMenu_Pictures'], ['Videos', 'ArcMenu_Videos', 'ArcMenu_Videos']]
gsettings set org.gnome.shell.extensions.arc-menu enable-menu-button-arrow false
gsettings set org.gnome.shell.extensions.arc-menu separator-color 'rgb(41,50,55)'
gsettings set org.gnome.shell.extensions.arc-menu runner-position 'Top'
gsettings set org.gnome.shell.extensions.arc-menu searchbar-location 'Bottom'
gsettings set org.gnome.shell.extensions.arc-menu enable-menu-keybinding false
gsettings set org.gnome.shell.extensions.arc-menu disable-recently-installed-apps false
gsettings set org.gnome.shell.extensions.arc-menu indicator-color 'rgb(41, 165, 249)'
gsettings set org.gnome.shell.extensions.arc-menu menu-margin 24
gsettings set org.gnome.shell.extensions.arc-menu enable-weather-widget-raven true
gsettings set org.gnome.shell.extensions.arc-menu disable-activities-button false
gsettings set org.gnome.shell.extensions.arc-menu pinned-app-list @as []
gsettings set org.gnome.shell.extensions.arc-menu menu-button-appearance 'Icon'
gsettings set org.gnome.shell.extensions.arc-menu enable-weather-widget-ubuntu false
gsettings set org.gnome.shell.extensions.arc-menu restore-activities-button false
gsettings set org.gnome.shell.extensions.arc-menu override-hot-corners false
gsettings set org.gnome.shell.extensions.arc-menu enable-ubuntu-homescreen true
gsettings set org.gnome.shell.extensions.arc-menu menu-button-icon 'Custom_Icon'

#-- Configure Animations ------------------------------------
gsettings set org.gnome.shell.extensions.animation-tweaks wayland true
gsettings set org.gnome.shell.extensions.animation-tweaks unminimizing-effect true
gsettings set org.gnome.shell.extensions.animation-tweaks normal-minimize ['|', 'T', 'Squeezed Slide Vertically', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '1', '255', 'MW', '0', 'MX', '1', '0.00', '0', '0', '255', '0', '0', 'MX', 'mY']
gsettings set org.gnome.shell.extensions.animation-tweaks minimizing-effect true
gsettings set org.gnome.shell.extensions.animation-tweaks normal-unminimize ['|', 'T', 'Squeezed Slide Vertically', '2', '255', 'MW', '0.8', 'MX', 'mY', '0.00', '0', '0', '255', '0', '0', 'MX', 'IY', '0.250', '0', '1', '255', '1', '1', 'IX', 'IY']

echo "Logout and re-login for changes to take effect";
