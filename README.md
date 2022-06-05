# **Final Project**

**Presentation Outline** ( Work in progress)

Please [CLICK HERE](https://docs.google.com/presentation/d/17q3Ww6542tbRnkE8Gic-3cj-i_6PWvZ0HmuZEd1ymac/edit?usp=sharing) for the presentation google sheets.

### **Purpose**

Wearable fitness tracker which records an individual's activity and personal health data (such as heart rate) offers the ability to healthcare professionals to remotely monitor a patient's health. Using machine learning, we would attempt to predict an individual's future health data thereby allowing preventative action to be taken early enough to correct health metrics that may trend towards undesiable values.

Our Strategy:

- Use data from activity trackers (such as Fitbit or Garmin) to measure participants personal data such as: calore intake, heart rate, steps, sleep, and activity over a defined period.
- Cleanup the data using techniques in Pandas
- Use machine learning to predict future values for these data streams per participant.
- Create an interactive dashboard which graphs a participant's data streams.
- Allow users the ability to create filters that highlight individual participants health data.


We hope to show that personal health data collected through activity trackers can be used to predict future health information about an individual which can be used to by health professionals in keeping their patients healthy.

**Our hypothesis**:
Wearable fitness tracker which captures salient metrics can be helpful in prolonging lifespan of individuals by alerting persons, health care professionals and insurance firms to future health concerns.

**Our Technique**

* We used Python in Pandas to clean up data
* Use PDAdmin4 as open source management tool with PostgresSQL to prepare dashboatd
* Trained and tested the data
* Passed data through LGBM regression and Prophet models to determine best applicable model

**Our Analytical Process**

<img src = "https://user-images.githubusercontent.com/96435901/172024805-58410e0a-65ab-476a-9159-534c4916165b.png" width='800'>


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

We loaded the original data from the Kaggle into Tableau. For each of the metrics, we created a box plot for each of the participant. We observed some zero values for some of the metrics for individual participants, we made the decision to remove these values as we felt this were null values or the results of participants not taking the readings on these days. 

![LBGM_Calories](https://user-images.githubusercontent.com/96031520/171970367-32d87c6b-c924-4cae-8107-b3afd1ab850f.jpg)

![LGBM_Active_Duration](https://user-images.githubusercontent.com/96031520/171970386-b81bf3fd-0f7b-459a-8d49-2ea3a51697a1.jpg)

![LGBM_Active_Heart_Heart](https://user-images.githubusercontent.com/96031520/171970390-2d249f90-bdb4-4b75-9ef8-54673c9b4110.jpg)

![LGBM_Distance](https://user-images.githubusercontent.com/96031520/171970392-cc8413d6-0ea4-474f-a2ac-366728ea2983.jpg)

![LGBM_Resting_Heart](https://user-images.githubusercontent.com/96031520/171970400-68ef4c4e-5390-4237-ace7-d370f1b22277.jpg)

![LGBM_Steps](https://user-images.githubusercontent.com/96031520/171970403-7f7eaacd-dad2-497c-afbf-fd14d7deed09.jpg)


### **Database**

We decided to use Heroku as our database and for hosting we used pgAdmin4 and connected heroku with pgAdmin4. Due to restrictions of rows which is 10000 rows, we had to drop couple of our participents data in order to get number of rows with in 10000 rows. 

Due to 10000 rows restriction we used VIEW command in our Postgres SQL. 

The schematic of the database tables will be:

![QuickDBD-export](https://user-images.githubusercontent.com/96033163/170885676-ee1fde21-d67b-4b7b-bba1-590c3280c814.png)


Below is the quick look of heroku summary

![heroku](https://user-images.githubusercontent.com/96033163/170887403-c6bde6a1-fa00-4a6d-89e5-e7313f780a6e.png)


Sample data will look as follows:

![Screenshot 2022-05-14 094010](https://user-images.githubusercontent.com/96033163/168430057-99c1394a-c545-4461-a88c-46c78cf14a8f.png)

Active Heart Rate dataset had multiple entries per day per participant. Since project is using a minimum timeframe of a day, created a view in database to display average active heart rates per day per participant.


### **Machine Learning**:

We use time series analysis in machine learning. The rationale is in the hope off helping health care professionals understand the underlying causes of trends or patterns over the time period. To this end, we investigated the following models:

ARIMA

ARIMAX

SARIMA

and initially decided to use the ARIMA model in absence of seasonal factors (SARIMA) or external factors (ARIMAX) that would impact our predictions. As each participant (total number of 15 participants) and each dataset (7 different datasets) would require a machine learning model we would need a total of 105 models programmed. Since ARIMA models have to be fit individually with After experiencing a couple of glitches in handling null values for a couple of participants and forecasting, we investigated another model - PROPHET. Prophet model allowed for fit to automated, so we choose to proceed with Prophet.


***Preliminary Data preprocessing***

Trends
- Using charts we examined the data sets for trends.
- There does not seem to be a trend in the 7 data streams.

Outliners

- Using charts, we examined the dataset for unusual values. There appear to be outliers and/or zero values in some data streams. We’ve decided to keep the outliers and zero values in the dataset used for predictions as we felt these would be normal occurrences in an individual’s lifestyle.

***Preliminary feature engineering***

- We used a univariable time series model so there was no feature engineering or feature selection necessary.

***How data was split into training and testing*** (NEED TO BE EDITED)

- We divided dataset into training and testing data using a training % variable.
- This allowed us to change training % variable to see if this caused a better model fit.
- We tested model using a 66% and 80% training fit % and felt the 66% variable produced better results.

- We decided to evaluate the ML models using MAPE (MAPE = abs(predicted value - test value) / abs(test value) * 100%)

- Additional, Prophet ML model allows for daily seasonality. However, running the Prophet ML model using daily seaonality did not produce better MAPE results.
 
**66% Training %, No Seasonaility** 

![MAPE_No_Zeroes_Seasonal_66](https://user-images.githubusercontent.com/96033163/172054080-03f5e474-e24c-4a5d-a0ca-0c2ab5e7597e.png)

***Reason for model choice and limitations***

- We choose the Prophet ML model due to the number of ML models that we needed to fit and the easy of use of the Prophet ML model.
- AMIRA models require additional variable input by user which given the number of models which would not be pratical for this project.
- Limititations: Prophet model was developed by Facebook business time series prediction. As such, in prediciting non business data, it can lead to higher error rates.
- Advantages: Prophet model requires less hyperparameter tuning as it is specifically designed to detect patterns in business time series.

### **Dashboard**

Please [CLICK HERE](https://public.tableau.com/app/profile/kelly5613/viz/Final-Project_16541248140270/Final_Dashboard?publish=yes) for the interactive Dashboard.

The Dashboard will have 3 main parts:

![Dashboard_Mockup](https://user-images.githubusercontent.com/96033163/172054102-ef960bd1-7695-42a2-af4e-c7f6a9b6f4cb.png)


1) The **Alert** section will allow the user to select values to filter the patient data and display the patients that exceed the filter values

![Dashboard_Alert](https://user-images.githubusercontent.com/96033163/172054117-399a3d63-9465-45d1-9d85-785dd3feac32.png)


2) The **Patient Data** section will allow the user to select an individual patient and display specific static data on the patient:


![Dashboard_Patient_Data](https://user-images.githubusercontent.com/96033163/172054136-cc58c2f5-8af7-416a-9259-f4815b7a73a5.png)


3) The **Patient Chart** section will display the collected and predicted future patient data over time in a chart. Users will be able to select which data stream(s) to include in the chart.

![Dashboard_Patient_Chart](https://user-images.githubusercontent.com/96033163/172054145-223ae37b-3471-4a09-8399-892ee96b6192.png)


Tableau2021.3 will be used to create the dashboard as we will be importing the data from PostgreSQL. The Story will contain two Dashboards. 

<u>Dashboard #1</u>

The first Dashboard will contain the Alert System. The user would be allow to change the ranges of the filtered values to only show the patients, who have exceed values and hence Alerting the user which patients will need to be monitored. 

![Alert_system](https://user-images.githubusercontent.com/96033163/172054170-9d78926a-4218-46a1-84d8-0bb48c3fa247.png)


<u>Dashboard #2</u>

The second Dashboard will show the Participant Information. Adjusting the Patient ID will affect the data shown under Partient Information and also the Patient Chart.


![Participant_Information](https://user-images.githubusercontent.com/96033163/172054173-3a7a91c3-cf1f-4a52-8dc1-87ef15380b19.png)



