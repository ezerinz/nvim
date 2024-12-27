-- $path: absolute path of the file
-- $fn: filename with extension, e.g main.py
-- $fnOnly: filename without extension, e.g main
-----------------------------------------------------
-- field: filetype
-- value:
-- table (automatically concat with space separator), or
-- string, or
-- function (return table or string)
local filetype = {
  python = { "cd $path &&", "python3 $fn" },
  javascript = { "cd $path &&", "node $fn" },
  lua = { "cd $path", "&& lua $fn" },
  java = function()
    local java_root = require("jdtls.setup").find_root({ "gradlew" })
    return java_root and "cd " .. java_root .. " && gradle --console plain run" or "cd $path && java $fn"
  end,
  dart = function()
    local current_dir = vim.fn.expand("%:p:h")
    local find_root = require("flutter-tools.utils.path").find_root
    local is_project = find_root({ "pubspec.yaml" }, current_dir)
    if is_project then
      local is_flutter = find_root({ "android/", "ios/", "linux/", "macos/", "web/", "windows/" }, current_dir)
      if is_flutter then
        local puro = find_root({ ".puro.json" }, current_dir)
        return "cd "
          .. vim.fn.fnamemodify(current_dir, ":h")
          .. " && "
          .. (puro and "puro flutter run" or "flutter run")
      else
        return "cd " .. vim.fn.fnamemodify(current_dir, ":h") .. " && dart run"
      end
    else
      return "cd $path && dart $fn"
    end
  end,
  cpp = "cd $path && g++ $fn -o '$fnOnly.out' && ./$fnOnly.out",
}

return filetype
