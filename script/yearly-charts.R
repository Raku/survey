require(ggplot2)
require(ggthemes)
require(dplyr)

data <- read.csv("../processed-data/data-2018-2020.csv")

age.year <- data %>%  count( What.age.group.do.you.fall.into., year )

ggplot(age.year, aes(year,n,fill=What.age.group.do.you.fall.into.))+ geom_bar( stat='identity',position='stack')
ggsave("../illos/age-groups-years.png",width=8,height=6)

use.perl <- data %>%  count( Have.you.used.Perl.extensively.before.finding.out.about.Raku., year )

ggplot(use.perl, aes(year,n,fill=Have.you.used.Perl.extensively.before.finding.out.about.Raku.))+ geom_bar( stat='identity',position='stack')+theme_tufte()
ggsave("../illos/use-perl-years.png",width=8,height=6)

data$year <- as.factor(data$year)
ggplot(data, aes(x=year,y=How.would.you.rate.the.Raku.documentation.,group=year))+ geom_boxplot()+stat_summary(fun=mean, geom="point", shape=20, size=12, color="red", fill="red")+theme_tufte()
ggsave("../illos/raku-doc-score-years.png",width=8,height=6)
