# PU_Time_Series_Project
 Figure out how the temperature of green land has changed. Moreover, try to create such a model to backcast past temperatures.

# Project on Peleoclimate Temperature Backcasting

## Table of Contents
- [Project Overview](#project-overview)
- [Installation](#installation)
- [Usage](#usage)
- [Acknowledgements](#acknowledgements)
- [References](#references)


## Project Overview
This project focuses on backcasting past temperatures in Greenland using paleoclimate data from ice cores. The objective is to understand historical changes in temperature in Greenland and develop a model to backcast past temperatures. The project includes data collection, univariate and multivariate analysis, and model selection and fitting. The exploratory data analysis includes descriptive measures and line plots to identify trends and patterns. Univariate modeling techniques were initially used but did not provide satisfactory results. Therefore, multivariate analysis was conducted using variables such as CO2 concentration, volcanic eruption temperature, and ice surface temperature. Linear regression was used to analyze the data, and the results were compared to actual values to evaluate the accuracy of the model. The final model achieved an accuracy of 96%. The project faced challenges in acquiring sufficient and comparable data and in analyzing the data due to the lack of prior knowledge in paleoclimate analysis. The bibliography includes sources on time series modeling of paleoclimate data and software for paleoclimate research and education. The Github link to the source code is provided.




## Installation
To install the package, run the following command.

#R 
```r
install.packages("tseries")
```
#Python
```python
pip install pandas
pip install numpy
pip install matplotlib
pip install python-math
pip install scikit-learn
pip install statsmodels
```
## Usage
This project can be used as a reference for researchers or students interested in analyzing paleoclimate data and backcasting past temperatures. The project provides a roadmap for conducting a time series analysis, including data collection, preprocessing, exploratory data analysis, model selection, and validation. The project also discusses the challenges and limitations of working with paleoclimate data, such as the difficulty in acquiring sufficient and comparable data. The developed model can be used to backcast past temperatures in Greenland, contributing to our understanding of climate change and its impacts on the region. The bibliography includes sources on time series modeling of paleoclimate data and software for paleoclimate research and education, which can be useful for further research in this field. The Github link to the source code is provided, which can be used as a starting point for developing similar models or for further analysis of the data.


## Acknowledgements
We would like to express our sincere gratitude to all those who have contributed to the successful completion of this project. Firstly, we would like to thank our supervisor for providing us with guidance and support throughout the project. Their expertise and insights have been invaluable in shaping the direction of our research.

We would also like to thank the authors of the research papers and datasets that we have used in this project. Their work has provided us with a solid foundation for our analysis and has helped us to gain a deeper understanding of the subject matter.

We would like to acknowledge the support of our colleagues and friends who have provided us with encouragement and feedback throughout the project. Their input has been instrumental in shaping our ideas and improving the quality of our work.

Finally, we would like to thank our families for their unwavering support and understanding throughout the project. Their encouragement and belief in us have been a constant source of motivation, and we are grateful for their love and support.

## References
1. [Github](https://github.com/paleoclimate-project/PU_Time_Series_Project)
2. [NCEI](https://www.ncei.noaa.gov/access/paleo-search/)
3. [Data](https://www1.ncdc.noaa.gov/pub/data/paleo/reconstructions/kobashi2017/)

