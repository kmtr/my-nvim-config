# nvim configurations

## Plugins

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim).
The command `:Lazy` shows the console.
You quit the console with `q`.
If you want to update the installed plugins, run `:Lazy update`.
## Setup

### Install nvim

https://neovim.io/

### Install Configurations

```zsh
% ln -s $(pwd)/my-nvim-config $HOME/.config/nvim
```

### Daily maintenance

```zsh
% nvim
:Lazy update
:TSUpdate
```

## Architecture

### Codemap

#### README.md

You are reading now.

#### init.lua

It is the entrypoint of nvim configuration.
You should write global settings and plugins list except key-mappings.
Other configurations are in `lua/`

#### lua/

It's a directory for configurations about key-mappings and plugin's configurations.
The config files must follow a naming convention in order to be loaded with nvim.

##### Config file naming convention

`{number}-{nice_name}.vim`

Each `number` has loose rules.

|*number*|*meaning*|
|--------|---------|
|0xx     | key-mappings, nvim configuration |
|1xx     | plugin settings that effect whole vim |
|2xx     | LSP |
|3xx     | Filetype |

#### lazy-lock.json

It is made by `lazy.nvim` but in this repo it is in `gitignore`.

## Key mappings

|*key*|*effect*|
|-----|--------|
| `<C-a>` | `<Home>` |
| `<C-e>` | `<End>` |
| `<Leader>y` | (Visual)Copy to the clipboard |
| `<Leader>d` | (Visual)Cut to the clipboard |
| `<Leader>p` | Paste from the clipboard |
| `<C-n>` | NvimTreeOpen |
| `<Leader>n>` | NvimTreeFocus |

# LSP

## rust-analyzer

https://rust-analyzer.github.io/manual.html#installation

## gopls

https://github.com/golang/tools/blob/master/gopls/README.md#installation

