local opt = vim.opt

opt.number = true         -- LSP樣式改為圓形
opt.relativenumber = true -- 顯示行號
opt.cursorline = true     -- 顯示相對行號，方便跳轉
opt.mouse = "a"           -- 突顯當前行

opt.tabstop = 2           -- Tab 寬度為 4 空格
opt.shiftwidth = 2        -- >> << 操作時移動 4 空格
opt.softtabstop = 2       -- 按下 Tab 鍵時插入 4 空格
opt.expandtab = true      -- 將 Tab 轉換為空格 而不是\t

opt.ignorecase = true     -- 搜尋時忽略大小寫
opt.smartcase = true      -- 若搜尋包含大寫字母，則區分大小寫
opt.inccommand = "split"  -- 使用:%s 會有預覽視窗

opt.swapfile = false      -- 建立 swap 檔
opt.backup = false        -- 建立 backup 檔
opt.undofile = true       -- 存檔後仍然可以undo

opt.clipboard = "unnamedplus"
opt.termguicolors = true -- 突出色彩表現

opt.scrolloff = 999      -- 設置螢幕捲動時上下保留999 但沒那麼多 所以達成 畫面置中效果

-- C 語言 switch case 縮排
opt.cindent = true
opt.cinoptions = ":0,l1,t0"
