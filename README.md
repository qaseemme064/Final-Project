# **Final Project**

**Presentation Outline** ( Work in progress)

https://docs.google.com/presentation/d/17q3Ww6542tbRnkE8Gic-3cj-i_6PWvZ0HmuZEd1ymac/edit?usp=sharing



### **Purpose**

Wearable fitness tracker that record an individual's activity and personal health data (such as heart rate) offers the ability to healthcare professionals to remotely monitor a patient's health. Using machine learning, we hope to predict an individual's future health data thereby allowing preventative action to be taken early enough to correct health metrics that maybe trending towards an undesiable value.

This project :

- Uses data from activity trackers (such as Fitbit or Garmin) to measure participants personal data such as: calore intake, heart rate, steps, sleep, and activity over a defined period.
- With this data, we would use machine learning to predict future values for these data streams for each participant.
- Our model will allow the user to graph a particiapnt's individual data streams.
- The user will be able to create filters that highlight individual participants.


We hope to show that personal health data collected through activity trackers can be used to predict future health information about an individual which can be used to by health professionals in keeping their patients healthy.

**Our hypothesis**:
Wearable fitness tracker which captures salient metrics can be helpful to prolonging lifespan of individuals by alerting persons, health care professionals and insurance firms to future health issues.

### **Data Sources**:

For this project we used a dataset found on kaggle which combines traditional lifelogging with sports activity logging over a period of 5 months for 16 different individuals,

https://www.kaggle.com/datasets/vlbthambawita/pmdata-a-sports-logging-dataset

### **Database**: Hasan please update justt add on

We decided to use PostgreSQL as the database for this project as the dataset will be structured and not be variable.

The schematic of the database tables will be:

![Image of Database_Structure](/Images/ERD_Diagram.png)

Sample data will look as follows:

![Screenshot 2022-05-14 094010](https://user-images.githubusercontent.com/96033163/168430057-99c1394a-c545-4461-a88c-46c78cf14a8f.png)


### **Machine Learning**:

We use time series analysis in machine learning. The rationale is in the hope off helping health care professionals understand the underlying causes of trends or patterns over the time period. To this end, we investigated the following models:

ARIMA

ARIMAX

SARIMA

and initially decided to use the ARIMA model in absence of seasonal factors (SARIMA) or external factors (ARIMAX) that would impact our predictions. As each participant (total number of 15 participants) and each dataset (7 different datasets) woudl require a machine learning model we would need a total of 105 models programmed. Since AMIRMA models have to be fit individually with After experiencing a couple of glitches in handling null values for a couple of participants and forecasting, we investigated another model - PROPHET.

Travis & Hasan please update: submit codes
**Application of Machine learning Model**

***Preliminary Data preprocessing***

***Preliminary feature engineering***

***How data was split into training and testing***

***reason for model choice and limitations***


### **Dashboard**

The Dashboard will have 3 main parts:

![Image of Dashboard_Mockup](/Images/Dashboard_Mockup.png)

1) The **Alert** section will allow the user to select values to filter the patient data and display the patients that exceed the filter values

![Image of Dashboard_Alert](/Images/Dashboard_Alert.png)

2) The **Patient Data** section will allow the user to select an individual patient and display specific static data on the patient:

![Image of Dashboard_Patient_Data](/Images/Dashboard_Patient_Data.png)

3) The **Patient Chart** section will display the collected and predicted future patient data over time in a chart. Users will be able to select which data stream(s) to include in the chart.

![Image of Dashboard_Patient_Chart](/Images/Dashboard_Patient_Chart.png)

Tableau2021.3 will be used to create the dashboard as we will be importing the data from PostgreSQL. The Story will contain two Dashboards. 

<u>Dashboard #1</u>

The first Dashboard will contain the Alert System. The user would be allow to change the ranges of the filtered values to only show the patients, who have exceed values and hence Alerting the user which patients will need to be monitored. 

![Image of Alert_system](/Images/Alert_system.png)

<u>Dashboard #2</u>

The second Dashboard will show the Participant Information. Adjusting the Patient ID will affect the data shown under Partient Information and also the Patient Chart. 
![Image of Participant_Information](/Images/Participant_Information.png)


