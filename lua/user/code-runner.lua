-- path: absolute path of the file
-- fn: filename with extension, e.g main.py
-- fnOnly: filename without extension, e.g main
-- field: filetype
-- value can take:
-- table (automatically concat with space separator)
-- string
-- function (return table or string)
local filetype = {
  python = { "cd $path &&", "python3 $fn" },
  javascript = { "cd $path &&", "node $fn" },
  lua = { "cd $path", "&& lua $fn" },
  java = function()
    local java_root = require("jdtls.setup").find_root({ "gradlew" })
    return java_root and "cd " .. java_root .. " && gradle --console plain run" or "cd $path && java $fn"
  end,
  dart = "cd $path && dart $fn",
  cpp = "cd $path && g++ $fn -o '$fnOnly.out' && ./$fnOnly.out",
}

return filetype
