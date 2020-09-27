declare-option -docstring "tidal repl boot script" \
	str tidal_boot_file "./BootTidal.hs"

declare-option -docstring "superdirt's boot script" \
	str tidal_superdirt_file "./superdirt.sc"

define-command tidal-start-repl -docstring "starts tidal repl" %{
    repl ghci -ghci-script "%opt{tidal_boot_file}"
    tmux-focus
}

define-command tidal-start-superdirt -docstring "starts the superdirt synth" %{
    tmux-terminal-window sclang "%opt{tidal_superdirt_file}"
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

