local Remap = require 'zeus.remap'

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

local jdtls_setup = require 'jdtls.setup'
local home = os.getenv 'HOME'
local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = jdtls_setup.find_root(root_markers)
local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = home .. '/.cache/jdtls/workspace' .. project_name
local path_to_mason_packages = home .. '/.local/share/nvim/mason/packages'
local path_to_jdtls = path_to_mason_packages .. '/jdtls'
local path_to_config = path_to_jdtls .. '/config_linux'
local lombok_path = path_to_jdtls .. '/lombok.jar'
local path_to_jar = path_to_jdtls .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar'

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-javaagent:' .. lombok_path,
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    path_to_jar,
    '-configuration',
    path_to_config,
    '-data',
    workspace_dir,
  },

  root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew' }),

  settings = {
    java = {},
  },
  init_options = {
    bundles = {},
  },
}

require('jdtls').start_or_attach(config)

nnoremap('<leader>oi', '<cmd>lua require "jdtls".organize_imports()<cr>', { desc = 'organize imports' })
vnoremap('<leader>ev', '<cmd>lua require "jdtls".extract_variable()<cr>', { desc = 'extract variable' })
vnoremap('<leader>ec', '<cmd>lua require "jdtls".extract_constant()<cr>', { desc = 'extract constant' })
vnoremap('<leader>em', '<cmd>lua require "jdtls".extract_method()<cr>', { desc = 'extract constant' })
