return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      sql = { "sqlfluff" }, -- Formateador SQL con dialecto postgres
    },

    -- No formatear automáticamente al guardar (lo hace autocmds.lua)
    format_on_save = false,

    -- Configuración del formateador SQL
    formatters = {
      sqlfluff = {
        command = "sqlfluff",
        args = { "format", "--dialect=postgres", "--nocolor", "-" },
        stdin = true,
        require_cwd = false,   -- No requiere encontrar directorio raíz
        exit_codes = { 0, 1 }, -- 1 puede indicar cambios aplicados
      },
    },
  },
}
