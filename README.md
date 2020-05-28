## Material and Mouse driven theme for [AwesomeWM 4.3](https://awesomewm.org/)
### Original work by PapyElGringo, official development seem to have moved to [material-shell](https://github.com/PapyElGringo/material-shell)

Note: This fork focuses on streamlining the config and adding some Quality of Life touches to the theme.

An almost desktop environment made with [AwesomeWM](https://awesomewm.org/) following the [Material Design guidelines](https://material.io) with a performant opiniated mouse/keyboard workflow to increase daily productivity and comfort.

[![](./theme/PapyElGringo-theme/demo.gif?raw=true)](https://www.reddit.com/r/unixporn/comments/anp51q/awesome_material_awesome_workflow/)
*[Click to view in high quality](https://www.reddit.com/r/unixporn/comments/anp51q/awesome_material_awesome_workflow/)*

| Tiled         | Panel         | Exit screen   |
|:-------------:|:-------------:|:-------------:|
|![](https://i.imgur.com/fELCtep.png)|![](https://i.imgur.com/7IthpQS.png)|![](https://i.imgur.com/rcKOLYQ.png)|



## Installation
### Note: the best transition is from gnome to material-awesome as KDE-plasma can break some indicators until plasma is purged entierly.

### 1) Get all the dependencies
- [AwesomeWM](https://awesomewm.org/) as the window manager - universal package install: awesome
- [Roboto](https://fonts.google.com/specimen/Roboto) as the **font** - Debian: fonts-roboto Arch: ttf-roboto Fedora: google-fonts-roboto
- [Rofi](https://github.com/DaveDavenport/rofi) for the app launcher - universal install: rofi
- [Compton](https://github.com/tryone144/compton) for the compositor (blur and animations) universal install: compton
- [i3lock](https://github.com/meskarune/i3lock-fancy) the lockscreen application - Debian: i3lock-fancy Arch: i3lock Fedora: i3lock
- [xclip](https://github.com/astrand/xclip) for copying screenshots to clipboard package - universal package install: xclip
- __gnome-keyring__ and a __policykit-agent__ (by default policykit-1-gnome is enabled) OR mate-polkit
- (Optional) __qt5-styles-gtk2__ or __qt5-styleplugins-git__ for making QT and KDE applications look the same as gnome applications - Debian: qt5-style-plugins Fedora: qt5-qtstyleplugins
- (Optional) [Materia](https://github.com/nana-4/materia-theme) as GTK theme - Arch: materia-theme Debian: materia-gtk-theme Fedora: materia-gtk-theme
- (Optional) [Papirus Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) as icon theme - Universal Install: wget -qO- https://git.io/papirus-icon-theme-install | sh
- (Optional) [lxappearance](https://sourceforge.net/projects/lxde/files/LXAppearance/) to set up the gtk and icon theme
- (Optional) [xbacklight](https://www.x.org/archive/X11R7.5/doc/man/man1/xbacklight.1.html) for adjusting brightness on laptops (disabled by default)
- (Optional) [flameshot](https://flameshot.js.org/) my personal screenshot utility of choice, can be replaced by whichever you want, just remember to edit the screenshot utility script

### 2) Clone the configuration

```
git clone https://github.com/StippeJ/material-awesome.git ~/.config/awesome
```

> Awesome 4.3 is so new that most of the distributions have not updated it yet. If you want to install this config on Awesome 4.2 (current version on depo) use the specific awesome-4.2 branch (not in development by me)

```
git clone -b awesome-4.2 https://github.com/PapyElGringo/material-awesome.git ~/.config/awesome
```

### 3) Set the themes
Start **lxappearance** to active the **icon** theme and **GTK** theme
Note: for cursor theme, edit `~/.icons/default/index.theme` and `~/.config/gtk3-0/settings.ini`, for the change to also show up in applications run as root, copy the 2 files over to their respective place in `/root`.

### 4) Same theme for Qt/KDE applications and GTK applications, and fix missing indicators
First install `qt5-style-plugins` or `qt5-style-gtk2` (debian) | `qt5-styleplugins` (arch) and add this to the bottom of your `/etc/environment`

```bash
XDG_CURRENT_DESKTOP=Unity
QT_QPA_PLATFORMTHEME=gtk2
```

The first variable fixes most indicators (especially electron based ones!), the second tells Qt and KDE applications to use your gtk2 theme set through lxappearance.


### 5) Read the documentation
The documentation live within the source code.

The project is split in functional directories and in each of them there is a readme where you can get additionnal informations about the them.

* [Configuration](./configuration) is about all the **settings** available
* [Layout](./layout) hold the **disposition** of all the widgets
* [Module](./module) contain all the **features** available
* [Theme](./theme) hold all the **aestetic** aspects
* [Widget](./widget) contain all the **widgets** available
