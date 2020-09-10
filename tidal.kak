declare-option str tidal_plugin_path %sh{ dirname "$kak_source" }

define-command tidal-start-repl %{
    repl ghci -ghci-script "%opt{tidal_plugin_path}/BootTidal.hs"
    tmux-focus
}

define-command tidal-send-line %{
    execute-keys x
    evaluate-commands send-text
}

hook global WinCreate .*\.tidal %{
    set-option window filetype haskell
}
