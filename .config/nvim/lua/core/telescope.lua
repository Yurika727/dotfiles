require('telescope').setup{
    defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        file_ignore_patterns = {'node_modules', '.git', 'vendor', 'obj', 'bin'}
    }
}
require('telescope').load_extension('file_browser')
