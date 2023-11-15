library(gapminder)
library(tidyverse)
library(gganimate)

animation_gapminder <- ggplot(gapminder, aes(x = gdpPercap, 
                      y=lifeExp, 
                      colour = continent), size = pop) +
  geom_point(alpha = 0.5) +
  #scale_color_viridis_d(option = "A") +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy", caption = "Source: Gapminder. Animation created using the gganimate package") +
  theme_minimal() +
  transition_time(year) +
  labs(title = "Year: {frame_time}") +
  theme(legend.position = "none")

anim_save("animation_gapminder.gif")

animation_gapminder_facet <- 
  
  ggplot(gapminder, aes(x = gdpPercap, 
                        y=lifeExp,
                        size = pop)) +
  geom_point(alpha = 0.3) +
  #scale_color_viridis_d(option = "A") +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy", caption = "Source: Gapminder. Animation created using the gganimate package") +
  theme_minimal() +
  theme(legend.position = "none") +
  facet_wrap(~continent) +
  transition_time(year) +
  labs(title = "Year: {frame_time}")

anim_save("animation_gapminder_facet.gif")