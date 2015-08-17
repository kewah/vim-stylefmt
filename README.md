# vim-cssfmt

Format your CSS using [CSSfmt](https://github.com/morishitter/cssfmt) inside Vim.

This plugin is heavily inspired by [vim-esformatter](https://github.com/millermedeiros/vim-esformatter).

## Installation

First you need to install CSSfmt (make sure you have [Node.js](https://nodejs.org/) 
installed):

```
npm install -g cssfmt
```

Then install the plugin:

* Manual installation:
  - Copy the files to your `.vim/plugin` directory
* Pathogen
  - `cd ~/.vim/bundle && git clone git://github.com/kewah/vim-cssfmt.git`
* Vundle
  - Add `Bundle 'kewah/vim-cssfmt'` to `.vimrc`
  - Run `:BundleInstall`
* NeoBundle
  - Add `NeoBundle 'kewah/vim-cssfmt'` to `.vimrc`
  - Run `:NeoBundleInstall`
* vim-plug
  - Add `Plug 'kewah/vim-cssfmt'` to `.vimrc`
  - Run `:PlugInstall`


## Usage

In normal mode:
* `:Cssfmt`: format the whole buffer.

In Visual mode:
* `:'<,'>CssfmtVisual`: format the selected block.

Or by mapping the commands in your `.vimrc`:
```
nnoremap <silent> <leader>cs :Cssfmt<CR>
vnoremap <silent> <leader>cs :CssfmtVisual<CR>
```


## License

Released under the [wtfpl](http://sam.zoy.org/wtfpl/COPYING) license
