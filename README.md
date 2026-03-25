lze lazy-loading解析

dep_of   在另一個插件之前 但是 在另一個插件的before-hook 之前 白話文: 另一個插件被觸發後 會趕在插件載入前載入 (比被觸發的插件更早載入完成) 

on_plugin 在另一個插件之後 但是 在另一個插件的after-hook 之後 白話文: 另一個插件被觸發後 會在插件載入後再載入  (比被觸發的插件更晚載入完成)

on_require 在某個程式區塊被呼叫 會馬上呼叫插件(但是不保證該插件已經完整載入 所以要謹慎思考使用的方式) 


有兩個插件

A B

examples:
### dep_of
- 1 B 要在 A 啟動前完成載入
 ```lua
 return {
     "mini.icons",
     dep_of = { "Fzf-lua" },
 }
 ```
 最好手動去call setup 
 ```lua
 return {
     "mini.icons",
     dep_of = { "Fzf-lua" },
     after = function ()
         require("mini.icons").setup()
     end,
 }
 ```


### on_plugin
- 2
 - B要在A啟動後完成載入
 ```lua
   return {
       "lspkind",
        on_plugin = { "blink.cmp" },
   }

 ```

### on_require
 ```lua
 return {
     "test.nvim",
     after = function()
         require("test").setup({
            local icons = require("mini.icons")
         })
     end,
 }
 ```
 這時候mini.icons會被呼叫 但是不能確保它已經 setup()完全
