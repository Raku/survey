require(ggplot2)
require(ggthemes)

data <- read.csv("../june2018/Perl6\ User\ Survey.csv")
gplot(data,aes(x=How.would.you.rate.the.Perl.6.documentation.,y=How.would.you.rate.the.friendliness.of.the.Perl.6.community.))+geom_count()+xlab("Documentation")+ylab("Community")+theme_economist()
