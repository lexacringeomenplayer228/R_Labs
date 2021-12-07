1. За допомогою download.file() завантажте любий excel файл з порталу http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому встановить mode = “wb”). Виведіть перші 6 строк отриманого фрейму даних.

```r
> library(readxl)
> Sys.setlocale(locale = "ukrainian")
> download.file("https://data.gov.ua/dataset/9338e3fb-41a1-486d-a9b1-c49a0a4f7e4a/resource/2049f091-1940-4867-a213-4aa286bb4178/download/spisok-suddiv-06-12-2021.xlsx", "spisok-suddiv-06-12-2021.xlsx", mode = "wb")
> judges <- read_xlsx("spisok-suddiv-06-12-2021.xlsx")
> head(judges,6)
# A tibble: 6 x 3
  `СПИСОК СУДДІВ СТАНОМ НА 06.12.2021` ...2                             ...3
  <chr>                                <chr>                            <chr>
1 № з/п                                Прізвище, ім`я, по батькові      Найменування суду, до якого особу призначено
2 1                                    Аббасова Наталія Володимирівна   Шевченківський районний суд міста Києва
3 2                                    Абдукадирова Каріне Ескендерівна Донецький окружний адміністративний суд
4 3                                    Аблов Євгеній Валерійович        Окружний адміністративний суд міста Києва
5 4                                    Аблова Юлія Юріївна              Комінтернівський районний суд Одеської області
6 5                                    Абрамов Петро Станіславович      Полтавський апеляційний суд
>
```

2. Завантажте файл за посиланням https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv. Необхідно знайти, скільки property мають value $1000000+

```r
> download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "dataset.csv")
> dataset <- read.csv("dataset.csv")
> x <- lapply(dataset$VAL, function(x) if (!is.na(x) && x==24) TRUE else NA)
> length(x[!is.na(x)])
[1] 53
```

3. Зчитайте xml файл за посиланням http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml Скільки ресторанів мають zipcode 21231?

```r
> library(XML)
> doc <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal=TRUE)
> length(xpathApply(xmlRoot(doc), '//row/row/zipcode[text()="21231"]'))
[1] 127
```
