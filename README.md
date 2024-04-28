# cmd-theme-converter

This is a converter that can convert windows terminal color schemes to a `.reg` file, which can be applied to set color theme on cmd.

## Exmample

First generate `.reg` file:

```plain
perl from-windows-terminal.pl test/monokai-pro-windows-terminal.json > monokai-pro.reg
```

Then apply it via `regedit`:

```plain
regedit -s monokai-pro.reg
```

Start a new cmd session and the changes will take effect.

## Where to find color schemes

<https://windowsterminalthemes.dev/>
