-- >> Convenience
local g = vim.g

-- >> KNAP
-- << Configuration
---- set shorter name for keymap function
local kmap = vim.keymap.set

---- F5 processes the document once, and refreshes the view
kmap({ 'n', 'v', 'i' },'<F5>', function() require("knap").process_once() end)

---- F6 closes the viewer application, and allows settings to be reset
kmap({ 'n', 'v', 'i' },'<F6>', function() require("knap").close_viewer() end)

---- F7 toggles the auto-processing on and off
kmap({ 'n', 'v', 'i' },'<F7>', function() require("knap").toggle_autopreviewing() end)

---- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap({ 'n', 'v', 'i' },'<F8>', function() require("knap").forward_jump() end)

-- KNAP configuration
local knap_conf = {
    texoutputext = "pdf",
    textopdf = "latexmk -synctex=1 -halt-on-error -interaction=batchmode -pdflatex=lualatex -pdf %srcfile%",
    -- Speed setting
    delay = 100
}

vim.g.knap_settings = knap_conf
