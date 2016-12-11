# vim-stylefmt

Format your stylesheets using [stylefmt](https://github.com/morishitter/stylefmt) inside Vim.
Stylefmt supports the latest CSS syntax and understands CSS-like syntax such as SCSS, Stylus and Less.

This plugin is heavily inspired by [vim-esformatter](https://github.com/millermedeiros/vim-esformatter).

## Installation

First you need to install stylefmt (make sure you have [Node.js](https://nodejs.org/)
installed):

```
npm install -g stylefmt
```

Then install the plugin:

* Manual installation:
  - Copy the files to your `.vim/plugin` directory
* Pathogen
  - `cd ~/.vim/bundle && git clone git://github.com/kewah/vim-stylefmt.git`
* Vundle
  - Add `Plugin 'kewah/vim-stylefmt'` to `.vimrc`
  - Run `:PluginInstall`
* NeoBundle
  - Add `NeoBundle 'kewah/vim-stylefmt'` to `.vimrc`
  - Run `:NeoBundleInstall`
* vim-plug
  - Add `Plug 'kewah/vim-stylefmt'` to `.vimrc`
  - Run `:PlugInstall`


## Usage

In normal mode:
* `:Stylefmt`: format the whole buffer.

In Visual mode:
* `:'<,'>StylefmtVisual`: format the selected block.

Or by mapping the commands in your `.vimrc`:
```
nnoremap <silent> <leader>cs :Stylefmt<CR>
vnoremap <silent> <leader>cs :StylefmtVisual<CR>
```


## License

Released under the [wtfpl](http://sam.zoy.org/wtfpl/COPYING) license
