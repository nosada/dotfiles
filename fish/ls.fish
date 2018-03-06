function ls --description "List contents of directory"
    set -l param -FG --color=auto --group-directories-first
    if isatty 1
        set param $param --indicator-style=classify
    end

    if command ls --version >/dev/null ^/dev/null
        command ls $param $argv
    else if command gls --version >/dev/null ^/dev/null
        command gls $param $argv
    end
end

if not set -q LS_COLORS
    if begin; command -sq dircolors; or command -sq gdircolors; end
        set -l colorfile
        for file in ~/.dir_colors ~/.dircolors /etc/DIR_COLORS
            if test -f $file
                set colorfile $file
                break
            end
        end
    end

    if command -sq dircolors
        set -gx LS_COLORS (dircolors -c $colorfile | string split ' ')[3]
    else if command -sq gdircolors
        set -gx LS_COLORS (gdircolors -c $colorfile | string split ' ')[3]
    end

    if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
        set LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
    end
end

# vim:set ts=4 sw=4 et:
