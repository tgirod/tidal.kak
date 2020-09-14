declare-option str tidal_plugin_path %sh{ dirname "$kak_source" }

define-command -params 1 -file-completion -docstring "tidal-start-repl <boot.hs>: starts tidal repl using <boot.hs> as the boot script" tidal-start-repl %{
    repl ghci -ghci-script "%arg{1}"
    tmux-focus
}

define-command tidal-start-superdirt -docstring "tidal-start-superdirt: starts supercollider and loads the superdirt synth" %{
    tmux-terminal-window sclang "%opt{tidal_plugin_path}/superdirt.sc"
}

define-command -docstring "tidal-send-line: selects the current line and sends it to the REPL" tidal-send-line %{
    execute-keys x
    send-text
}

define-command -docstring "tidal-send-block: selects the current paragraph and sends it to the REPL" tidal-send-block %{
    execute-keys <a-i>p
    nop %sh{
        tmux set-buffer -b kak_selection ":{
${kak_selection}
:}
"
    	tmux paste-buffer -b kak_selection -t "$kak_opt_tmux_repl_id"
    }
}

define-command -docstring "tidal-hush: sends the hush command to the REPL" tidal-hush %{
    send-text "hush
"
}

hook global WinCreate .*\.tidal %{
    set-option window filetype haskell
}

