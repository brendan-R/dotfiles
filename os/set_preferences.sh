#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")" && source "../utils.sh"

# ----------------------------------------------------------------------
# | UI/UX                                                              |
# ----------------------------------------------------------------------

set_ui_and_ux_settings() {

    # Hide the bluetooth and volume icons from the menu bar
    gsettings set com.canonical.indicator.bluetooth visible false
    gsettings set com.canonical.indicator.sound visible false

    # Hide the battery icon from the menu bar when the battery is not in use
    gsettings set com.canonical.indicator.power icon-policy "charge"
    gsettings set com.canonical.indicator.power show-time false

    # Use custom date format in the menu bar
    # (for other date interpreted sequences: date --help)
    gsettings set com.canonical.indicator.datetime custom-time-format "%l:%M %p"
    gsettings set com.canonical.indicator.datetime time-format "custom"

    # Set desktop background image location and options
    gsettings set org.gnome.desktop.background picture-options "stretched"
    # gsettings set org.gnome.desktop.background picture-uri "file:///home/..."

    # Set Launcher favorites
    gsettings set com.canonical.Unity.Launcher favorites "[
        'ubiquity-gtkui.desktop',
        'nautilus-home.desktop',
        'chromium-browser.desktop',
        'google-chrome.desktop',
        'firefox.desktop',
        'firefox-trunk.desktop',
        'opera-browser.desktop',
        'opera-next-browser.desktop'
    ]"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    execute "set_ui_and_ux_settings" "UI & UX"
}

main
