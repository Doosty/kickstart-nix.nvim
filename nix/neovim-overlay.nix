{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  # Use this to create a plugin from an input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  mkNeovim = pkgs.callPackage ./mkNeovim.nix {};

  all-plugins = with pkgs.vimPlugins; [
    # plugins from nixpkgs go in here.
    neo-tree-nvim # file tree | https://github.com/nvim-neo-tree/neo-tree.nvim
    # https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=vimPlugins
    nvim-treesitter.withAllGrammars
    luasnip # snippets | https://github.com/l3mon4d3/luasnip/
    vim-oscyank # copy through SSH

    # nvim-cmp (autocompletion) and extensions
    nvim-cmp # https://github.com/hrsh7th/nvim-cmp
    cmp_luasnip # snippets autocompletion extension for nvim-cmp | https://github.com/saadparwaiz1/cmp_luasnip/
    lspkind-nvim # vscode-like LSP pictograms | https://github.com/onsails/lspkind.nvim/
    friendly-snippets # https://github.com/rafamadriz/friendly-snippets/
    cmp-nvim-lsp # LSP as completion source | https://github.com/hrsh7th/cmp-nvim-lsp/
    cmp-nvim-lsp-signature-help # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/
    cmp-buffer # current buffer as completion source | https://github.com/hrsh7th/cmp-buffer/
    cmp-path # file paths as completion source | https://github.com/hrsh7th/cmp-path/
    cmp-nvim-lua # neovim lua API as completion source | https://github.com/hrsh7th/cmp-nvim-lua/
    cmp-cmdline
    # ^ nvim-cmp extensions

    # git integration plugins
    diffview-nvim # https://github.com/sindrets/diffview.nvim/
    neogit # https://github.com/TimUntersberger/neogit/
    gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim/
    vim-fugitive # https://github.com/tpope/vim-fugitive/
    vim-rhubarb # ?
    # ^ git integration plugins

    # telescope and extensions
    telescope-nvim # https://github.com/nvim-telescope/telescope.nvim/
    telescope-fzy-native-nvim # https://github.com/nvim-telescope/telescope-fzy-native.nvim
    telescope-file-browser-nvim
    telescope-dap-nvim # https://github.com/nvim-telescope/telescope-dap.nvim
    # telescope-smart-history-nvim # https://github.com/nvim-telescope/telescope-smart-history.nvim
    # ^ telescope and extensions

    # UI
    lualine-nvim # Status line | https://github.com/nvim-lualine/lualine.nvim/
    statuscol-nvim # Status column | https://github.com/luukvbaal/statuscol.nvim/
    nvim-treesitter-context # nvim-treesitter-context
    barbar-nvim # tab bar | https://github.com/romgrk/barbar.nvim
    # alternative https://github.com/akinsho/bufferline.nvim
    which-key-nvim # popup with possible keybindings | https://github.com/folke/which-key.nvim/
    # ^ UI

    # language support
    neodev-nvim # adds support for Neovim's Lua API to lua-language-server | https://github.com/folke/neodev.nvim/
    # ^ language support

    # navigation/editing enhancement plugins
    vim-unimpaired # predefined ] and [ navigation keymaps | https://github.com/tpope/vim-unimpaired/
    eyeliner-nvim # Highlights unique characters for f/F and t/T motions | https://github.com/jinh0/eyeliner.nvim
    nvim-surround # https://github.com/kylechui/nvim-surround/
    # alternative | https://github.com/echasnovski/mini.surround
    # pairs https://github.com/echasnovski/mini.pairs
    nvim-treesitter-textobjects # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
    nvim-ts-context-commentstring # https://github.com/joosepalviste/nvim-ts-context-commentstring/
    comment-nvim # https://github.com/numToStr/Comment.nvim
    # ^ navigation/editing enhancement plugins

    # Useful utilities
    nvim-unception # Prevent nested neovim sessions | nvim-unception
    vim-sleuth # Detect tabstop and shiftwidth automatically
    toggleterm-nvim # Terminals inside nvim
    indent-blankline-nvim # Indentation visual helper
    nvim-navbuddy # LSP navigation over symbols
    # ^ Useful utilities

    # Debugging
    nvim-dap
    nvim-dap-ui
    nvim-dap-virtual-text # https://github.com/theHamsta/nvim-dap-virtual-text
    nvim-dap-python
    # Debugging ^

    # Color theme
    #onedark-nvim
    catppuccin-nvim
    #dracula-nvim
    # Color theme ^

    # libraries that other plugins depend on
    sqlite-lua
    vim-repeat
    plenary-nvim # required by neotree, ?
    nvim-web-devicons # required by neotree, ?
    nui-nvim # required by neotree, nvim-navbuddy
    nvim-lspconfig # required by lualine, nvim-navbuddy
    # ^ libraries that other plugins depend on

    # bleeding-edge plugins from flake inputs
    (mkNvimPlugin inputs.wf-nvim "wf.nvim") # keymap hints | https://github.com/Cassin01/wf.nvim
    # ^ bleeding-edge plugins from flake inputs


    # To consider
    # https://github.com/iamcco/markdown-preview.nvim
    # To consider ^

  ];
  my-python-packages = ps:
    with ps; [
      python-lsp-server
      mypy
      pylsp-mypy
      pyls-isort
      python-lsp-black
      pyls-memestra
      python-lsp-ruff
      pylsp-rope
      debugpy
    ];

  extraPackages = with pkgs; [
    (python3.withPackages my-python-packages)
    lua-language-server
    nil
    alejandra
    git
    ripgrep
    fd
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # You can add as many derivations as you like.
}
