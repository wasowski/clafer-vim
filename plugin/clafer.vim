" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1



" Only define functions in the first run of the script
if !exists("*s:ClaferSaveConfiguration")
	function s:ClaferSaveConfiguration()
		let s:save_cpo = &cpo
		set cpo&vim
	endfunction 
	
	function s:ClaferRestoreConfiguration()
		let &cpo = s:save_cpo
		unlet s:save_cpo
	endfunction
endif


" THE SCRIPT STARTS HERE
call s:ClaferSaveConfiguration()


" code to deactivate the plugin should go between the quotes (like a
" destructor).  VIM calls this on user deactivating the plugin (a callback)
let b:undo_ftplugin = ""


" at the moment the script does nothing
echo "Ala ma kota"

" see help 41.13 for inspiration

call s:ClaferRestoreConfiguration()


