from flask import Flask, request, jsonify
import util

app = Flask(__name__)

@app.route('/get_airline_services_India', methods =['GET'])
def get_airline_services():
    response = jsonify({
        'airlines': util.get_airline_services()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')
    
    return response

@app.route('/get_source_airports_India', methods =['GET'])
def get_source_airports():
    response = jsonify({
        'sources': util.get_source_airports()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')
    
    return response

@app.route('/get_destination_airports_India', methods =['GET'])
def get_destination_airports():
    response = jsonify({
        'destinations': util.get_destination_airports()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')
    
    return response

@app.route('/predict_flight_fare_India', methods=['GET','POST'])
def predict_flight_fare():
    
    airline = request.form['airline']
    source = request.form['source']
    destination = request.form['destination']   
    stops = int(request.form['no_of_stops'])
    journeyday = int(request.form['journey_day'])
    journeymonth = int(request.form['journey_month'])
    dephour = int(request.form['departure_hours'])
    depmin = int(request.form['departure_minutes'])
    arrhour = int(request.form['arrival_hours'])
    arrmin = int(request.form['arrival_minutes'])
    durhour = int(request.form['duration_hours'])
    durmin = int(request.form['duration_minutes'])
    

    response = jsonify({
        'predicted_fare': util.get_predicted_fare(airline, source, destination, stops, journeyday, journeymonth, dephour, depmin, arrhour, arrmin, durhour, durmin)[0],
        'lowest': util.get_predicted_fare(airline, source, destination, stops, journeyday, journeymonth, dephour, depmin, arrhour, arrmin, durhour, durmin)[1],
        'recommendation': util.get_predicted_fare(airline, source, destination, stops, journeyday, journeymonth, dephour, depmin, arrhour, arrmin, durhour, durmin)[2],     

    })
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response

if __name__ == "__main__":
    print("Starting Python Flask Server For Flight Ticket Price Prediction...")
    util.load_saved_artifacts()
    app.run(host="127.0.0.1", port=5000)


