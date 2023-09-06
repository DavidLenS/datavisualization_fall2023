#remotes::install_github("GuangchuangYu/hexSticker")

library(hexSticker)
library(magick)
library(sysfonts)
library(gapminder)
library(tidyverse)

gapminder_cleaned <- gapminder %>% 
  filter(year == "2007") %>% 
  mutate(
    pop2 = pop + 1,
    continent = case_when(
      continent == "Oceania" ~ "Asia",
      TRUE ~ as.character(continent)
    ) %>% as.factor %>% 
      fct_relevel("Asia", "Americas", "Europe", "Africa")
  ) 

plot <- ggplot(data = gapminder_cleaned, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(size = pop, color = continent)) +
  geom_point(aes(size = pop2), color = "black", shape = 21) +
  scale_x_log10(breaks = c(500, 1000, 2000, 4000,
                           8000, 16000, 32000, 64000)) +
  scale_y_continuous(breaks = seq(0, 90, by = 10)) +
  scale_color_manual(values = c("#F15772", "#7EEB03",
                                "#FBE700", "#54D5E9"))  +
  #scale_size_continuous(range = c(1, 30)) +
  guides(size = FALSE, color = FALSE) +
   labs(
     x = "",
     y = ""
   ) +
  theme_minimal()

#stripes <- image_read("images/climate_stripes.png")

p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
p <- p + theme_void() + theme_transparent()

sticker(p, package="hexSticker", 
        p_size=20, s_x=1, s_y=.75, s_width=1.3, s_height=1,
        filename="images/hex_sticker.png") %>% 
  print()

fonts <- font_files()

font_add("Calibri", "calibriz.ttf")

sticker(
  subplot = plot,
  package = "Data Visualization",
  s_width = 1.5,
  s_height = 0.75,
  s_x = 1,
  s_y = 0.95,
  h_fill = "#8399b0",
  h_color = "black",
  h_size = 1.75,
  spotlight = F,
  l_y = 1,
  l_x = 1,
  l_width = 3,
  l_height = 3,
  l_alpha = 0.3,
  p_size = 8.5,
  p_color = "black",
  p_family = "Calibri",
  filename="images/hex_sticker.png") %>% 
  print()

#?sticker