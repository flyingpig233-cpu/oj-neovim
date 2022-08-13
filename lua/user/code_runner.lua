require('code_runner').setup({
  mode = "float",
  focus = true,
  startinsert = true,
  -- put here the commands by filetype
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    cpp = "cd $dir && g++ -std=c++20 -Wall -Wno-sign-compare $file -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    cpp_fin = "cd $dir && g++ -std=c++20 -Wall -Wno-sign-compare $file -o $fileNameWithoutExt &&"
          .. "$dir/$fileNameWithoutExt < /tmp/in.in > /tmp/out.out",
    python = "python3 -u",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
  },
})

vim.keymap.set('n', '<leader>ri', ':wa | RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':wa | RunCode cpp_fin<CR>', { noremap = true, silent = false })
