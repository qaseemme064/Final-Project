# **PREDICTION USING FITNESS TRACKER**

**Presentation Outline** 

Please [CLICK HERE](https://docs.google.com/presentation/d/1t38kgt7l1nMugx77n7lESWG77nfVg8KnyfTEGn_XX1Q/edit?usp=sharing) for the presentation google sheets.



### **Purpose**

Wearable fitness tracker which records an individual's activity and personal health data (such as heart rate) offers the ability to healthcare professionals to remotely monitor a patient's health. Using machine learning, we would attempt to predict an individual's future health data thereby allowing preventative action to be taken early enough to correct health metrics that may trend towards undesiable values.

Our Strategy:

- Use data from activity trackers (such as Fitbit or Garmin) to measure participants personal data such as: calore intake, heart rate, steps, sleep, and activity over a defined period.
- Cleanup the data using techniques in Pandas
- Use machine learning to predict future values for these data streams per participant.
- Create an interactive dashboard which graphs a participant's data streams.
- Allow users the ability to create filters that highlight individual participants health data.


We hope to show that personal health data collected through activity trackers can be used to predict future health information about an individual which can be used by health professionals in keeping their patients healthy.

**Our hypothesis**:
Mobile health trackers can be used to predict future health data parameters for individuals so that proactive action may be taken if the data parameter falls outside certain boundaries.

**Our Technique**

* We used Pandas(Python) to clean up data
* Used PDAdmin4 as open source management tool with PostgresSQL to prepare dashboard in Tableau
* Trained and tested the data
* Passed data through Light Gradient Boosting Model (LGBMRegressor)  and Prophet model to determine best applicable model

**Our Analytical Process**
![Analytical_Process](https://user-images.githubusercontent.com/96031520/172061669-45dc777b-445b-4f5c-a852-62eb12a279c5.png)

### **Data Sources**:

For this project we used a dataset found on kaggle which combines traditional lifelogging with sports activity logging over a period of 5 months for 16 different individuals,

Please [CLICK HERE](https://www.kaggle.com/datasets/vlbthambawita/pmdata-a-sports-logging-dataset) for the Kaggle data.


### **Tools & Technology**:

- Jupyter Notebook: Coding of Machine Learning and cleaning of the data. 
- Prophet Machine Learning and LGBM Regressor: These were the specific machine learning models that we used to train and test the data, as well as the predictions. 
- Heroku: Where the database is stored.  
- pgAdmin4: Access to the SQL database.  
- Tableau Desktop: Used for Data Exploration and Dashboard.

### **Data Exploration**

Fpr each parameter, we loaded the original data from the Kaggle into Tableau and created a box plot for each of the participants. We observed some zero values for some of the metrics for individual participants and made the decision to remove these values. Our rationale being that these were null values or the results of participants not taking readings on those days. 

![LBGM_Calories](https://user-images.githubusercontent.com/96031520/171970367-32d87c6b-c924-4cae-8107-b3afd1ab850f.jpg)

![LGBM_Active_Duration](https://user-images.githubusercontent.com/96031520/171970386-b81bf3fd-0f7b-459a-8d49-2ea3a51697a1.jpg)

![LGBM_Active_Heart_Heart](https://user-images.githubusercontent.com/96031520/171970390-2d249f90-bdb4-4b75-9ef8-54673c9b4110.jpg)

![LGBM_Distance](https://user-images.githubusercontent.com/96031520/171970392-cc8413d6-0ea4-474f-a2ac-366728ea2983.jpg)

![LGBM_Resting_Heart](https://user-images.githubusercontent.com/96031520/171970400-68ef4c4e-5390-4237-ace7-d370f1b22277.jpg)

![LGBM_Steps](https://user-images.githubusercontent.com/96031520/171970403-7f7eaacd-dad2-497c-afbf-fd14d7deed09.jpg)


### **Database**

We decided to use Heroku as our database, and for hosting we used pgAdmin 4 and connected Heroku with pgAdmin 4. Due to restrictions on the number of rows which could be stored in Heroku (10000 rows at no additional cost), we had to drop a couple of our participents' data and used the VIEW command in our Postgres SQL.  

The schematic of the database tables is

![QuickDBD-export](https://user-images.githubusercontent.com/96033163/170885676-ee1fde21-d67b-4b7b-bba1-590c3280c814.png)


Below is the quick look of Heroku summary

![heroku](https://user-images.githubusercontent.com/96033163/170887403-c6bde6a1-fa00-4a6d-89e5-e7313f780a6e.png)


Sample data will look as follows:

![Screenshot 2022-05-14 094010](https://user-images.githubusercontent.com/96033163/168430057-99c1394a-c545-4461-a88c-46c78cf14a8f.png)

Active Heart Rate dataset had multiple entries per day per participant. Since project is using a minimum timeframe of a day, created a view in database to display average active heart rates per day per participant.


## **Machine Learning**:

## **Arima Vs Prophet Vs LGBMRegressor**
We used time series analysis in machine learning. The rationale is in the hope of helping health care professionals understand the underlying causes of trends or patterns over the time period. To this end, we investigated the following models:

ARIMA

ARIMAX

SARIMA

and initially decided to use the ARIMA model in absence of seasonal factors (SARIMA) or external factors (ARIMAX) that would impact our predictions. As each participant (total number of 15 participants) and each dataset (7 different datasets) would require a machine learning model we programmed a total of 105 models. Since ARIMA models have to be fit individually, in a production environment this would be combersome for users to accomplish as actaul data is collected and models would need to be refit. Therefore, we investigated another model - PROPHET. The Prophet model allowed for fit to automated, however, the resulting MAPE calculations were not great. Next, we examined a third machine learning model - Light Gradient Boosting Model Regressor (LGBM) - which also allowed for the model fit to be automated. The LGBM model produced superior MAPE results. We chose to proceed with LGBM Regressor.

# **LGBM Regressor Model**

- LGBM is a regression tree model that grows tree vertically while other algorithm grows trees horizontally meaning that LightGBM grows tree leaf-wise while other algorithm grows level-wise 

![leafwise tree](https://user-images.githubusercontent.com/96033163/172056497-1367b7e5-6910-4002-a1f5-a8876774627a.png)

![level wise tree](https://user-images.githubusercontent.com/96033163/172056526-203ebc1f-259e-49c5-a087-93ae719ae46b.png)


***Preliminary Data preprocessing***

Trends
- Using charts we examined the data sets for trends.
- There does not seem to be a trend in the 7 data streams.

Outliners

- Using charts, we examined the dataset for unusual values. There appear to be outliers and/or zero values in some data streams. We decided to keep the outliers but remove the zero values from all the dataset used for predictions as we felt these were either null values of a result of participants not tracking data for these days.

***Preliminary feature engineering***

- We used a univariable time series model so there was no feature engineering or feature selection necessary.

***How data was split into training and testing***

- LGBM model allows for data to be trained according to time periods.
- we had hourly time periods in the original datasets, so we used hourly data to train the LGBM model
- Training data was all data up to the last 7 days of the original dataset
- Testing data was the last 7 days from the original dataset.

- We decided to evaluate the ML models using MAPE (MAPE = abs(predicted value - test value) / abs(test value) * 100%)

**LGBM Model Machine Learning Model MAPE** 

![LGBM_MAPE](https://user-images.githubusercontent.com/96033163/172055918-e5a219f2-820b-47d9-b71f-54f143bc57ce.png)

# **Prophet Model**

***Preliminary Data preprocessing***

Trends
- Using charts we examined the data sets for trends.
- There does not seem to be a trend in the 7 data streams.

Outliners

- Using charts, we examined the dataset for unusual values. There appear to be outliers and/or zero values in some data streams. We’ve decided to keep the outliers but remove the zero values from all the dataset used for predictions as we felt these were either null values of a result of participants not tracking data for these days.

***Preliminary feature engineering***

- We used a univariable time series model so there was no feature engineering or feature selection necessary.

***How data was split into training and testing***

- We divided dataset into training and testing data using a training % variable.
- This allowed us to change training % variable to see if this caused a better model fit.
- We tested model using a 66% and 80% training fit % and felt the 66% variable produced better results.

- We decided to evaluate the ML models using MAPE (MAPE = abs(predicted value - test value) / abs(test value) * 100%)

- Additional, Prophet ML model allows for daily seasonality. However, running the Prophet ML model using daily seaonality did not produce better MAPE results.
 
**Prophet Machine Learning Model MAPE** 

![MAPE_No_Zeroes_Seasonal_66](https://user-images.githubusercontent.com/96033163/172054080-03f5e474-e24c-4a5d-a0ca-0c2ab5e7597e.png)

***Reason for model choice and limitations***

- We chose the LGBM model due to the number of ML models that we needed to fit and the easy of use of the LGBM model and its superior MAPE results over the Prophet ML model.
- AMIRA models require additional variable input by user which given the number of models which would not be pratical for this project.
- Limititations: Based on research, the LGBM model should have more than 10,000 data points to provide suitable predictions. 
- Advantages: LGBM model requires less hyperparameter tuning as it is specifically designed to detect patterns in business time series.
- Confusion matrix and accuracy score : As our model is regression model, we can not calculate confusion matrix and accuracy score as this can only be done in classification models 

### **Dashboard**

Please [CLICK HERE](https://public.tableau.com/app/profile/kelly5613/viz/Final-Project_16541248140270/Dashboard?publish=yes) for the interactive Dashboard.

The Dashboard will have 3 main parts:

![Dashboard_Mockup](https://user-images.githubusercontent.com/96033163/172054102-ef960bd1-7695-42a2-af4e-c7f6a9b6f4cb.png)


1) The **Alert** section will allow the user to select values to filter the patient data and display the patients that exceed the filter values

![Dashboard_Alert](https://user-images.githubusercontent.com/96033163/172054117-399a3d63-9465-45d1-9d85-785dd3feac32.png)


2) The **Patient Data** section will allow the user to select an individual patient and display specific static data on the patient:


![Dashboard_Patient_Data](https://user-images.githubusercontent.com/96033163/172054136-cc58c2f5-8af7-416a-9259-f4815b7a73a5.png)


3) The **Patient Chart** section will display the collected and predicted future patient data over time in a chart. Users will be able to select which data stream(s) to include in the chart.

![Dashboard_Patient_Chart](https://user-images.githubusercontent.com/96033163/172054145-223ae37b-3471-4a09-8399-892ee96b6192.png)


Tableau2021.3 will be used to create the dashboard as we will be importing the data from PostgreSQL.

***Patient Health Dashboard***

The first part of the dashboard will contain the Alert System. The user would be allow to change the ranges of the filtered values of the actual values or the predictions to only show the patients, who have exceed values and hence Alerting the user which patients will need to be monitored. 

![Alert_System](https://user-images.githubusercontent.com/96031520/172517623-8ddd9ed0-9466-4859-afbc-13148d77c73e.png)

The second part of the dashboard will show the Participant Information. Adjusting the Patient ID will affect the data shown under Partient Information and also the Patient Chart.

![Patient_Information](https://user-images.githubusercontent.com/96033163/172513816-b754cee8-7f24-4ab8-8474-9eb8b719c24b.png)

![chart1](https://user-images.githubusercontent.com/96033163/172513909-01922f15-e348-47af-9c52-b85131702e4e.png)

![chart2](https://user-images.githubusercontent.com/96033163/172513926-b506fdf8-6640-45e2-a7b1-7282edcf5901.png)

![chart3](https://user-images.githubusercontent.com/96033163/172513944-077003cb-3980-4750-822d-a2f21497a098.png)
### Footnote
https://medium.com/@pushkarmandot/https-medium-com-pushkarmandot-what-is-lightgbm-how-to-implement-it-how-to-fine-tune-the-parameters-60347819b7fc

