local servers = require 'plugins.config.lsp.servers'
local registry = require 'mason-registry'
local Package = require 'mason-core.package'

require('mason').setup()
require('mason-lspconfig').setup { ensure_installed = servers }

local formatters_linters = {
  'ansible-lint',
  'shfmt',
  'ruff',
  'stylua',
  'taplo',
  'yamlfmt',
  'dockerfmt',
}

---@param tool_name string
local function resolve_package(tool_name)
  local Optional = require 'mason-core.optional'

  local ok, pkg = pcall(registry.get_package, tool_name)
  local result = ok and pkg or nil

  return Optional.of_nilable(result)
end

-- install formatters and linters
for _, tool in ipairs(formatters_linters) do
  local tool_name, version = Package.Parse(tool)

  resolve_package(tool_name)
    :if_present(
      ---@param pkg Package
      function(pkg)
        if not pkg:is_installed() and not pkg:is_installing() then
          pkg:install(
            { version = version },
            vim.schedule_wrap(function(success, err)
              if success then
                vim.notify(
                  ('[mason.custom_config] %s was successfully installed'):format(
                    pkg.name
                  ),
                  vim.log.levels.INFO
                )
              else
                vim.notify(
                  ('[mason.custom_config] failed to install %s. Installation logs are available in :Mason and :MasonLog'):format(
                    pkg.name
                  ),
                  vim.log.levels.ERROR
                )
              end
            end)
          )
        end
      end
    )
    :if_not_present(function()
      vim.notify(
        ('[mason.custom_config] Tool %q is not exists in mason registry'):format(tool),
        vim.log.levels.WARN
      )
    end)
end
