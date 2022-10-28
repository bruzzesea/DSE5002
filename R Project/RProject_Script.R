getwd()

data <- read.csv("R Project\\data.csv")


library(ggplot2)
head(data)
str(data)

##factorize variables that need factorization
data$job_title <- factor(data$job_title)
data$employment_type <- factor(data$employment_type)
data$employee_residence <- factor(data$employee_residence)
data$company_location <- factor(data$company_location)
data$company_size <- factor(data$company_size)
data$experience_level <- factor(data$experience_level)
data$remote_ratio <- factor(data$remote_ratio)


##need to get all salaries in 2022 purchasing power
##need to establish salary rnages for job titles




##altering 2020 data to increase salary to 2021 inflation. 4.7% inflation from 20 to 21
data[data$work_year == 2020, "salary_in_usd"] <- data[data$work_year == 2020, "salary_in_usd"] * 1.047
##now have 2020 data as 2021, need to change column name to 2021
data[data$work_year == 2020, "work_year"] <- 2021
##now all 2020 data is in 2021. Now need to update 2021 data to 2022 salaries. 8.2% inflation from 21 to 22
data[data$work_year == 2021, "salary_in_usd"] <- data[data$work_year == 2021, "salary_in_usd"] * 1.082
##now have 2021 data as 2022, need to change column name to 2022
data[data$work_year == 2021, "work_year"] <- 2022



##at this point, all salaries are adjusted to 2022 through September because of inflation
##would like to now group job titles into different buckets, based on similar averages, so we can 
##bucket them into groups. Too many job titles currently in file to make sense of anything.
head(data)

mean(data$salary_in_usd[data$job_title == "Data Scientist"])
mean(data$salary_in_usd)


data[data$salary_in_usd == 649200,]

plot <- ggplot(data=data, aes(x=experience_level, y=salary, color = company_size))
plot+geom_line()


library(dplyr);
rownames(data)
head(data)

