pplication "CotEditor"
    if exists front document then
        set thisfile to path of front document as Unicode text

        if (thisfile is not "") then 
            tell application "Terminal"
                activate
                do script with command "latexmk -cd -c \"" & thisfile & "\"; exit"
            end tell
        end if
        activate
    end if
end tell

