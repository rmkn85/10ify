#!/usr/bin/env bash
PICTURES_FOLDER=$(xdg-user-dir PICTURES)

#-- Install Dependencies  ------------------------------------
echo "Installing Dependencies";
sudo apt install apt -y make gnome-shell-extensions gnome-tweak-tool gnome-menus gettext libgettextpo-dev;

mv icons8-windows-10-symbolic.svg ~/icons8-windows-10-symbolic.svg

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
wget https://cdn.wallpaperhub.app/cloudcache/7/c/2/f/3/4/7c2f345bdfcadb8a3faf483ebaa2e9aea712bbdb.jpg && mv 7c2f345bdfcadb8a3faf483ebaa2e9aea712bbdb.jpg ~/wallpaper-windows.png
gsettings set org.gnome.desktop.background picture-uri ~/wallpaper-windows.png

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
gsettings set org.gnome.shell.extensions.arc-menu custom-menu-button-icon ~/icons8-windows-10-symbolic.svg
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
gsettings set org.gnome.shell.extensions.animation-tweaks popupmenu-open ['|', 'T', 'Scale Down', '1', '200', '1', '0', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks dialog-unminimize ['|', 'T', 'Squeezed Slide Up', '3', '0', 'MW', '0.8', '1', '1', '0.001', '0', '0', '0', 'MW', '0.8', 'MX', 'DY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', 'IY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY']
gsettings set org.gnome.shell.extensions.animation-tweaks dropdownmenu-open ['|', 'T', 'Scale Down', '1', '200', '1', '0', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks window-close-effects-list ['|', 'Contracted Drop Down', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', 'MH', 'MX', '1.2', '0.200', '0', '0', '255', 'MW', 'MH', 'MX', 'DY', '|', 'Contracted Drop Left', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', 'MH', '1.8', 'MY', '0.200', '0', '0', '255', 'MW', 'MH', 'LX', 'MY', '|', 'Contracted Drop Right', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', 'MH', '1.2', 'MY', '0.200', '0', '0', '255', 'MW', 'MH', 'RX', 'MY', '|', 'Contracted Drop Up', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', 'MH', 'MX', '1.8', '0.200', '0', '0', '255', 'MW', 'MH', 'MX', 'UY', '|', 'Fade Out', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '0.99', '0.99', '1', '1', '|', 'Fold In Sideways', '1', '255', '1', '1', '1', '1', '0.250', '0.5', '0', '100', '0', '1', '1', '1', '|', 'Fold In Vertically', '1', '255', '1', '1', '1', '1', '0.250', '0', '0.5', '100', '1', '0', '1', '1', '|', 'Magnify', '1', '255', '1', '1', '1', '1', '0.250', '0.5', '0.5', '0', '1.2', '1.2', '1', '1', '|', 'Scale Down', '1', '200', '1', '1', '1', '1', '0.250', '0', '1', '0', '1', '0', '1', '1', '|', 'Scale Left', '1', '200', '1', '1', '1', '1', '0.250', '0', '0', '0', '0', '1', '1', '1', '|', 'Scale Right', '1', '200', '1', '1', '1', '1', '0.250', '1', '0', '0', '0', '1', '1', '1', '|', 'Scale Up', '1', '200', '1', '1', '1', '1', '0.250', '0', '0', '0', '1', '0', '1', '1', '|', 'Slide Down', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '1', '1', '1', '1.2', '|', 'Slide Left', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '1', '1', '0.8', '1', '|', 'Slide Right', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '1', '1', '1.2', '1', '|', 'Slide Up', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '1', '1', '1', '0.8', '|', 'Squeezed Slide Down', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', '1', '0.200', '0', '0', '255', 'MW', '0.8', 'MX', 'DY', '|', 'Squeezed Slide Left', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', '0.8', 'MH', '1', 'MY', '0.200', '0', '0', '255', '0.8', 'MH', 'LX', 'MY', '|', 'Squeezed Slide Right', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', '0.8', 'MH', '1', 'MY', '0.200', '0', '0', '255', '0.8', 'MH', 'RX', 'MY', '|', 'Squeezed Slide Up', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', '1', '0.200', '0', '0', '255', 'MW', '0.8', 'MX', 'UY', '|', 'Zoom Out', '1', '255', '1', '1', '1', '1', '0.250', '0.5', '0.5', '0', '0', '0', '1', '1', '|', 'None', '1', '255', '1', '1', '1', '1', '0.0', '0', '0', '0', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks window-open-effects-list ['|', 'Contracted Rise Left', '3', '255', 'MW', 'MH', '1', '1', '0.001', '0', '0', '0', '0.8', 'MH', 'RX', 'MY', '0.300', '0', '0', '255', 'MW', 'MH', 'IX', 'MY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Contracted Rise Right', '3', '255', 'MW', 'MH', '1', '1', '0.001', '0', '0', '0', '0.8', 'MH', 'LX', 'MY', '0.300', '0', '0', '255', 'MW', 'MH', 'IX', 'MY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Contracted Rise Down', '3', '255', 'MW', 'MH', 'MX', 'MY', '0.001', '0', '0', '0', 'MW', '0.8', 'MX', 'UY', '0.300', '0', '0', '255', 'MW', 'MH', 'MX', 'IY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Contracted Rise Up', '3', '255', 'MW', 'MH', 'MX', 'MY', '0.001', '0', '0', '0', 'MW', '0.8', 'MX', 'DY', '0.300', '0', '0', '255', 'MW', 'MH', 'MX', 'IY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Fade In', '1', '0', '1', '1', '1', '1', '0.350', '0', '0', '255', '1', '1', '1', '1', '|', 'Fold Out Sideways', '1', '255', '0', '1', '1', '1', '0.250', '0.5', '0', '255', '1', '1', '1', '1', '|', 'Fold Out Vertically', '1', '255', '1', '0', '1', '1', '0.250', '0', '0.5', '255', '1', '1', '1', '1', '|', 'Scale Down', '1', '200', '1', '0', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1', '|', 'Scale Left', '1', '200', '0', '1', '1', '1', '0.250', '1', '0', '255', '1', '1', '1', '1', '|', 'Scale Right', '1', '200', '0', '1', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1', '|', 'Scale Up', '1', '200', '1', '0', '1', '1', '0.250', '0', '1', '255', '1', '1', '1', '1', '|', 'Slide Down', '1', '0', '1', '1', '1', '0.8', '0.350', '0', '0', '255', '1', '1', '1', '1.2', '|', 'Slide Left', '1', '0', '1', '1', '1.2', '1', '0.350', '0', '0', '255', '1', '1', '0.8', '1', '|', 'Slide Right', '1', '0', '1', '1', '0.8', '1', '0.350', '0', '0', '255', '1', '1', '1.2', '1', '|', 'Slide Up', '1', '0', '1', '1', '1', '1.2', '0.350', '0', '0', '255', '1', '1', '1', '0.8', '|', 'Squeezed Slide Down', '3', '0', 'MW', '0.8', '1', '1', '0.001', '0', '0', '0', 'MW', '0.8', 'MX', 'UY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', 'IY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Squeezed Slide Left', '3', '0', '0.8', 'MH', '1', '1', '0.001', '0', '0', '0', '0.8', 'MH', 'RX', 'MY', '0.300', '0', '0', '255', '1', 'MH', 'IX', 'MY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Squeezed Slide Right', '3', '0', '0.8', 'MH', '1', '1', '0.001', '0', '0', '0', '0.8', 'MH', 'LX', 'MY', '0.300', '0', '0', '255', '1', 'MH', 'IX', 'MY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Squeezed Slide Up', '3', '0', 'MW', '0.8', '1', '1', '0.001', '0', '0', '0', 'MW', '0.8', 'MX', 'DY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', 'IY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Unmagnify', '1', '100', '1.5', '1.5', '1', '1', '0.250', '0.5', '0.5', '255', '1', '1', '1', '1', '|', 'Zoom In', '1', '100', '0', '0', '1', '1', '0.250', '0.5', '0.5', '255', '1', '1', '1', '1', '|', 'None', '1', '255', '1', '1', '1', '1', '0.0', '0', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks reload-profiles-signal true
gsettings set org.gnome.shell.extensions.animation-tweaks dialog-minimize ['|', 'T', 'Squeezed Slide Down', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', '1', '0.200', '0', '0', '255', 'MW', '0.8', 'MX', 'DY']
gsettings set org.gnome.shell.extensions.animation-tweaks use-application-profiles false
gsettings set org.gnome.shell.extensions.animation-tweaks overrideother-open ['|', 'T', 'Scale Down', '1', '200', '1', '0', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks dialog-open ['|', 'F', 'Fold Out Sideways', '1', '255', '0', '1', '1', '1', '0.250', '0.5', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks normal-unminimize ['|', 'T', 'Squeezed Slide Up', '3', '255', 'MW', '0.8', 'MX', '0', '0.001', '0', '0', '255', '0', '0', 'MX', 'IY', '0.001', '0', '0', '255', '0', '0', 'MX', 'IY', '0.25', '0', '1', '255', '1', '1', 'IX', 'IY']
gsettings set org.gnome.shell.extensions.animation-tweaks wayland true
gsettings set org.gnome.shell.extensions.animation-tweaks closing-effect false
gsettings set org.gnome.shell.extensions.animation-tweaks modaldialog-unminimize ['|', 'F', 'Scale Down', '1', '200', '1', '0', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks unminimizing-effect true
gsettings set org.gnome.shell.extensions.animation-tweaks modaldialog-minimize ['|', 'F', 'Fold In Vertically', '1', '255', '1', '1', '1', '1', '0.250', '0', '0.5', '100', '1', '0', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks splashscreen-open ['|', 'T', 'Zoom In', '1', '100', '0', '0', '1', '1', '0.250', '0.5', '0.5', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks other-open-effects-list ['|', 'Fade In', '1', '0', '1', '1', '1', '1', '0.350', '0', '0', '255', '1', '1', '1', '1', '|', 'Fold Out Sideways', '1', '255', '0', '1', '1', '1', '0.250', '0.5', '0', '255', '1', '1', '1', '1', '|', 'Fold Out Vertically', '1', '255', '1', '0', '1', '1', '0.250', '0', '0.5', '255', '1', '1', '1', '1', '|', 'Scale Down', '1', '200', '1', '0', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1', '|', 'Scale Left', '1', '200', '0', '1', '1', '1', '0.250', '1', '0', '255', '1', '1', '1', '1', '|', 'Scale Right', '1', '200', '0', '1', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1', '|', 'Scale Up', '1', '200', '1', '0', '1', '1', '0.250', '0', '1', '255', '1', '1', '1', '1', '|', 'Slide Down', '1', '0', '1', '1', '1', '0.8', '0.350', '0', '0', '255', '1', '1', '1', '1.2', '|', 'Slide Left', '1', '0', '1', '1', '1.2', '1', '0.350', '0', '0', '255', '1', '1', '0.8', '1', '|', 'Slide Right', '1', '0', '1', '1', '0.8', '1', '0.350', '0', '0', '255', '1', '1', '1.2', '1', '|', 'Slide Up', '1', '0', '1', '1', '1', '1.2', '0.350', '0', '0', '255', '1', '1', '1', '0.8', '|', 'Unmagnify', '1', '100', '1.5', '1.5', '1', '1', '0.250', '0.5', '0.5', '255', '1', '1', '1', '1', '|', 'Zoom In', '1', '100', '0', '0', '1', '1', '0.250', '0.5', '0.5', '255', '1', '1', '1', '1', '|', 'None', '1', '255', '1', '1', '1', '1', '0.0', '0', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks window-unminimize-effects-list ['|', 'Contracted Rise Left', '3', '255', 'MW', 'MH', '1', '1', '0.001', '0', '0', '0', '0.8', 'MH', 'RX', 'MY', '0.300', '0', '0', '255', 'MW', 'MH', 'IX', 'MY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Contracted Rise Right', '3', '255', 'MW', 'MH', '1', '1', '0.001', '0', '0', '0', '0.8', 'MH', 'LX', 'MY', '0.300', '0', '0', '255', 'MW', 'MH', 'IX', 'MY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Contracted Rise Down', '3', '255', 'MW', 'MH', 'MX', 'MY', '0.001', '0', '0', '0', 'MW', '0.8', 'MX', 'UY', '0.300', '0', '0', '255', 'MW', 'MH', 'MX', 'IY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Contracted Rise Up', '3', '255', 'MW', 'MH', 'MX', 'MY', '0.001', '0', '0', '0', 'MW', '0.8', 'MX', 'DY', '0.300', '0', '0', '255', 'MW', 'MH', 'MX', 'IY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Fade In', '1', '0', '1', '1', '1', '1', '0.350', '0', '0', '255', '1', '1', '1', '1', '|', 'Fold Out Sideways', '1', '255', '0', '1', '1', '1', '0.250', '0.5', '0', '255', '1', '1', '1', '1', '|', 'Fold Out Vertically', '1', '255', '1', '0', '1', '1', '0.250', '0', '0.5', '255', '1', '1', '1', '1', '|', 'Scale Down', '1', '200', '1', '0', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1', '|', 'Scale Left', '1', '200', '0', '1', '1', '1', '0.250', '1', '0', '255', '1', '1', '1', '1', '|', 'Scale Right', '1', '200', '0', '1', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1', '|', 'Scale Up', '1', '200', '1', '0', '1', '1', '0.250', '0', '1', '255', '1', '1', '1', '1', '|', 'Slide Down', '1', '0', '1', '1', '1', '0.8', '0.350', '0', '0', '255', '1', '1', '1', '1.2', '|', 'Slide Left', '1', '0', '1', '1', '1.2', '1', '0.350', '0', '0', '255', '1', '1', '0.8', '1', '|', 'Slide Right', '1', '0', '1', '1', '0.8', '1', '0.350', '0', '0', '255', '1', '1', '1.2', '1', '|', 'Slide Up', '1', '0', '1', '1', '1', '1.2', '0.350', '0', '0', '255', '1', '1', '1', '0.8', '|', 'Squeezed Slide Down', '3', '0', 'MW', '0.8', '1', '1', '0.001', '0', '0', '0', 'MW', '0.8', 'MX', 'UY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', 'IY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Squeezed Slide Left', '3', '0', '0.8', 'MH', '1', '1', '0.001', '0', '0', '0', '0.8', 'MH', 'RX', 'MY', '0.300', '0', '0', '255', '1', 'MH', 'IX', 'MY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Squeezed Slide Right', '3', '0', '0.8', 'MH', '1', '1', '0.001', '0', '0', '0', '0.8', 'MH', 'LX', 'MY', '0.300', '0', '0', '255', '1', 'MH', 'IX', 'MY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Squeezed Slide Up', '3', '0', 'MW', '0.8', '1', '1', '0.001', '0', '0', '0', 'MW', '0.8', 'MX', 'DY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', 'IY', '0.200', '0', '0', '255', '1', '1', 'IX', 'IY', '|', 'Unmagnify', '1', '100', '1.5', '1.5', '1', '1', '0.250', '0.5', '0.5', '255', '1', '1', '1', '1', '|', 'Zoom In', '1', '100', '0', '0', '1', '1', '0.250', '0.5', '0.5', '255', '1', '1', '1', '1', '|', 'None', '1', '255', '1', '1', '1', '1', '0.0', '0', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks normal-open ['|', 'F', 'Scale Down', '1', '200', '1', '0', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks normal-minimize ['|', 'T', 'Squeezed Slide Down', '2', '255', '1', '1', 'SX', 'SY', '0.299', '0', '1', '255', 'MW', '0', 'MX', '1', '0.000997', '0', '0', '255', '0', '0', 'MX', 'DY']
gsettings set org.gnome.shell.extensions.animation-tweaks opening-effect-windows false
gsettings set org.gnome.shell.extensions.animation-tweaks opening-effect-others true
gsettings set org.gnome.shell.extensions.animation-tweaks tooltip-open ['|', 'T', 'Slide Up', '1', '0', '1', '1', '1', '1.2', '0.350', '0', '0', '255', '1', '1', '1', '0.8']
gsettings set org.gnome.shell.extensions.animation-tweaks combo-open ['|', 'T', 'Scale Down', '1', '200', '1', '0', '1', '1', '0.250', '0', '0', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks normal-close ['|', 'F', 'Fold In Sideways', '1', '255', '1', '1', '1', '1', '0.250', '0.5', '0', '100', '0', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks name-list @as []
gsettings set org.gnome.shell.extensions.animation-tweaks dialog-close ['|', 'F', 'Fold In Sideways', '1', '255', '1', '1', '1', '1', '0.250', '0.5', '0', '100', '0', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks reload-signal false
gsettings set org.gnome.shell.extensions.animation-tweaks minimizing-effect true
gsettings set org.gnome.shell.extensions.animation-tweaks application-list @as []
gsettings set org.gnome.shell.extensions.animation-tweaks modaldialog-open ['|', 'F', 'Fold Out Vertically', '1', '255', '1', '0', '1', '1', '0.250', '0', '0.5', '255', '1', '1', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks modaldialog-close ['|', 'F', 'Fold In Vertically', '1', '255', '1', '1', '1', '1', '0.250', '0', '0.5', '100', '1', '0', '1', '1']
gsettings set org.gnome.shell.extensions.animation-tweaks window-minimize-effects-list ['|', 'Contracted Drop Down', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', 'MH', 'MX', '1.2', '0.200', '0', '0', '255', 'MW', 'MH', 'MX', 'DY', '|', 'Contracted Drop Left', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', 'MH', '1.8', 'MY', '0.200', '0', '0', '255', 'MW', 'MH', 'LX', 'MY', '|', 'Contracted Drop Right', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', 'MH', '1.2', 'MY', '0.200', '0', '0', '255', 'MW', 'MH', 'RX', 'MY', '|', 'Contracted Drop Up', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', 'MH', 'MX', '1.8', '0.200', '0', '0', '255', 'MW', 'MH', 'MX', 'UY', '|', 'Fade Out', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '0.99', '0.99', '1', '1', '|', 'Fold In Sideways', '1', '255', '1', '1', '1', '1', '0.250', '0.5', '0', '100', '0', '1', '1', '1', '|', 'Fold In Vertically', '1', '255', '1', '1', '1', '1', '0.250', '0', '0.5', '100', '1', '0', '1', '1', '|', 'Magnify', '1', '255', '1', '1', '1', '1', '0.250', '0.5', '0.5', '0', '1.2', '1.2', '1', '1', '|', 'Scale Down', '1', '255', '1', '1', '1', '1', '0.250', '0', '1', '0', '1', '0', '1', '1', '|', 'Scale Left', '1', '255', '1', '1', '1', '1', '0.250', '0', '0', '0', '0', '1', '1', '1', '|', 'Scale Right', '1', '255', '1', '1', '1', '1', '0.250', '1', '0', '0', '0', '1', '1', '1', '|', 'Scale Up', '1', '255', '1', '1', '1', '1', '0.250', '0', '0', '0', '1', '0', '1', '1', '|', 'Slide Down', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '1', '1', '1', '1.2', '|', 'Slide Left', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '1', '1', '0.8', '1', '|', 'Slide Right', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '1', '1', '1.2', '1', '|', 'Slide Up', '1', '255', '1', '1', '1', '1', '0.350', '0', '0', '0', '1', '1', '1', '0.8', '|', 'Squeezed Slide Down', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', '1', '0.200', '0', '0', '255', 'MW', '0.8', 'MX', 'DY', '|', 'Squeezed Slide Left', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', '0.8', 'MH', '1', 'MY', '0.200', '0', '0', '255', '0.8', 'MH', 'LX', 'MY', '|', 'Squeezed Slide Right', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', '0.8', 'MH', '1', 'MY', '0.200', '0', '0', '255', '0.8', 'MH', 'RX', 'MY', '|', 'Squeezed Slide Up', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '0', '255', 'MW', '0.8', 'MX', '1', '0.200', '0', '0', '255', 'MW', '0.8', 'MX', 'UY', '|', 'Zoom Out', '1', '255', '1', '1', '1', '1', '0.250', '0.5', '0.5', '0', '0', '0', '1', '1', '|', 'None', '1', '255', '1', '1', '1', '1', '0.0', '0', '0', '0', '1', '1', '1', '1']


echo "Logout and re-login for changes to take effect";
