require(ggplot2)
require(ggthemes)

data <- read.csv("../june2018/Perl6\ User\ Survey.csv")
ggplot(data,aes(x=How.would.you.rate.the.Perl.6.documentation.,y=How.would.you.rate.the.friendliness.of.the.Perl.6.community.))+geom_count()+xlab("Documentation")+ylab("Community")+theme_economist()
data$comscore = as.factor(data$How.would.you.rate.the.friendliness.of.the.Perl.6.community.)
ggplot(data,aes(y=How.would.you.rate.the.Perl.6.documentation.,x=comscore))+geom_boxplot()+xlab("Community score")+ylab("Documentation")+theme_economist()
 ggplot(data,aes(y=How.would.you.rate.the.Perl.6.documentation.,x=1))+geom_violin(fill='pink')+ geom_boxplot(notch = TRUE,alpha=0.8) + theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

