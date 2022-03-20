import json
import pickle
import numpy as np
import pandas as pd

__airline = None
__source = None
__destination = None
__data_columns = None
__model = None

df1 = pd.read_excel('D:/FYP/Implementation/Data Science/Flight_Data_Train.xlsx')
df2= df1.drop(['Total_Stops','Date_of_Journey','Source','Destination', 'Route', 'Dep_Time', 'Arrival_Time', 'Duration', 'Additional_Info'],axis ='columns')
df3 = df2.dropna()
df3.isnull().sum()

dummies = pd.get_dummies(df3[['Airline']])
df4 = pd.concat([df3,dummies],axis='columns')
df5 = df4.drop(['Airline'],axis='columns')

print(df5.columns)

def get_predicted_fare(airline, source, destination, stops, journeyday, journeymonth, dephour, depmin, arrhour, arrmin, durhour, durmin):

    pricelist = []
    
    try:
        airline_index = __data_columns.index(airline)
    except:
        destination_index = -1
        
    try:
        source_index = __data_columns.index(source)
    except:
        source_index = -1

    try:
        destination_index = __data_columns.index(destination)
    except:
        destination_index = -1

    x = np.zeros(len(__data_columns))
    x[0] = stops
    x[1] = journeyday
    x[2] = journeymonth
    x[3] = dephour
    x[4] = depmin
    x[5] = arrhour
    x[6] = arrmin
    x[7] = durhour
    x[8] = durmin
    
    if airline_index >= 0:
        x[airline_index] = 1

    if source_index >= 0:
        x[source_index] = 1

    if destination_index >= 0:
        x[destination_index] = 1
    
    predictfare = __model.predict([x])[0]

    df_new = df5[df5[airline] == 1]
    lowestfare = min(df_new['Price'])
    
    recommendation = ""
    message1 = "BUY"
    message2 = "WAIT"
    
    if predictfare > df_new["Price"].mean() :
        recommendation = message1

    else:
        recommendation = message2

    pricelist.append(round(predictfare, 2))
    pricelist.append(lowestfare)
    pricelist.append(recommendation)

    return pricelist

def get_airline_services():
    return __airline

def get_source_airports():
    return __source

def get_destination_airports():
    return __destination

def load_saved_artifacts():
    print("Loading saved artifacts")
    global __airline
    global __source
    global __destination
    global __data_columns

    with open("D:/FYP/Implementation/Data Science/columns.json",'r') as f:
        __data_columns = json.load(f)['data_columns']
        __airline = __data_columns[9:21]
        __source = __data_columns[21:26]
        __destination = __data_columns[26:]


    global __model
    with open("D:/FYP/Implementation/Data Science/flight_fare_model.pickle",'rb') as f:
        __model = pickle._load(f)

        
if __name__ == "__main__":
    load_saved_artifacts()
    print(get_predicted_fare('Airline_GoAir', 'Source_Delhi', 'Destination_Cochin', 2, 24, 2, 10, 56, 18, 45, 7, 35))
