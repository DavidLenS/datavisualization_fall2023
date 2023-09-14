# Data Visualization for Comparative Politics | Week 02

# Version 1 (14.09.23)

# Set Up -----------------------------------------------------------------------

## Install necessary packages --------------------------------------------------
install.packages("") # package name in "". E.g. install.packages("tidyverse")

# Packages only need to be installed once.

## Load packages ---------------------------------------------------------------
library() # This loads the package. E.g. library(tidyverse)

# You have to load all necessary packages for your code every time you start R Studo.

## All in one ------------------------------------------------------------------
pacman::p_load(    # List all packages needed
  "ggplot2",
  "tidyverse",
  "grImport2",
  "grid",
  "ggimage",
  "gapminder")

# pacman allows us to load all necessary packages and installs them if not already installed.

# Input data -------------------------------------------------------------------
x <- 7
y <- x + 7
z <- x - z

## Example: TV-Triell last German federal elections ----------------------------
count <- c(4,1,1,7)
candidate <- c("Scholz", "Baerbock", "Laschet", "kein Unterschied")

## Bind as a data frame --------------------------------------------------------
survey <- as.data.frame(cbind(candidate, count))

# First plots ------------------------------------------------------------------
# Create barplot (1): Frequency
ggplot(data = survey, mapping = aes(x = candidate, 
                                    y = count)) +
  geom_bar(stat="identity")

# Manipulate data frame: Divide count by sum of count --------------------------
survey <- survey %>%
  mutate(pct = as.numeric(count) / 13) %>%
  mutate(pct_absolute = pct * 100)

# Create barplot (2): Relative frequency ---------------------------------------
ggplot(survey, aes(candidate, pct)) +
  geom_bar(stat="identity")

# Add values: Ordering for candidates ------------------------------------------
level_order <- c("Laschet", "Scholz", "Baerbock", "kein Unterschied")

# Create barplot (3a): Relative frequency, specifically ordered ----------------
ggplot(survey, aes(x = factor(candidate, level = level_order), y = pct)) +
  geom_bar(stat="identity")

# Create barplot (4): Relative frequency, specifically ordered, colour ---------
ggplot(survey, aes(x = factor(candidate, level = level_order), y = pct)) +
  geom_bar(stat="identity", aes(fill=as.factor(candidate)))

# Add values: Ordering for candidates ------------------------------------------
colour <- c("black", "red", "green", "blue")

# Create barplot (5): Relative frequency, specifically ordered, specific colour
ggplot(survey, aes(x = factor(candidate, level = level_order), y = pct)) +
  geom_bar(stat="identity", aes(fill = factor(candidate, level = level_order))) +
  scale_fill_manual(values = c("black", "red", "green", "blue"))

# Create barplot (6): Relative frequency, specifically ordered, specific colour, theme
ggplot(survey, aes(x = factor(candidate, level = level_order), y = pct)) +
  geom_bar(stat="identity", aes(fill = factor(candidate, level = level_order))) +
  scale_fill_manual(values = c("black", "red", "green", "blue")) +
  theme_void()

# Create barplot (7): Relative frequency, specifically ordered, specific colour, theme
ggplot(survey, aes(x = factor(candidate, level = level_order), y = pct)) +
  geom_bar(stat="identity", aes(fill = factor(candidate, level = level_order))) +
  scale_fill_manual(values = c("black", "red", "green", "blue")) +
  theme_classic()

# Create barplot (8): Relative frequency, specifically ordered, specific colour, theme, no legend
ggplot(survey, aes(x = factor(candidate, level = level_order), y = pct)) +
  geom_bar(stat="identity", aes(fill = factor(candidate, level = level_order))) +
  scale_fill_manual(values = c("black", "red", "green", "blue")) +
  theme_classic() +
  theme(legend.position="none")

# Create barplot (9): Relative frequency, specifically ordered, specific colour, theme, no legend, add percentages
ggplot(survey, aes(x = factor(candidate, level = level_order), y = pct)) +
  geom_bar(stat="identity", aes(fill = factor(candidate, level = level_order))) +
  scale_fill_manual(values = c("black", "red", "green", "blue")) +
  theme_classic() +
  theme(legend.position="none") +
  geom_text(aes(label=round(pct, digits = 2)), vjust=-0.5, size=3.5) 


# Create barplot (10): ZDF Graph: https://www.zdf.de/politik/wahlen/bundestagswahl-2021-triell-100.html?slide=Ergebnis-TRIE2021
ggplot(survey, aes(x = factor(candidate, level = level_order), y = pct)) +
  geom_bar(stat="identity", aes(fill = factor(candidate, level = level_order))) +
  scale_fill_manual(values = c("black", "red", "green", "blue")) +
  theme_void() +
  theme(legend.position="none") +
  annotate(xmin = c(0.55,1.55,2.55,3.55), xmax = c(1.45,2.45,3.45,4.45),
           ymin = c(-0.07,-0.07,-0.07,-0.07), ymax = c(-0.01,-0.01,-0.01,-0.01),
           geom = "rect", fill = "#0A4C7A") +
  annotate("label", x = c(1,2,3,4), y = c(-0.04, -0.04, -0.04, -0.04), 
           label = c("XX%","XX%","XX%","XX%"),
           color = "white", fontface = "bold", fill="#0A4C7A", size=4, label.size = NA, alpha = 0.4) +
  annotate("text", x = c(1,2,3,4), y = c(-0.12, -0.12, -0.12, -0.12), 
           label = c("Armin\n Laschet", "Olaf\n Scholz", "Annalena\n Baerbock", "Kein\n Unterschied"), 
           color = "white", fontface = "bold", size = 3) +
  annotate("text", x = c(3.8), y = c(-0.22), 
           label = c("Quelle: Forschungsgruppe Wahlen"), 
           color = "white", fontface = "bold", size = 3) +
  theme(panel.background = element_rect(fill="#135584"), plot.margin=unit(c(1,1.5,0.5,1.5),"cm"),
        plot.background = element_rect(fill="#135584"), panel.border = element_rect(colour = "#135584", fill=NA, size=2)) +
  labs(title = "Wer hat sich beim TV-Triell am besten \ngeschlagen?") +
  theme(plot.title = element_text(colour = "white", size=17, face = "bold")) +
  annotate("segment", x = 0.4, xend = 1.1, y =0.5, yend = 0.5, colour = "orange", size=1.5) 

# Export graph as png ----------------------------------------------------------
ggsave("survey.png")

# gapminder --------------------------------------------------------------------
gapminder <- gapminder

## We can filter our dataset, e.g. only European countries ---------------------
gapminder_europe <- gapminder %>% 
  filter(continent == "Europe")

## The same is possible for years ----------------------------------------------
gapminder_europe_2007 <- gapminder_europe %>% 
  filter(year == 2007)

# Besides geom_bar, there is also geom_point and much more. Just try it!

## If you need inspiration, have a look here: https://r-graph-gallery.com/

ggplot(data = INSERT HERE,
       mapping = aes(x = INSERT HERE, y = INSERT HERE)) +
  geom_point()