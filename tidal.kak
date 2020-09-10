declare-option str tidal_plugin_path %sh{ dirname "$kak_source" }

define-command tidal-start-repl %{
    repl ghci -ghci-script "%opt{tidal_plugin_path}/BootTidal.hs"
    tmux-focus
}

define-command tidal-send-line %{
    execute-keys x
    send-text
}

define-command tidal-send-block %{
    execute-keys <a-a>p
    send-text
}

#define-command tidal-hush %{
#    send-text hush
#}

hook global WinCreate .*\.tidal %{
    set-option window filetype haskell
}

map global normal <c-e> ':tidal-send-block<ret>'
