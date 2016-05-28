
How to predict the future….

This week I worked on a retirement plan. The hard part of the equation, so to speak, was to come up with a percent growth of invest in an index fund.

What percent growth to assume makes a big difference in how much  our family needto save. Instead of just taking some reasonable-seeming numbers from the Internet, I decided to work on the raw data.

The site MeasuringWorth (https://www.measuringworth.com) has some useful long term datasets, in particular the Standard & Poor’s Composite Stock Index from 1871 to the present (https://www.measuringworth.com/datasets/sap/result.php). What’s useful is not just the yearly index values, but also the yield when dividends from stocks are reinvested.

The question I wanted to answer was: Since 1932 to the present, if you dropped your money into the S&P for 17 years, and left it alone, how much return would you realize in the end?

The rate of return as a histogram is below, which shows most of the time annualized returns are between 8% and 18%. As percentiles, the 17-year annualized rate of returns are:

```
       1%        5%       10%       20%       50%       90% 
 5.821512  6.376302  6.736534  7.754149 11.316523 15.910181
```


If history is any guide, the worst one can expect over the next 17 years is 5.82%, the mostly likely yield is 11.3%. As a reasonably conservative estimate of how we’ll do, I’ve used the 20th percentile, or 7.75%, less the expense ratio of of 0.75%, or 7%.

Why 1932?  Because the financial reforms in the wake of the great depression removed a lot of variability from the market. If we go back 100 years, the 17-year returns are significantly weaker:

```
       1%        5%       10%       20%       50%       90% 
 2.770703  4.265371  5.175848  6.365372  9.802520 15.726964 
```

And the 20th percentile return is now 6.36%.

