```r
> library(DBI)
> library(RSQLite)
> connection <- dbConnect(RSQLite::SQLite(), "database.sqlite")
```

1. Назва статті (Title), тип виступу (EventType). Необхідно вибрати тільки статті с типом виступу Spotlight. Сортування по назві статті.

```r
> res_1 <- dbSendQuery(connection, "SELECT Title FROM Papers WHERE EventType = 'Spotlight' ORDER BY Title")
> df_1 <- dbFetch(res_1, n=10)
> df_1
                                                                                          Title
1  A Tractable Approximation to Optimal Point Process Filtering: Application to Neural Encoding
2                                    Accelerated Mirror Descent in Continuous and Discrete Time
3                        Action-Conditional Video Prediction using Deep Networks in Atari Games
4                                                                      Adaptive Online Learning
5                          Asynchronous Parallel Stochastic Gradient for Nonconvex Optimization
6                                                 Attention-Based Models for Speech Recognition
7                                                       Automatic Variational Inference in Stan
8                                   Backpropagation for Energy-Efficient Neuromorphic Computing
9                       Bandit Smooth Convex Optimization: Improving the Bias-Variance Tradeoff
10                         Biologically Inspired Dynamic Textures for Probing Motion Perception
```

2. Ім’я автора (Name), Назва статті (Title). Необхідно вивести всі назви статей для автора «Josh Tenenbaum». Сортування по назві статті.

```r
> res_2 <- dbSendQuery(connection, "SELECT Papers.Title, Authors.Name FROM Papers INNER JOIN PaperAuthors ON Papers.Id = PaperAuthors.PaperId INNER JOIN Authors ON Authors.Id = PaperAuthors.AuthorId WHERE Name = 'Josh Tenenbaum' ORDER BY Papers.Title")
> df_2 <- dbFetch(res_2, n=10)
> df_2
                                                                                              Title           Name
1                                                       Deep Convolutional Inverse Graphics Network Josh Tenenbaum
2 Galileo: Perceiving Physical Object Properties by Integrating a Physics Engine with Deep Learning Josh Tenenbaum
3                                                Softstar: Heuristic-Guided Probabilistic Inference Josh Tenenbaum
4                                                        Unsupervised Learning by Program Synthesis Josh Tenenbaum
```

3. Вибрати всі назви статей (Title), в яких є слово «statistical». Сортування по назві статті.

```r
> df_3 <- dbFetch(res_3, n=10)
> df_3
                                                                                 Title
1 Adaptive Primal-Dual Splitting Methods for Statistical Learning and Image Processing
2                                Evaluating the statistical significance of biclusters
3                  Fast Randomized Kernel Ridge Regression with Statistical Guarantees
4     High Dimensional EM Algorithm: Statistical Optimization and Asymptotic Normality
5                Non-convex Statistical Optimization for Sparse Tensor Graphical Model
6            Regularized EM Algorithms: A Unified Framework and Statistical Guarantees
7                            Statistical Model Criticism using Kernel Two Sample Tests
8                         Statistical Topological Data Analysis - A Kernel Perspective
```

4. Ім’я автору (Name), кількість статей по кожному автору (NumPapers). Сортування по кількості статей від більшої кількості до меньшої.

```r
> res_4 <- dbSendQuery(conn, "SELECT Authors.Name, COUNT(PaperAuthors.PaperId) AS NumPapers FROM PaperAuthors INNER JOIN Authors ON Authors.Id = PaperAuthors.AuthorId GROUP BY Authors.Name ORDER BY NumPapers DESC")
> df_4 <- dbFetch(res_4, n=10)
> df_4
                   Name NumPapers
1  Pradeep K. Ravikumar         7
2        Lawrence Carin         6
3               Han Liu         6
4     Zoubin Ghahramani         5
5               Le Song         5
6   Inderjit S. Dhillon         5
7          Zhaoran Wang         4
8         Yoshua Bengio         4
9  Simon Lacoste-Julien         4
10          Shie Mannor         4
```
