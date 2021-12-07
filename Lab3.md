```r
> library(rvest)
> x <- read_html("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature")

> rank_data_html <- html_nodes(x, '.text-primary')
> rank_data <- html_text(rank_data_html)
> rank_data <- as.numeric(rank_data)

> title_data_html <- html_nodes(x, '.lister-item-header a')
> title_data <- html_text(title_data_html)

> runtime_data_html <- html_nodes(x, '.text-muted .runtime')
> runtime_data <- html_text(runtime_data_html)
> runtime_data <- gsub("min", "", runtime_data)
> runtime_data <- as.numeric(runtime_data)

> movies <- data.frame(Rank = rank_data, Title = title_data, Runtime = runtime_data, stringsAsFactors = FALSE )
```

1. Виведіть перші 6 назв фільмів дата фрейму.

```r
> head(movies$Title, 6)
[1] "Людина-павук: Повернення додому" "Той, хто біжить по лезу 2049"    "Найвеличніший шоумен"
[4] "Вітряна ріка"                    "Джуманджі: Поклик джунглів"      "Назви мене своїм ім'ям"
```

2. Виведіть всі назви фільмів с тривалістю більше 120 хв.

```r
> movies[movies$Runtime > 120, ]$Title
 [1] "Людина-павук: Повернення додому"          "Той, хто біжить по лезу 2049"
 [3] "Назви мене своїм ім'ям"                   "Диво-жінка"
 [5] "Тор: Раґнарок"                            "Воно"
 [7] "Мати!"                                    "Вбивство священного оленя"
 [9] "Король Артур: Легенда меча"               "Вартові Галактики 2"
[11] "Форма води"                               "Логан: Росомаха"
[13] "Красуня і Чудовисько"                     "Чужий: Заповіт"
[15] "Пірати Карибського моря: Помста Салазара" "Зоряні війни: Епізод 8 - Останні Джедаї"
[17] "Kingsman: Золоте кільце"                  "Трансформери: Останній лицар"
[19] "Вороги"                                   "Примарна нитка"
[21] "Джон Вік 2"                               "Метелик"
[23] "Валеріан і місто тисячі планет"           "Гра Моллі"
[25] "Темні часи"                               "Saban's Могутні рейнджери"
[27] "Усі гроші світу"                          "Сім сестер"
[29] "Постріл в безодню"                        "Форсаж 8"
[31] "1+1: Нова історія"                        "Війна за планету мавп"
[33] "The Shack"                                "Ферма Мадбаунд"
```

3. Скільки фільмів мають тривалість менше 100 хв.

```r
> length(movies[movies$Runtime < 100, ]$Title)
[1] 14
```
