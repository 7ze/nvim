---|| @configs/icons.lua ||---

local colors = {
  blue = "#00BFFF",
  cyan = "#00FFFF",
  baby_pink = "#FF1493",
  dark_purple = "#00008B",
  red = "#FF0000",
  orange = "#FFA500",
  white = "#ffffff",
  sun = "#FFD700",
  teal = "#008080",
  vibrant_green = "#008000"
}

require'nvim-web-devicons'.setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "zsh"
  },
  c = {
    icon = "",
    color = colors.blue,
    name = "c",
   },
  css = {
     icon = "",
     color = colors.blue,
     name = "css",
  },
  deb = {
     icon = "",
     color = colors.cyan,
     name = "deb",
  },
  Dockerfile = {
     icon = "",
     color = colors.cyan,
     name = "Dockerfile",
  },
  html = {
     icon = "",
     color = colors.baby_pink,
     name = "html",
  },
  jpeg = {
     icon = "",
     color = colors.dark_purple,
     name = "jpeg",
  },
  jpg = {
     icon = "",
     color = colors.dark_purple,
     name = "jpg",
  },
  js = {
     icon = "",
     color = colors.sun,
     name = "js",
  },
  kt = {
     icon = "󱈙",
     color = colors.orange,
     name = "kt",
  },
  lock = {
     icon = "",
     color = colors.red,
     name = "lock",
  },
  lua = {
     icon = "",
     color = colors.blue,
     name = "lua",
  },
  mp3 = {
     icon = "",
     color = colors.white,
     name = "mp3",
  },
  mp4 = {
     icon = "",
     color = colors.white,
     name = "mp4",
  },
  out = {
     icon = "",
     color = colors.white,
     name = "out",
  },
  png = {
     icon = "",
     color = colors.dark_purple,
     name = "png",
  },
  py = {
     icon = "",
     color = colors.cyan,
     name = "py",
  },
  ["robots.txt"] = {
     icon = "ﮧ",
     color = colors.red,
     name = "robots",
  },
  toml = {
     icon = "",
     color = colors.blue,
     name = "toml",
  },
  ts = {
     icon = "ﯤ",
     color = colors.teal,
     name = "ts",
  },
  ttf = {
     icon = "",
     color = colors.white,
     name = "TrueTypeFont",
  },
  rb = {
     icon = "",
     color = colors.pink,
     name = "rb",
  },
  rpm = {
     icon = "",
     color = colors.orange,
     name = "rpm",
  },
  vue = {
     icon = "﵂",
     color = colors.vibrant_green,
     name = "vue",
  },
  woff = {
     icon = "",
     color = colors.white,
     name = "WebOpenFontFormat",
  },
  woff2 = {
     icon = "",
     color = colors.white,
     name = "WebOpenFontFormat2",
  },
  xz = {
     icon = "",
     color = colors.sun,
     name = "xz",
  },
  zip = {
     icon = "",
     color = colors.sun,
     name = "zip",
  },
 };
 default = true;
}
