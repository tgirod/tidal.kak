A simple plugin to use the [Tidal Cycles](https://tidalcycles.org/) live programming environment with kakoune.

**do not forget to open kakoune inside tmux!**

So far, it offers the following functions:

- `:tidal-start` opens up the tidal repl in a new pane. You need to have a `BootTidal.hs` file in your working directory
- `:tidal-send-line` sends the current line to the repl
- `:tidal-send-block` sends the current block (paragraph) to the repl
- `:tidal-send-hush` sends the hush command to the repl

To install it with [plug](), add to your kakrc:

```
plug tidal https://github.com/tgirod/tidal.kak %{
  map window user s ':tidal-send-block<ret>'
  map window user h ':tidal-send-hush<ret>'
}
```

