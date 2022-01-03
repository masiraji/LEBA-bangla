library(tidyverse)
data <- readxl::read_excel("Rawdata/test-retest_raw.xlsx")


data <- data %>% 
  rowwise() %>% 
  mutate(F1_Test = sum(LEBA01, LEBA02, LEBA03))

data <- data %>% 
  rowwise() %>% 
  mutate(F2_Test = sum(LEBA04, LEBA05, LEBA06, LEBA07, LEBA08, LEBA09))

data <- data %>% 
  rowwise() %>% 
  mutate(F3_Test = sum(LEBA10, LEBA10, LEBA11,LEBA12, LEBA13,LEBA14))

data <- data %>% 
  rowwise() %>% 
  mutate(F4_Test = sum(LEBA15, LEBA16, LEBA17,LEBA18))


data <- data %>% 
  rowwise() %>% 
  mutate(F5_Test = sum(LEBA19, LEBA20, LEBA21,LEBA22, LEBA23))




data <- data %>% 
  rowwise() %>% 
  mutate(F1_Retest = sum(Retest_LEBA01, Retest_LEBA02, Retest_LEBA03))

data <- data %>% 
  rowwise() %>% 
  mutate(F2_Retest = sum(Retest_LEBA04, Retest_LEBA05, Retest_LEBA06, Retest_LEBA07, Retest_LEBA08, Retest_LEBA09))

data <- data %>% 
  rowwise() %>% 
  mutate(F3_Retest = sum(Retest_LEBA10, Retest_LEBA10, Retest_LEBA11,Retest_LEBA12, Retest_LEBA13,Retest_LEBA14))

data <- data %>% 
  rowwise() %>% 
  mutate(F4_Retest = sum(Retest_LEBA15, Retest_LEBA16, Retest_LEBA17,Retest_LEBA18))


data <- data %>% 
  rowwise() %>% 
  mutate(F5_Retest = sum(Retest_LEBA19, Retest_LEBA20, Retest_LEBA21,Retest_LEBA22, Retest_LEBA23))

write_rds(data,"Processeddata/ICC_data")

F1.icc <- as.data.frame(cbind(data$F1_Test, data$F1_Retest))
F2.icc <- as.data.frame(cbind(data$F2_Test, data$F2_Retest))
F3.icc <- as.data.frame(cbind(data$F3_Test, data$F3_Retest))
F4.icc <- as.data.frame(cbind(data$F4_Test, data$F4_Retest))
F5.icc <- as.data.frame(cbind(data$F5_Test, data$F5_Retest))



psych::ICC(F1.icc)
psych::ICC(F2.icc)
psych::ICC(F3.icc)
psych::ICC(F4.icc)
psych::ICC(F5.icc)



