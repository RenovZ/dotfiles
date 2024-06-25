property currentTheme : ""

on run
    set currentTheme to getCurrentTheme()
    checkThemeChange()
end run

on getCurrentTheme()
    tell application "System Events"
        tell appearance preferences
            if dark mode is true then
                return "dark"
            else
                return "light"
            end if
        end tell
    end tell
end getCurrentTheme

on checkThemeChange()
    repeat
        delay 5 -- 每5秒检查一次
        set newTheme to getCurrentTheme()
        if newTheme is not currentTheme then
            set currentTheme to newTheme
            do shell script "${HOME}/.config/helix/themes/darklight.sh " & currentTheme
        end if
    end repeat
end checkThemeChange
