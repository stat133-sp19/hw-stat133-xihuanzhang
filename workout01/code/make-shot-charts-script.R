######################
##title: make shots charts
##description: analyze shots data of NBA
##inputs: data of Andre, Draymond, Kevin, Klay, Stephen
##outputs: several charts
######################

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)



pdf(file = "../images/andre-iguodala-shot-chart.pdf")
ggplot(data = andre)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color =  shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Andre Iguodala")+ theme_minimal()
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf")
ggplot(data = draymond)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color =  shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Draymond Green")+ theme_minimal()
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf")
ggplot(data = andre)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color =  shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Kevin Durant")+ theme_minimal()
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf")
ggplot(data = andre)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color =  shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Klay Thompson")+ theme_minimal()
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf")
ggplot(data = andre)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color =  shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Stephen Curry")+ theme_minimal()
dev.off()

pdf(file = "../images/gsw-shot-chart.pdf", width = 8, height = 7, title = "Shot Charts")
ggplot(data = total)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color =  shot_made_flag))+
  ylim(-50,420)+
   theme_minimal()+
  facet_wrap(.~ name)
dev.off()

png(filename = "../images/gsw-shot-chart.png", width = 8, height = 7, units = "in", res = 1200)
ggplot(data = total)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color =  shot_made_flag))+
  ylim(-50,420)+
  theme_minimal()+
  facet_wrap(.~ name)
dev.off()

