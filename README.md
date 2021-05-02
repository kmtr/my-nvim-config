# nvim configurations

## Setup

### Install nvim 0.5

note: nvim 0.5 is not stable (2021-04)

#### Mac

```
% brew install neovim --HEAD
```

#### Linux

```
% curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
% chmod u+x nvim.appimage
```

### Install junegunn/vim-plug

ref: https://github.com/junegunn/vim-plug

### Install Configurations

```zsh
% ln -s $(pwd)/my-nvim-config $HOME/.config/nvim
```

And run `:PlugInstall` .

## Architecture

### Codemap

#### README.md

You are reading now.

#### init.vim

It is the entrypoint of nvim configuration.
You should write global settings and plugins list except key-mappings.
Other configurations are in `_config/`

The last line is for loading any other configurations from `_config/` .

#### _config/

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

#### plugged/

Plugins are downloaded to this directory.

**DO NOT TOUCH with your hand!**

## Key mappings

|*key*|*effect*|
|-----|--------|
| `<C-a>` | `<Home>` |
| `<C-e>` | `<End>` |
| `<Leader>y` | Copy to the clipboard |
| `<Leader>d` | Cut to the clipboard |
| `<Leader>p` | Paste from the clipboard |
| `<C-n>` | NERDTreeToggle |

### ref

https://mattn.kaoriya.net/software/vim/20191231001537.htm

# LSP

## Install

### gopls

https://github.com/golang/tools/blob/master/gopls/README.md#installation

### rust-analyzer

https://rust-analyzer.github.io/manual.html#installation

### clojure-lsp

https://clojure-lsp.github.io/clojure-lsp/installation/

### pyls

https://github.com/palantir/python-language-server#installation

