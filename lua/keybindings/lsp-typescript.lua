local opt = {
	noremap = true,
	silent = true,
}

return function(mapbuf)
	mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
	mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
	mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end
