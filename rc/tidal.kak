provide-module tidal %{
    define-command tidal-start-repl %{
        eval "repl ghci -ghci-script ../BootTidal.hs"
    }


    hook global WinCreate .*\.tidal %{
        set-option window filetype haskell
    }
}
