#remotes::install_github("GuangchuangYu/hexSticker")

library(hexSticker)
library(magick)
library(sysfonts)

stripes <- image_read("images/climate_stripes.png")

fonts <- font_files()

font_add("Calibri", "calibriz.ttf")

sticker(
  subplot = stripes,
  package = "Politics of Climate Change",
  s_width = 1.5,
  s_height = 0.75,
  s_x = 1,
  s_y = 0.95,
  h_fill = "#003056",
  h_color = "#DF7E50",
  h_size = 1.75,
  spotlight = TRUE,
  l_y = 1,
  l_x = 1,
  l_width = 3,
  l_height = 3,
  l_alpha = 0.3,
  p_size = 8.5,
  p_color = "#DF7E50",
  p_family = "Calibri",
  filename="images/hex_sticker.png") #%>% 
  #print()

#?sticker