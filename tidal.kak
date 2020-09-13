declare-option str tidal_plugin_path %sh{ dirname "$kak_source" }

define-command tidal-start-repl %{
    repl ghci -ghci-script "%opt{tidal_plugin_path}/BootTidal.hs"
    tmux-focus
}

define-command tidal-start-superdirt %{
    tmux-terminal-window sclang "%opt{tidal_plugin_path}/superdirt.sc"
}

define-command tidal-send-line %{
    execute-keys x
    send-text
}

define-command tidal-send-block %{
    execute-keys <a-i>p
    nop %sh{
        tmux set-buffer -b kak_selection ":{
${kak_selection}
:}
"
    	tmux paste-buffer -b kak_selection -t "$kak_opt_tmux_repl_id"
    }
}

define-command tidal-hush %{
    send-text "hush
"
}

hook global WinCreate .*\.tidal %{
    set-option window filetype haskell
}

