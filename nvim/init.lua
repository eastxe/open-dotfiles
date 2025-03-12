require("config.lazy")

-- 基本オプションの設定
require('options')

-- ,cfで今のディレクトリのファイルをtelescope find_fileする
local telescope = require('telescope')
local builtin = require('telescope.builtin')

-- 現在のファイルのディレクトリでファイルを検索する関数
function SearchInCurrentDir()
  local current_file = vim.api.nvim_buf_get_name(0)  -- 現在のバッファのファイルパスを取得
  local current_dir = vim.fn.fnamemodify(current_file, ":p:h")  -- ディレクトリパスに変換
  builtin.find_files({ cwd = current_dir })  -- 現在のディレクトリでfind_filesを実行
end

-- コマンドを設定する場合
vim.api.nvim_set_keymap(
  'n',
  '<leader>cf',  -- カスタムキーマッピング、必要に応じて変更
  ':lua SearchInCurrentDir()<CR>',
  { noremap = true, silent = true }
)
