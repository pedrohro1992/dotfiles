return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "terraform-ls",
        "tflint",
        "tfsec",
        "yaml-language-server",
        "ansible-language-server",
        "docker-compose-language-service",
        "dockerfile-language-server",
      },
    },
  },
}
