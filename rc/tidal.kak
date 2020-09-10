provide-module tidal %{
    define-command tidal-start-repl %{
        eval "repl ghci -ghci-script ../BootTidal.hs"
    }
}
