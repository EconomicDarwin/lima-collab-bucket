# PED_Modeling ------------------------------------------------------------

# Clear All
rm(list=ls(all=TRUE))

# Set Path
path_PEDModel <- "C:/Users/micha/Dropbox/BFAMSA/Data/"
setwd(path_PEDModel)

# Libraries
library(readxl)
library(dplyr)
library(lubridate)
library(reshape)
library(reshape2)
library(fitdistrplus)
library(DT)
library(ggplot2)

# Read and Rename Data
df <- read_xlsx("BFAMS-PED_Modeling.xlsx")
nms_PEDModeling <- c("time", "lane", "terminal", "query", "result", "purpose", "admissions", "doc_type")
names(df) <- nms_PEDModeling

#  Classify the Data
df$lane <- as.factor(df$lane)
df$terminal <- as.factor(df$terminal)
df$query <- as.factor(df$query)
df$result <- as.factor(df$result)
df$purpose <- as.factor(df$purpose)
df$admissions <- as.factor(df$admissions)
df$doc_type <- as.factor(df$doc_type)

# Complete Cases
df <- df[complete.cases(df), ]

# Citizenship Type Table
TOTAL <- as.integer(nrow(df))
USC <- nrow(filter(df, df$admissions == "USC"))
LPR <- nrow(filter(df, df$admissions == "LPR"))
NONE <- nrow(filter(df, df$admissions == "NONE/NULL"))
VWP <- nrow(filter(df, df$admissions == "WT"))
VISITOR <- TOTAL - USC - LPR - NONE - VWP

type_cit <- as.vector(c("USC", "VISITOR", "LPR", "VWP", "NONE", "TOTAL"))
number_cit <- as.vector(c(USC, VISITOR, LPR, VWP, NONE, TOTAL))
perc_cit <- as.vector(c(USC/TOTAL, VISITOR/TOTAL, LPR/TOTAL,  VWP/TOTAL, NONE/TOTAL, TOTAL/TOTAL))
df_cit <- data.frame(type_cit, number_cit, perc_cit)
df_cit

# Create DocumentType Column
sapply(df, levels)
for (i in 1:nrow(df))
  {
    if (df$doc_type[i] %in% "?" | df$doc_type[i] %in% "DL" | df$doc_type[i] %in% "FB" | df$doc_type[i] %in% "FD" |
        df$doc_type[i] %in% "N" | df$doc_type[i] %in% "SS") 
    {df[i, "DocumentType"] <- "NonCompliant"}
    else {df[i, "DocumentType"] <- "Compliant"}
}


# Create CitizenType Column
for (i in 1:nrow(df))
  {
    if (df$admissions[i] %in% "USC")
    {df[i, "CitizenType"] <- "USC"}
    else if (df$admissions[i] %in% "LPR")
    {df[i, "CitizenType"] <- "LPR"}
    else if (df$admissions[i] %in% "NONE/NULL")
    {df[i, "CitizenType"] <- "NONE/NULL"}
    else if (df$admissions[i] %in% "WT")
    {df[i, "CitizenType"] <- "VWP"}
    else {df[i, "CitizenType"] <- "VISITOR"}
  }

# Document Type Table
SENTRI <- nrow(filter(df, df$doc_type == "IS" | df$doc_type == "IG"))
COMP <- nrow(filter(df, df$DocumentType == "Compliant"))
NONCOMP <- nrow(filter(df, df$DocumentType == "NonCompliant"))

type_doctype <- as.vector(c("SENTRI", "Compliant", "Non-Compliant", "Total"))
number_doctype <- as.vector(c(SENTRI, COMP, NONCOMP, TOTAL))
perc_doctype <- as.vector(c(SENTRI/TOTAL, COMP/TOTAL, NONCOMP/TOTAL, TOTAL/TOTAL))
df_doctype <- data.frame(type_doctype, number_doctype, perc_doctype)
df_doctype

nrow(filter(df_visitor, df_visitor$doc_type == "IS" | df_visitor$doc_type == "IG"))


2# DateTime Functions
FormatDateTime <- function(DataHere)
  {
    test <- as.numeric(DataHere)
    test <- as.POSIXct(test * (60*60*24)
                       , origin="1899-12-30"
                       , tz="GMT")
  }

CreateDate <- function(DataHere, FormatHere)
  {
    format(as.POSIXct(strptime(DataHere, "%Y-%m-%d %H:%M:%S", tz="")) ,format = FormatHere)
  }


StripDateTime <- function(DataHere)
  {
    year <- CreateDate(DataHere, "%Y")
    month <- CreateDate(DataHere, "%m")
    day <- CreateDate(DataHere, "%d")
    hour <- CreateDate(DataHere, "%H")
    minute <- CreateDate(DataHere, "%M")
    second <- CreateDate(DataHere, "%S")
    data.frame(DataHere, year, month, day, hour, minute, second)
  }


# MESSY - NEED TO FIX FUNCTION TO CLEAN THIS UP ---------------------------

# 
# ArrivalData <- function(DataHere)
#   {
#     day1 <- filter(DataHere, DataHere$day == 16)
#     df_day1 <- data.frame(table(day1$hour))
#     names(df_day1) <- c("day1_hours", "day1_freq")
#     
#     day2 <- filter(DataHere, DataHere$day == 17)
#     df_day2 <- data.frame(table(day2$hour))
#     names(df_day2) <- c("day2_hours", "day2_freq")
#     
#     df_days <- cbind(day1, day2)
#   }

# Hourly Arrival Schedule

df_time <- StripDateTime(df$time)

day1 <- filter(df_time, df_time$day == 16)
df_day1 <- data.frame(1, table(day1$hour))
names(df_day1) <- c("Day", "Hour", "Total")

day2 <- filter(df_time, df_time$day == 17)
df_day2 <- data.frame(2, table(day2$hour))
names(df_day2) <- c("Day", "Hour", "Total")

Total <- rbind(df_day1, df_day2)


FilterDay <- function(arg01, arg02, arg03)
  {
    temp <- filter(arg01, arg02 == arg03)
    temp1 <- data.frame(arg03, table(temp$hour))
    arg03 <- arg03 + 1
    temp2 <- filter(arg01, arg02 == arg03)
    temp3 <- data.frame(arg03, table(temp2$hour))
    temp4 <- rbind(temp1, temp3)
  }

df_total <- FilterDay(df_time, df_time$day, 16)


df_day2 <- FilterDay(df_time, df_time$day, 17)






test <- FilterDay(df_time, 16)

df_usc <- filter(df, df$CitizenType == "USC")
df_time_usc <- StripDateTime(df_usc$time)
#usc_arrival <- ArrivalData(df_time_usc)

day1_usc <- filter(df_time_usc, df_time_usc$day == 16)
df_day1_usc <- data.frame(1, table(day1_usc$hour))
names(df_day1_usc) <- c("Day", "Hour", "USC")

day2_usc <- filter(df_time_usc, df_time_usc$day == 17)
df_day2_usc <- data.frame(2, table(day2_usc$hour))
names(df_day2_usc) <- c("Day", "Hour", "USC")

USC <- rbind(df_day1_usc, df_day2_usc)


df_lpr <- filter(df, df$CitizenType == "LPR")
df_time_lpr <- StripDateTime(df_lpr$time)
#lpr_arrival <- ArrivalData(df_time_lpr)

day1_lpr <- filter(df_time_lpr, df_time_lpr$day == 16)
df_day1_lpr <- data.frame(1, table(day1_lpr$hour))
names(df_day1_lpr) <- c("Day", "Hour", "LPR")

day2_lpr <- filter(df_time_lpr, df_time_lpr$day == 17)
df_day2_lpr <- data.frame(2, table(day2_lpr$hour))
names(df_day2_lpr) <- c("Day", "Hour", "LPR")

LPR <- rbind(df_day1_lpr, df_day2_lpr)


df_none <- filter(df, df$CitizenType == "NONE/NULL")
df_time_none <- StripDateTime(df_none$time)
#none_arrival <- ArrivalData(df_time_none)

day1_none <- filter(df_time_none, df_time_none$day == 16)
df_day1_none <- data.frame(1, table(day1_none$hour))
names(df_day1_none) <- c("Day", "Hour", "None")

day2_none <- filter(df_time_none, df_time_none$day == 17)
df_day2_none <- data.frame(2, table(day2_none$hour))
names(df_day2_none) <- c("Day", "Hour", "None")

NONE_df <- rbind(df_day1_none, df_day2_none)



df_visitor <- filter(df, df$CitizenType == "VISITOR")
df_time_visitor <- StripDateTime(df_visitor$time)
#visitor_arrival <- ArrivalData(df_time_visitor)

day1_visitor <- filter(df_time_visitor, df_time_visitor$day == 16)
df_day1_visitor <- data.frame(1, table(day1_visitor$hour))
names(df_day1_visitor) <- c("Day", "Hour", "Visitor")

day2_visitor <- filter(df_time_visitor, df_time_visitor$day == 17)
df_day2_visitor <- data.frame(2, table(day2_visitor$hour))
names(df_day2_visitor) <- c("Day", "Hour", "Visitor")

Visitor <- rbind(df_day1_visitor, df_day2_visitor)


df_vwp <- filter(df, df$CitizenType == "VWP")
df_time_vwp <- StripDateTime(df_vwp$time)
#vwp_arrival <- ArrivalData(df_time_vwp)

day1_vwp <- filter(df_time_vwp, df_time_vwp$day == 16)
df_day1_vwp <- data.frame(1, table(day1_vwp$hour))
names(df_day1_vwp) <- c("Day", "Hour", "VWP")

day2_vwp <- filter(df_time_vwp, df_time_vwp$day == 17)
df_day2_vwp <- data.frame(2, table(day2_vwp$hour))
names(df_day2_vwp) <- c("Day", "Hour", "VWP")

VWP <- rbind(df_day1_vwp, df_day2_vwp)

Minute <- as.vector(rep(0, nrow(Total)))

ArrivalSchedule <- data.frame(Total$Day, Total$Hour, Minute, Total$Total, USC$USC, LPR$LPR, VWP$VWP, Visitor$Visitor, NONE_df$None)
names(ArrivalSchedule) <- c("Day", "Hour", "Minute","Total", "USC", "LPR", "VWP", "Visitor", "None")

write.csv(ArrivalSchedule, file = "ArrivalSchedule.csv")




# df_day <- data.frame(df_day1$day1_hours, df_day1$day1_freq, df_day2$day2_freq, df_day1$day1_freq - df_day2$day2_freq,
#                      (df_day1$day1_freq - df_day2$day2_freq)/df_day1$day1_freq)
# names(df_day) <- c("Hours", "DAY1", "DAY2", "DIFF", "PERC_DIFF")
# df_day$PERC_DIFF <- round(df_day$PERC_DIFF, digits = 2)
# df_day


# Average Cycle Time
CycleTime <- function(data1)
  {
    TDiff <- aggregate(time~terminal, data=data1, FUN="diff")
    Tdata <-as.vector(unlist(TDiff[,2]))
    Tdata <- Tdata[Tdata < 300]
    Tdata <- Tdata[Tdata > 0]
    Tdata <- Tdata[complete.cases(Tdata)]
  }

TotalCycle <- CycleTime(df)
MeanTotalCycle <- mean(TotalCycle)

USCCycle <- CycleTime(df_usc)
MeanUSCCycle <- mean(USCCycle)

LPRCycle <- CycleTime(df_lpr)
MeanLPRCycle <- mean(LPRCycle)

VWPCycle <- CycleTime(df_vwp)
MeanVWPCycle <- mean(VWPCycle)

VisitorCycle <- CycleTime(df_visitor)
MeanVisitorCyclce <- mean(VisitorCycle)

NoneCycle <- CycleTime(df_none)
MeanNoneCycle <- mean(NoneCycle)

df_compliant <- filter(df, df$DocumentType == "Compliant")
CompliantCycle <- CycleTime(df_compliant)
MeanCompliantCycle <- mean(CompliantCycle)

df_noncomp <- filter(df, df$DocumentType == "NonCompliant")
NonCompliantCycle <- CycleTime(df_noncomp)
MeanNonCompliantCycle <- mean(NonCompliantCycle)

df_sentri <- filter(df, df$doc_type == "IS") # | df$doc_type == "IG")
SentriCycle <- CycleTime(df_sentri)
MeanSentriCycle <- mean(SentriCycle)

MeanCycleTimes <- data.frame(MeanTotalCycle, MeanUSCCycle, MeanLPRCycle, MeanVWPCycle, MeanVisitorCyclce, MeanNoneCycle, MeanCompliantCycle, MeanNonCompliantCycle, MeanSentriCycle)
MeanCycleTimes

