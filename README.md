clafer-vim 
==========
Integration of Clafer into VIM editing environment
ver. 1

Contributors
------------
Andrzej Wąsowski

Features
--------
* syntax highlighting for structural and behavioral Clafer, including marking simple errors
* indentation based folding for collapsing parts of the model (experimental)

Usage
-----
After installing (see below) just open or create a Clafer file with a .cfr
extension. Highlighting and folding should work out of the box.

Installation
------------
Please use a package manager.  This plugin should work with
pathogen (https://github.com/tpope/vim-pathogen) and vundle
(https://github.com/gmarik/Vundle.vim). It should be cloned 
to your bundle directory.

I am using [vundle](https://github.com/gmarik/Vundle.vim), so 
I added to the vundle section of my `.vimrc` file:

	Plugin 'wasowski/clafer-vim'

Then I start (or restart) vim and run

	:PluginInstall

After the command has terminated, you should be ready to clafer.

To update the plugin to the newest version on Github just run:

	:PluginUpdate

To uninstall, remove the clafer-vim line from `.vimrc` first, then restart vim and run 

	:PluginClean

Known Problems
--------------
* Folding is dependent on the depth of indentation. Doesn't always work.

TODO 
----
* make folding robust
* provide indentation logics, if any
* integrate use of tags for navigation in the model
* integrate instance generator 
* provide a plugin menu for Clafer
* write a help file

Pull requests are welcomed.
