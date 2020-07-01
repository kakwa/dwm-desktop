dwm-desktop
===========

dwm 6.2 + configuration + mods + shell utilities

Description
===========

dwm-desktop is a modified dwm 6.2 with a custom configuration, plus some shell wrappers.

License
=======

dwm-desktop is released under MIT (same as dwm)

Installation
============

To install dwm-desktop:

```
make install
```

Content
=======

Executables
-----------

* dwm: renamed as dwm-desktop to avoid collision.
* dmenu-user: a simple launcher menu based on dmenu
* dwm-term: shell wrapper that launches a terminal (configurable)
* dwm-browser: shell wrapper that launches a browser (configurable)
* dwm-lock: shell wrapper that launches a lock (configurable)
* dwm-menu: shell wrapper that launches a menu (configurable)

Configuration file (default pathes)
-----------------------------------

* `/etc/dwm-desktop/dwm-desktop.conf`: dwm-desktop configuration (browser, term, etc)
* `/etc/dwm-desktop/dmenu-user`: list of programs presented in dmenu-user menu.

All configuration parameters could be overridden by each users in \<HOME DIR\>/.\<CONFIG FILE\>

Main shortcuts
==============

* Terminal: Alt + Maj + Enter
* Browser: Alt + Enter
* Close focused window: Alt + Maj + Back Space
* Menu: Alt + m
* Change to previous/next workspace: Alt + Arrow left/right
* Resize Window: Alt + Maj + Arrow left/right
* Change focused window: Alt + Arrow up/down
* Change main window (zoom): Alt + Maj + Arrow up
* Lock: Alt + Maj + l

