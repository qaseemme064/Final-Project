# **Final Project**

## **Final Project**

### **Purpose**

Wearable fitness tracker that record an individual's activity and personal health data (such as heart rate) offers the ability to healthcare professionals to remotely monitor patients health. Futhermore, using machine learning, we can predict an individuals future health data thereby allowing preventative action to be taken today to correct health metrics that maybe trending towards an undesiable value.

This project :

- Uses data from activity trackers (such as Fitbit or Garmin) to measure participants personal data such as: heart rate, steps, sleep, and activity over time
- With this data, we use machine learning to predict future values for these data streams for each participant.
- We'll allow the user to graph a particiapnt's individual data streams.
- We'll allow the user to create filters that highlight individual participants.


We hope to show that personal health data collected thorugh activity trackers can be used to predict future health information about an individual which can be used to by health professionals in keeping their patients healthy.


### **Data Sources**:

For this project we used a dataset found on kaggle which combines traditional lifelogging with sports activity logging over a period of 5 months for 16 different individuals,

https://www.kaggle.com/datasets/vlbthambawita/pmdata-a-sports-logging-dataset


### **Machine Learning**:

For machine learning part of this assignment we investigated the following models:

ARIMA

ARIMAX

SARIMA

We decided to use the ARIMA model as we did not feal that there would be seasonal factors (SARIMA) or external factors (ARIMAX) that would impact our predictions.


### **Database**:

We decided to use PostgreSQL as the database for this project as the dataset will be structured and not be variable.

The schematic of the database tables will be:

![Image of Database_Structure](/Images/ERD_Diagram.png)

Sample data will look as follows:

![Screenshot 2022-05-14 094010](https://user-images.githubusercontent.com/96033163/168430057-99c1394a-c545-4461-a88c-46c78cf14a8f.png)


### **Dashboard**:

The Dashboard will have 3 main parts:

![Image of Dashboard_Mockup](/Images/Dashboard_Mockup.png)

1) The **Alert** section will allow the user to select values to filter the patient data and display the patients that exceed the filter values

![Image of Dashboard_Alert](/Images/Dashboard_Alert.png)

2) The **Patient Data** section will allow the user to select an individual patient and display specific static data on the patient:

![Image of Dashboard_Patient_Data](/Images/Dashboard_Patient_Data.png)

3) The **Patient Chart** section will display the collected and predicted future patient data over time in a chart. Users will be able to select which data stream(s) to include in the chart.

![Image of Dashboard_Patient_Chart](/Images/Dashboard_Patient_Chart.png)

