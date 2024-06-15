return function(_, opts)
  local notify = require "notify"
  notify.setup(opts)
  vim.notify = notify
  vim.notify = function(msg, ...)
    if msg:match "warning: multiple different client offset_encodings" then return end

    notify(msg, ...)
  end
end
