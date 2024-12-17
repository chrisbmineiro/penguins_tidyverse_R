library(tidyverse)
library(readr)

path_file <- "./penguins_size.csv"

penguins <- read_csv(path_file);

glimpse(penguins)

head(penguins)

summary(penguins)

names(penguins)

penguins %>% dplyr::filter(island == "Torgersen") %>% head()
  
penguins %>% dplyr::arrange(culmen_length_mm) %>% head()  

penguins %>% dplyr::arrange(species)

set.seed(406)

penguins_subset <- penguins %>%
  sample_n(12)  # another dplyr function!

penguins_subset

penguins_subset %>% arrange(species)

penguins_subset %>% arrange(desc(culmen_length_mm))

penguins_subset %>% arrange(desc(species))

penguins_subset %>% filter(culmen_depth_mm > 16.2)

penguins_subset %>% filter(island == "Dream")

penguins_subset %>% filter(between(culmen_depth_mm, 16.2, 18.1 ))

# select all species, flipper_length_mm, and sex columns
penguins_subset %>% select(species, flipper_length_mm, sex)

# select all character data
penguins_subset %>% select(where(is.character))

# select all numeric data
penguins_subset %>% select(where(is.numeric))

# select all not numeric data
penguins_subset %>% select(!where(is.numeric))

penguins_subset %>% mutate(body_weight_pounds = body_mass_g / 453.59237)

penguins_subset %>% mutate(body_weight_pounds = body_mass_g / 453.59237) %>% select(species, body_mass_g, body_weight_pounds, everything())

# summarising the average body mass of penguins, in grams
penguins_subset %>% summarise(avg_body_mass = mean(body_mass_g))

# treat and remove all NA values
penguins %>% summarise(avg_body_mass = mean(body_mass_g, na.rm = TRUE))

penguins %>% group_by(species) %>% summarise(avg_species_body_mass = mean(body_mass_g, na.rm = TRUE))

penguins %>% group_by(species, island) %>% summarise(avg_species_body_mass = mean(body_mass_g, na.rm = TRUE))

# graph comparison body mass vs. flipper length
ggplot(data=penguins_subset, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point(aes(color=species, shape=species)) + facet_wrap(~species) + labs(title = "Palmer Penguins: Boddy Mass vs. Flipper Length")

ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point(aes(color=species, shape=species)) + facet_wrap(~species) + labs(title = "Palmer Penguins: Boddy Mass vs. Flipper Length")