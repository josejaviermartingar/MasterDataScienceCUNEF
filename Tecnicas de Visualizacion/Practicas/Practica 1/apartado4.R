#4) en apartado4.R evita el overplotting del anterior ejercicio usando transparencia

ggplot(faithful, aes(x = eruptions, y = waiting)) + 
  geom_point(color = "tomato4", alpha = 0.7) +
  theme_grey()
  