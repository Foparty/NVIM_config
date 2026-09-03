-- In-buffer Markdown rendering (headings, lists, code blocks, tables, etc.)
-- Docs: https://github.com/MeanderingProgrammer/render-markdown.nvim
-- Compare your config to defaults anytime with :RenderMarkdown config
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons", -- language icons above code blocks
  },
  config = function()
    ---@type render.md.UserConfig
    local opts = {
      -- Top-level ----------------------------------------------------------------

      -- Whether markdown should be rendered by default.
      enabled = true,

      -- Vim modes that show rendered view for all enabled components.
      -- Remaining modes are unaffected. @see :h mode()
      render_modes = { "n", "c", "t" },

      -- Milliseconds before updating marks (visible window only).
      debounce = 100,

      -- Preconfigured experiences; user settings take precedence.
      -- 'obsidian' | 'lazy' | 'none'
      preset = "none",

      -- Log level written to stdpath('state') .. '/render-markdown.log'
      -- 'error' | 'warn' | 'info' | 'debug' | 'trace'
      log_level = "error",

      -- Print runtime of main update method (plugin development / debugging).
      log_runtime = false,

      -- Filetypes this plugin runs on.
      file_types = { "markdown" },

      -- Maximum file size (MB); larger files are ignored.
      max_file_size = 10.0,

      -- Return true to skip attaching to a buffer.
      ignore = function()
        return false
      end,

      -- Render markdown nested inside markdown code blocks.
      nested = true,

      -- Extra events that trigger the render loop.
      change_events = {},

      -- Restart treesitter highlighter after first attach (useful when lazy-loaded).
      restart_highlighter = false,

      -- Anti-conceal -------------------------------------------------------------
      -- Hide virtual text on the cursor line so you can edit raw syntax.
      anti_conceal = {
        enabled = true,
        -- Modes where anti-conceal is disabled (false = never disabled).
        disabled_modes = false,
        -- Extra lines above/below cursor to show unconcealed.
        above = 0,
        below = 0,
        -- Elements to always show despite anti-conceal.
        -- Keys: bullet, callout, check_icon, check_scope, code_background,
        -- code_border, code_language, dash, head_background, head_border,
        -- head_icon, indent, latex, link, quote, sign, table_border, virtual_lines
        -- Values: boolean or list of modes.
        ignore = {
          code_background = true,
          indent = true,
          sign = true,
          virtual_lines = true,
        },
      },

      -- Padding highlight for added whitespace.
      padding = {
        highlight = "RenderMarkdownPadding",
      },

      -- LaTeX --------------------------------------------------------------------
      latex = {
        enabled = true,
        render_modes = false,
        -- Executables tried in order until one succeeds.
        converter = { "utftex", "latex2text" },
        inline = true,
        block = true,
        highlight = "RenderMarkdownMath",
        -- 'above' | 'below' | 'center'
        position = "center",
        top_pad = 0,
        bottom_pad = 0,
      },

      -- Lifecycle hooks ----------------------------------------------------------
      on = {
        attach = function() end,
        initial = function() end,
        render = function() end,
        clear = function() end,
      },

      -- Completion sources -------------------------------------------------------
      completions = {
        blink = { enabled = false },
        coq = { enabled = false },
        lsp = { enabled = false },
        filter = {
          callout = function()
            return true
          end,
          checkbox = function()
            return true
          end,
        },
      },

      -- Headings -----------------------------------------------------------------
      heading = {
        enabled = true,
        render_modes = false,
        atx = true,
        setext = true,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        -- 'overlay' | 'inline' | 'right' | 'eol'
        position = "overlay",
        signs = { "󰫎 " },
        -- 'full' | 'block' (or list per heading level)
        width = "full",
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        border = false,
        border_virtual = false,
        border_prefix = false,
        above = "▄",
        below = "▀",
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
        custom = {},
      },

      -- Paragraphs ---------------------------------------------------------------
      paragraph = {
        enabled = true,
        render_modes = false,
        left_margin = 0,
        indent = 0,
        min_width = 0,
      },

      -- Code blocks & inline code ------------------------------------------------
      code = {
        enabled = true,
        render_modes = false,
        sign = true,
        conceal_delimiters = true,
        language = true,
        -- 'left' | 'right' | 'center'
        position = "left",
        language_icon = true,
        language_name = true,
        language_info = true,
        language_pad = 0,
        disable = {},
        disable_background = { "diff" },
        background_inset = 1,
        -- 'full' | 'block'
        width = "full",
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        -- 'hide' | 'thin' | 'thick' | 'none'
        border = "hide",
        language_border = "█",
        language_left = "",
        language_right = "",
        above = "▄",
        below = "▀",
        inline = true,
        inline_left = "",
        inline_right = "",
        inline_pad = 0,
        priority = 140,
        highlight = "RenderMarkdownCode",
        highlight_info = "RenderMarkdownCodeInfo",
        highlight_language = nil,
        highlight_border = "RenderMarkdownCodeBorder",
        highlight_fallback = "RenderMarkdownCodeFallback",
        highlight_inline = "RenderMarkdownCodeInline",
        highlight_inline_left = nil,
        highlight_inline_right = nil,
        -- 'full' | 'normal' | 'language' | 'none'
        style = "full",
      },

      -- Horizontal rules ---------------------------------------------------------
      dash = {
        enabled = true,
        render_modes = false,
        icon = "─",
        -- 'full' | number | function
        width = "full",
        left_margin = 0,
        priority = nil,
        highlight = "RenderMarkdownDash",
      },

      -- Document-level conceal patterns ------------------------------------------
      document = {
        enabled = true,
        render_modes = false,
        conceal = {
          char_patterns = {},
          line_patterns = {},
        },
      },

      -- List bullets -------------------------------------------------------------
      bullet = {
        enabled = true,
        render_modes = false,
        icons = { "●", "○", "◆", "◇" },
        ordered_icons = function(ctx)
          local value = vim.trim(ctx.value)
          local index = tonumber(value:sub(1, #value - 1))
          return ("%d."):format(index > 1 and index or ctx.index)
        end,
        left_pad = 0,
        right_pad = 0,
        highlight = "RenderMarkdownBullet",
        scope_highlight = {},
        scope_priority = nil,
      },

      -- Task list checkboxes -----------------------------------------------------
      checkbox = {
        enabled = true,
        render_modes = false,
        bullet = false,
        left_pad = 0,
        right_pad = 1,
        unchecked = {
          icon = "󰄱 ",
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = nil,
        },
        checked = {
          icon = "󰱒 ",
          highlight = "RenderMarkdownChecked",
          scope_highlight = nil,
        },
        custom = {
          todo = {
            raw = "[-]",
            rendered = "󰥔 ",
            highlight = "RenderMarkdownTodo",
            scope_highlight = nil,
          },
        },
        scope_priority = nil,
      },

      -- Block quotes -------------------------------------------------------------
      quote = {
        enabled = true,
        render_modes = false,
        icon = "▋",
        repeat_linebreak = false,
        highlight = {
          "RenderMarkdownQuote1",
          "RenderMarkdownQuote2",
          "RenderMarkdownQuote3",
          "RenderMarkdownQuote4",
          "RenderMarkdownQuote5",
          "RenderMarkdownQuote6",
        },
      },

      -- Render behavior ----------------------------------------------------------
      render = {
        -- Whether to render when window is in diff mode.
        diff = false,
      },

      -- Pipe tables --------------------------------------------------------------
      pipe_table = {
        enabled = true,
        render_modes = false,
        -- 'none' | 'round' | 'double' | 'heavy'
        preset = "none",
        -- 'overlay' | 'raw' | 'padded' | 'trimmed'
        cell = "padded",
        cell_offset = function()
          return 0
        end,
        padding = 1,
        min_width = 0,
        border = {
          "┌",
          "┬",
          "┐",
          "├",
          "┼",
          "┤",
          "└",
          "┴",
          "┘",
          "│",
          "─",
        },
        border_enabled = true,
        border_virtual = false,
        alignment_indicator = "━",
        head = "RenderMarkdownTableHead",
        row = "RenderMarkdownTableRow",
        -- 'full' | 'normal' | 'none'
        style = "full",
      },

      -- Callouts (GitHub + Obsidian) ---------------------------------------------
      callout = {
        note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo", category = "github" },
        tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess", category = "github" },
        important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint", category = "github" },
        warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn", category = "github" },
        caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError", category = "github" },
        abstract = { raw = "[!ABSTRACT]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo", category = "obsidian" },
        summary = { raw = "[!SUMMARY]", rendered = "󰨸 Summary", highlight = "RenderMarkdownInfo", category = "obsidian" },
        tldr = { raw = "[!TLDR]", rendered = "󰨸 Tldr", highlight = "RenderMarkdownInfo", category = "obsidian" },
        info = { raw = "[!INFO]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo", category = "obsidian" },
        todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo", category = "obsidian" },
        hint = { raw = "[!HINT]", rendered = "󰌶 Hint", highlight = "RenderMarkdownSuccess", category = "obsidian" },
        success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess", category = "obsidian" },
        check = { raw = "[!CHECK]", rendered = "󰄬 Check", highlight = "RenderMarkdownSuccess", category = "obsidian" },
        done = { raw = "[!DONE]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess", category = "obsidian" },
        question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn", category = "obsidian" },
        help = { raw = "[!HELP]", rendered = "󰘥 Help", highlight = "RenderMarkdownWarn", category = "obsidian" },
        faq = { raw = "[!FAQ]", rendered = "󰘥 Faq", highlight = "RenderMarkdownWarn", category = "obsidian" },
        attention = { raw = "[!ATTENTION]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn", category = "obsidian" },
        failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError", category = "obsidian" },
        fail = { raw = "[!FAIL]", rendered = "󰅖 Fail", highlight = "RenderMarkdownError", category = "obsidian" },
        missing = { raw = "[!MISSING]", rendered = "󰅖 Missing", highlight = "RenderMarkdownError", category = "obsidian" },
        danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError", category = "obsidian" },
        error = { raw = "[!ERROR]", rendered = "󱐌 Error", highlight = "RenderMarkdownError", category = "obsidian" },
        bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError", category = "obsidian" },
        example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint", category = "obsidian" },
        quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote", category = "obsidian" },
        cite = { raw = "[!CITE]", rendered = "󱆨 Cite", highlight = "RenderMarkdownQuote", category = "obsidian" },
      },

      -- Links --------------------------------------------------------------------
      link = {
        enabled = true,
        render_modes = false,
        footnote = {
          enabled = true,
          icon = "󰯔 ",
          body = function(ctx)
            return ctx.text
          end,
          superscript = true,
          prefix = "",
          suffix = "",
        },
        image = "󰥶 ",
        image_custom = true,
        email = "󰀓 ",
        hyperlink = "󰌹 ",
        highlight = "RenderMarkdownLink",
        highlight_title = "RenderMarkdownLinkTitle",
        wiki = {
          enabled = true,
          icon = "󱗖 ",
          conceal_destination = true,
          body = function()
            return nil
          end,
          highlight = "RenderMarkdownWikiLink",
          scope_highlight = nil,
        },
        -- kind: 'pattern' (default) | 'suffix' | 'url'
        custom = {
          web = { icon = "󰖟 ", pattern = "^http" },
          apple = { icon = " ", pattern = "apple%.com", kind = "url" },
          discord = { icon = "󰙯 ", pattern = "discord%.com", kind = "url" },
          github = { icon = "󰊤 ", pattern = "github%.com", kind = "url" },
          gitlab = { icon = "󰮠 ", pattern = "gitlab%.com", kind = "url" },
          google = { icon = "󰊭 ", pattern = "google%.com", kind = "url" },
          hackernews = { icon = " ", pattern = "ycombinator%.com", kind = "url" },
          linkedin = { icon = "󰌻 ", pattern = "linkedin%.com", kind = "url" },
          microsoft = { icon = " ", pattern = "microsoft%.com", kind = "url" },
          neovim = { icon = " ", pattern = "neovim%.io", kind = "url" },
          reddit = { icon = "󰑍 ", pattern = "reddit%.com", kind = "url" },
          slack = { icon = "󰒱 ", pattern = "slack%.com", kind = "url" },
          stackoverflow = { icon = "󰓌 ", pattern = "stackoverflow%.com", kind = "url" },
          steam = { icon = " ", pattern = "steampowered%.com", kind = "url" },
          twitter = { icon = " ", pattern = "twitter%.com", kind = "url" },
          wikipedia = { icon = "󰖬 ", pattern = "wikipedia%.org", kind = "url" },
          x = { icon = " ", pattern = "x%.com", kind = "url" },
          youtube = { icon = "󰗃 ", pattern = "youtube[^.]*%.com", kind = "url" },
          youtube_short = { icon = "󰗃 ", pattern = "youtu%.be", kind = "url" },
        },
      },

      -- Sign column --------------------------------------------------------------
      sign = {
        enabled = true,
        priority = nil,
        highlight = "RenderMarkdownSign",
      },

      -- Obsidian-style ==highlights== --------------------------------------------
      inline_highlight = {
        enabled = true,
        render_modes = false,
        highlight = "RenderMarkdownInlineHighlight",
        custom = {},
      },

      -- Org-indent-style heading indentation -------------------------------------
      indent = {
        enabled = false,
        render_modes = false,
        per_level = 2,
        skip_level = 1,
        skip_heading = false,
        icon = "▎",
        priority = 0,
        highlight = "RenderMarkdownIndent",
      },

      -- HTML ---------------------------------------------------------------------
      html = {
        enabled = true,
        render_modes = false,
        comment = {
          conceal = true,
          text = nil,
          highlight = "RenderMarkdownHtmlComment",
        },
        tag = {},
      },

      -- YAML frontmatter ---------------------------------------------------------
      yaml = {
        enabled = true,
        render_modes = false,
      },

      -- Window options toggled between raw and rendered view -----------------------
      win_options = {
        conceallevel = {
          default = vim.o.conceallevel,
          rendered = 3,
        },
        concealcursor = {
          default = vim.o.concealcursor,
          rendered = "",
        },
      },

      -- Treesitter language injections (markdown inside other filetypes) ---------
      injections = {
        gitcommit = {
          enabled = true,
          query = [[
            ((message) @injection.content
                (#set! injection.combined)
                (#set! injection.include-children)
                (#set! injection.language "markdown"))
          ]],
        },
      },

      -- Disable conflicting treesitter highlight directives ----------------------
      patterns = {
        markdown = {
          disable = true,
          directives = {
            { id = 17, name = "conceal_lines" },
            { id = 18, name = "conceal_lines" },
          },
        },
      },

      -- Per-buffer / per-filetype overrides --------------------------------------
      overrides = {
        buflisted = {},
        buftype = {
          nofile = {
            render_modes = true,
            sign = { enabled = false },
          },
        },
        filetype = {},
        preview = {
          render_modes = true,
        },
      },

      -- Custom treesitter handlers (see doc/custom-handlers.md) ------------------
      custom_handlers = {},
    }

    require("render-markdown").setup(opts)

    vim.keymap.set("n", "<leader>mt", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle Markdown render" })
    vim.keymap.set("n", "<leader>mP", "<cmd>RenderMarkdown preview<CR>", { desc = "Markdown render preview" })
    vim.keymap.set("n", "<leader>me", "<cmd>RenderMarkdown expand<CR>", { desc = "Expand anti-conceal margin" })
    vim.keymap.set("n", "<leader>mc", "<cmd>RenderMarkdown contract<CR>", { desc = "Contract anti-conceal margin" })
  end,
}
