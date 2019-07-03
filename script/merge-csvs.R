library( dplyr )

data.1 <- read.csv("../June2018/p6survey.csv")
data.2 <- read.csv("../June2019/p6survey.csv")
data.1$year <- "2018"
data.2$year <- "2019"

common <- intersect(colnames(data.1),colnames(data.2))

data.1.common <- data.1 %>% select( common )
data.2.common <- data.2 %>% select( common )

write.csv( bind_rows ( data.1.common, data.2.common ), "data-2018-2018.csv" )

