# Detection

hook global BufCreate .*[.]tidal %{
  set-option buffer filetype tidal
}

# Initialization

hook global WinSetOption filetype=tidal %{
  # taken from haskell.kak
  require-module haskell
  set-option buffer extra_word_chars '_' "'"
  hook window ModeChange pop:insert:.* -group haskell-trim-indent  haskell-trim-indent
  hook window InsertChar \n -group haskell-indent haskell-indent-on-new-line
  hook -once -always window WinSetOption filetype=.* %{
    remove-hooks window haskell-.+
  }
  add-highlighter window/haskell ref haskell
  hook -once -always window WinSetOption filetype=.* %{
    remove-highlighter window/haskell
  }
  require-module tidal
}

# Actual module

provide-module tidal %{

  declare-option -docstring "tidal_bootfile: path to BootTidal.hs" str tidal_bootfile "BootTidal.hs"

  define-command -docstring "tidal-start: starts tidal repl using the BootTidal.hs file as the boot script" tidal-start %{
    tmux-repl-horizontal ghci -ghci-script %opt{tidal_bootfile}
    tmux-focus
  }

  define-command -docstring "tidal-send-line: send the current line to tidal" tidal-send-line %{
    execute-keys x
    repl-send-text
  }

  define-command -docstring "tidal-send-block: sends the current paragraph to the tidal" tidal-send-block %{
    execute-keys <a-i>p
    nop %sh{
      tmux set-buffer -b kak_selection ":{
${kak_selection}
:}
"
    	tmux paste-buffer -b kak_selection -t "$kak_opt_tmux_repl_id"
    }
  }

  define-command -docstring "tidal-send-hush: sends the hush command to the REPL" tidal-hush %{
    repl-send-text "hush
"
  }
}

