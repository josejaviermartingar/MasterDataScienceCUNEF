#5) en apartado5.R evita el overplotting usando jittering

ggplot(faithful, aes(x = eruptions, y = waiting)) + 
  geom_point(position = position_jitter(width = 1.5)) +
  theme_replace()
