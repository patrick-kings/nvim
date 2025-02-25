local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "js", "jsx", "tsx", "ts", "json5", "json" } }, -- so prettier works only on these filetypes

  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- golang
  b.formatting.gofumpt,

  -- rust
  b.formatting.rustfmt,

}

null_ls.setup {
  debug = true,
  sources = sources,
}
