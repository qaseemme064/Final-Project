-- Creating Table for Participants_Details
CREATE TABLE Participants_Details(
	Participant_ID VARCHAR(10) NOT NULL,
	Age INT NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	First_Name VARCHAR(20) NOT NULL,
	Last_Name VARCHAR(20) NOT NULL,
	PRIMARY KEY (Participant_ID)
);

SELECT * FROM participants_details

--Creating Table for active_duration
CREATE TABLE active_duration(
	"S.No." INT NOT NULL,
	Participant_ID VARCHAR(10) NOT NULL,
	Dates DATE NOT NULL,
	active_duration_in_mins FLOAT NOT NULL,
	PRIMARY KEY ("S.No."),
	FOREIGN KEY (Participant_ID) REFERENCES participants_details(participant_id)
	
);

SELECT * FROM active_duration

--Creating Table for avg_active_heart_rate
CREATE TABLE avg_active_heart_rate(
	"S.No." INT NOT NULL,
	Participant_ID VARCHAR(10) NOT NULL,
	Dates DATE NOT NULL,
	Avg_Active_HeartRate FLOAT NOT NULL,
	PRIMARY KEY ("S.No."),
	FOREIGN KEY (Participant_ID) REFERENCES participants_details(participant_id)
);

SELECT * FROM avg_active_heart_rate


--Creating Table for Calories
CREATE TABLE calories(
	"S.No." INT NOT NULL,
	Participant_ID VARCHAR(10) NOT NULL,
	Dates DATE NOT NULL,
	Calories INT NOT NULL,
	PRIMARY KEY ("S.No."),
	FOREIGN KEY (Participant_ID) REFERENCES participants_details(participant_id)
);
	
SELECT * FROM calories	

--Creating Table for Distance
CREATE TABLE distance(
	"S.No." INT NOT NULL,
	Participant_ID VARCHAR(10) NOT NULL,
	Dates DATE NOT NULL,
	Distance FLOAT NOT NULL,
	PRIMARY KEY ("S.No."),
	FOREIGN KEY (Participant_ID) REFERENCES participants_details(participant_id)
);

SELECT * FROM distance

--Creating Table for Resting heart rate
CREATE TABLE resting_heartRate(
	"S.No." INT NOT NULL,
	Participant_ID VARCHAR(10) NOT NULL,
	Dates DATE NOT NULL,
	Resting_beats_per_min FLOAT NOT NULL,
	PRIMARY KEY ("S.No."),
	FOREIGN KEY (Participant_ID) REFERENCES participants_details(participant_id)
);

SELECT * FROM resting_heartRate

--Creating Table for Sleep
CREATE TABLE sleep(
	"S.No." INT NOT NULL,
	Participant_ID VARCHAR(10) NOT NULL,
	Date_of_Sleep DATE NOT NULL,
	Minutes_Asleep INT NOT NULL,
	PRIMARY KEY ("S.No."),
	FOREIGN KEY (Participant_ID) REFERENCES participants_details(participant_id)
);

SELECT * FROM sleep

--Creating Table for Steps
CREATE TABLE steps(
	"S.No." INT NOT NULL,
	Participant_ID VARCHAR(10) NOT NULL,
	Dates DATE NOT NULL,
	Steps FLOAT NOT NULL,
	PRIMARY KEY ("S.No."),
	FOREIGN KEY (Participant_ID) REFERENCES participants_details(participant_id)
);

SELECT * FROM steps