# �������� ������ � R
# ��������� �������
install.packages("vroom")
install.packages("readxl")
install.packages("devtools")
devtools::install_github("tidyverse/googlesheets4")

# ###########################################
# ����������� �������
library("vroom")


# ###########################################
# ������ CSV, TSV � ������ ��������� ������

## ������ ��������� ������
ga_data <- vroom(file = "D:/materials/lesson_3/ga_nowember.csv", delim = "/t")
## ������ ������ �������������� � ���������
ga_data_i <- vroom("https://raw.githubusercontent.com/selesnow/publications/master/data_example/russian_text_in_r/ga_nowember.csv")

## ������ ���������� ������ � ���� �������
files   <- dir(pattern = "\\.csv$")
ga_full <- vroom(files) 


# ###########################################
# ������ Excel ������
library(readxl)

## �������� ������ ������ �� Excel �����
excel_sheets("D:/materials/lesson_3/ga_examples.xlsx")

## ������� ������ � �����
xl_dec <- read_excel("D:/materials/lesson_3/ga_examples.xlsx", sheet = "dec")

# ###########################################
# ������ Google ������
library(googlesheets4)

## �����������
sheets_auth(email = "selesnow@gmail.com")
sheets_find()
## ����������� � �����
ss_id <- as_sheets_id("1xu_beKZVpJJTHTvAab_vN3ZiMB03BytKArGjJUO8cck")

## ������� ���� � ��������
sheets_browse(ss)

## ���������� ������ ������
sheets_sheet_names(ss)

## �������� ������ �� �����
gs_ga_data <- sheets_read(ss = ss_id, 
                          sheet = "dec")

## �������� ������ �� ��������� �� �����
gs_ga_data <- sheets_read(ss = ss, 
                          sheet = "dec", 
                          range = "A1:C10")
