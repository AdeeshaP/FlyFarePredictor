import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyfarepredictor_app/models/user_model.dart';
import 'package:dropdownfield2/dropdownfield2.dart';

import '../../constants.dart';

import 'package:http/http.dart' as http;

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

//
class _HomeBodyState extends State<HomeBody> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  Map? flightDataIndia;
  Map? sourcesIndia;
  Map? destinationsIndia;

  fetchAirlineData() async {
    http.Response airlineData = await http.get(
      Uri.parse(
        "http://10.0.2.2:5000/get_airline_services_India",
      ),
    );
    setState(() {
      flightDataIndia = jsonDecode(airlineData.body);
    });
  }

  fetchSourceAirprtsData() async {
    http.Response sourceData = await http.get(
      Uri.parse(
        "http://10.0.2.2:5000/get_source_airports_India",
      ),
    );
    setState(() {
      sourcesIndia = jsonDecode(sourceData.body);
    });
  }

  fetchDestinationAirprtsData() async {
    http.Response destinationData = await http.get(
      Uri.parse(
        "http://10.0.2.2:5000/get_destination_airports_India",
      ),
    );
    setState(() {
      destinationsIndia = jsonDecode(destinationData.body);
    });
  }

  @override
  void initState() {
    fetchAirlineData();
    fetchSourceAirprtsData();
    fetchDestinationAirprtsData();

    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  void dispose() {
    airlineController.clear();
    sourceController.clear();
    destinationController.clear();
    noofstopsController.clear();
    journeydayController.clear();
    journeymonthController.clear();
    arrivalhourController.clear();
    arrivalminController.clear();
    departhourController.clear();
    departminController.clear();
    durationhourController.clear();
    durationminController.clear();

    priceContainer = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Please insert flight details here...",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    // ---------------- Airline Service -------------------

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      child: DropDownField(
                        controller: airlineController,
                        hintText: "Airline Service",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        enabled: true,
                        itemsVisibleInDropdown: 5,
                        items: flightDataIndia?["airlines"].cast<String>(),
                        onValueChanged: (value) {
                          setState(() {
                            selectedAirline = value;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 5),
                    // ---------------- Source Airport -------------------

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      child: DropDownField(
                        controller: sourceController,
                        hintText: "Source Airport",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        enabled: true,
                        itemsVisibleInDropdown: 5,
                        items: sourcesIndia?["sources"].cast<String>(),
                        onValueChanged: (value1) {
                          setState(() {
                            selectedSource = value1;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 5),

                    // ---------------- Destination Airport -------------------
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      child: DropDownField(
                        controller: destinationController,
                        hintText: "Destination Airport",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        enabled: true,
                        itemsVisibleInDropdown: 5,
                        items:
                            destinationsIndia?["destinations"].cast<String>(),
                        onValueChanged: (value2) {
                          setState(() {
                            selectedDestination = value2;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 5),

                    // ---------------- Number of Stops -------------------
                    Container(
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: noofstopsController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "No of Stops",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        validator: (noOfStops) {
                          if (noOfStops!.isEmpty) {
                            return "No of Stops Cannot be null.";
                          }
                          if (noOfStops.contains(".")) {
                            return "No of Stops Cannot be a Decimal Value.";
                          }
                          if (int.parse(noOfStops) < 1 ||
                              int.parse(noOfStops) > 10) {
                            return "No of Stops Cannot be Less than 1 or Greater Than 10";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 5),

                    // ---------------- Journey Day -------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          width: size.width * 0.44,
                          child: TextFormField(
                            controller: journeydayController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Journey Day",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (journeyDay) {
                              if (journeyDay!.isEmpty) {
                                return "Journey Day Cannot be null.";
                              }
                              if (journeyDay.contains(".")) {
                                return "Journey Day Cannot be a Decimal Value.";
                              }
                              if (int.parse(journeyDay) < 1 ||
                                  int.parse(journeyDay) > 31) {
                                return "Journey Day Cannot be Less than 1 or Greater Than 31";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        // ---------------- Journey Month -------------------
                        SizedBox(
                          height: 50,
                          width: size.width * 0.44,
                          child: TextFormField(
                            controller: journeymonthController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Journey Month",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (journeyMonth) {
                              if (journeyMonth!.isEmpty) {
                                return "Journey Month Cannot be null.";
                              }
                              if (journeyMonth.contains(".")) {
                                return "Journey Month Cannot be a Decimal Value.";
                              }
                              if (int.parse(journeyMonth) < 1 ||
                                  int.parse(journeyMonth) > 12) {
                                return "Journey Month Cannot be Less than 1 or Greater Than 12";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // ---------------- Departure Hour -------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          width: size.width * 0.44,
                          child: TextFormField(
                            controller: departhourController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Departure Hour",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (departHrs) {
                              if (departHrs!.isEmpty) {
                                return "Departure Hour Cannot be null.";
                              }
                              if (departHrs.contains(".")) {
                                return "Departure Hour Cannot be a Decimal Value.";
                              }
                              if (int.parse(departHrs) < 0 ||
                                  int.parse(departHrs) > 24) {
                                return "Departure Hour Cannot be Less than 0 or Greater Than 24";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        // ---------------- Departure Minutes -------------------
                        SizedBox(
                          height: 50,
                          width: size.width * 0.44,
                          child: TextFormField(
                            controller: departminController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Departure Minutes",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (departureMins) {
                              if (departureMins!.isEmpty) {
                                return "Departure Minutes Cannot be null.";
                              }
                              if (departureMins.contains(".")) {
                                return "Departure Minutes Cannot be a Decimal Value.";
                              }
                              if (int.parse(departureMins) < 0 ||
                                  int.parse(departureMins) > 60) {
                                return "Departure Minutes Cannot be Less than 0 or Greater Than 60";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // ---------------- Arrival Hour -------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          width: size.width * 0.44,
                          child: TextFormField(
                            controller: arrivalhourController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Arrival Hour",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (arriveHrs) {
                              if (arriveHrs!.isEmpty) {
                                return "Arrival Hour Cannot be null.";
                              }
                              if (arriveHrs.contains(".")) {
                                return "Arrival Hour Cannot be a Decimal Value.";
                              }
                              if (int.parse(arriveHrs) < 0 ||
                                  int.parse(arriveHrs) > 24) {
                                return "Arrival Hour Cannot be Less than 0 or Greater Than 24";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        // ---------------- Arrival Minutes -------------------
                        SizedBox(
                          height: 50,
                          width: size.width * 0.44,
                          child: TextFormField(
                            controller: arrivalminController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Arrival Minutes",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (arriveMins) {
                              if (arriveMins!.isEmpty) {
                                return "Arrival Minutes Cannot be null.";
                              }
                              if (arriveMins.contains(".")) {
                                return "Arrival Minutes Cannot be a Decimal Value.";
                              }
                              if (int.parse(arriveMins) < 0 ||
                                  int.parse(arriveMins) > 60) {
                                return "Arrival Minutes Cannot be Less than 0 or Greater Than 60";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // ---------------- Duration Hours -------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          width: size.width * 0.44,
                          child: TextFormField(
                            controller: durationhourController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Duration Hours",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (durationHrs) {
                              if (durationHrs!.isEmpty) {
                                return "Duration Hours Cannot be null.";
                              }
                              if (durationHrs.contains(".")) {
                                return "Duration Hours Cannot be a Decimal Value.";
                              }
                              if (int.parse(durationHrs) < 0) {
                                return "Duration Hours Cannot be Less than 0";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        // ---------------- Duration Mins -------------------
                        SizedBox(
                          height: 50,
                          width: size.width * 0.44,
                          child: TextFormField(
                            controller: durationminController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Duration Minutes",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (durationMins) {
                              if (durationMins!.isEmpty) {
                                return "Duration Minutes Cannot be Null.";
                              }
                              if (durationMins.contains(".")) {
                                return "Duration Minutes Cannot be a Decimal Value.";
                              }
                              if (int.parse(durationMins) < 0 ||
                                  int.parse(durationMins) > 60) {
                                return "Duration Minutes Cannot be Less than 0 or Greater Than 60";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    circularPrgressBar
                        ? CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    height: 45, width: 150),
                                child: ElevatedButton(
                                  child: Text(
                                    'Find Fare',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: buttonColor,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      circularPrgressBar = true;
                                      priceContainer = false;
                                    });
                                    await getTicketFare();
                                    setState(
                                      () {
                                        circularPrgressBar = false;
                                        if (fare['predicted_fare']
                                            .toString()
                                            .isNotEmpty) {
                                          priceContainer = true;
                                        } else {
                                          priceContainer = false;
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    height: 45, width: 150),
                                child: ElevatedButton(
                                  child: Text(
                                    'Clear',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: buttonColor,
                                  ),
                                  onPressed: () {
                                    airlineController.clear();
                                    sourceController.clear();
                                    destinationController.clear();
                                    noofstopsController.clear();
                                    journeydayController.clear();
                                    journeymonthController.clear();
                                    arrivalhourController.clear();
                                    arrivalminController.clear();
                                    departhourController.clear();
                                    departminController.clear();
                                    durationhourController.clear();
                                    durationminController.clear();
                                  },
                                ),
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Prediction",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.048,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(height: 10),
            priceContainer
                ? Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "THE PREDICTED FARE IS : ₹ " +
                              fare['predicted_fare'].toString(),
                          style: TextStyle(
                            fontSize: size.width * 0.042,
                            fontFamily: 'RobotoMono',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 10),
                        fare['recommendation'].toString() == "BUY"
                            ? Text(
                                "THE SUITABLE TIME FOR BOOKING IS : " +
                                    fare['lowest'].toString(),
                                style: TextStyle(
                                    fontSize: size.width * 0.042,
                                    fontFamily: 'RobotoMono',
                                    fontStyle: FontStyle.italic),
                              )
                            : Text(""),
                        // --------- BUTTON FOR SEE THE LOWEST FARE ---------------//

                        ElevatedButton(
                          child: Text('See The Lowest Fare'),
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 231, 98, 98),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
            Divider(height: 30),

            //------------ RECOMMENDATION GENERATING APPROACH ---------------//
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Recommendation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.048,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(height: 10),
            priceContainer
                ? Container(
                    //------------ DISPLAY RECOMMENDATION ---------------//

                    child: Text(
                      "THE RECOMMENDATION IS : " +
                          fare['recommendation'].toString(),
                      style: TextStyle(
                        fontSize: size.width * 0.042,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //------------ BUY RECOMMENDATION INDICATION ---------------//

                  Container(
                    width: 135,
                    height: 135,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFE0E0E0),
                      border: fare['recommendation'].toString() == "BUY"
                          ? Border.all(
                              color: Color.fromARGB(255, 15, 95, 2),
                              width: 7,
                            )
                          : Border.all(),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(4),
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.09,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorForBookRecmd.withOpacity(0.75),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black12,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "BUY",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: colorForBookRecmd),
                        ),
                      ],
                    ),
                  ),

                  //------------ WAIT RECOMMENDATION INDICATION ---------------//

                  Container(
                    width: 135,
                    height: 135,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFE0E0E0),
                      border: fare['recommendation'].toString() == "WAIT"
                          ? Border.all(
                              color: Color.fromARGB(255, 248, 5, 17),
                              width: 7,
                            )
                          : Border.all(),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(4),
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.09,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorForWaitRecmd.withOpacity(0.75),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black12,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "WAIT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: colorForWaitRecmd),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

Future<void> getTicketFare() async {
  if (formKey.currentState!.validate() &&
      airlineController.text.isNotEmpty &&
      sourceController.text.isNotEmpty &&
      destinationController.text.isNotEmpty) {
    Map<String, String> data = {
      "airline": airlineController.text,
      "source": sourceController.text,
      "destination": destinationController.text,
      "no_of_stops": noofstopsController.text,
      "journey_day": journeydayController.text,
      "journey_month": journeymonthController.text,
      "departure_hours": departhourController.text,
      "departure_minutes": departminController.text,
      "arrival_hours": arrivalhourController.text,
      "arrival_minutes": arrivalminController.text,
      "duration_hours": durationhourController.text,
      "duration_minutes": durationminController.text
    };

    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(data);
      var responsePrice = await dio.post(
          "http://10.0.2.2:5000/predict_flight_fare_India",
          data: formData);

      fare = responsePrice.data;
    } catch (error) {
      print(error);
    }
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
    style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 231, 98, 98),
    ),
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "PREDICTED LOWEST FARE IS",
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
    ),
    content: Text(
      "₹ " + fare['lowest'].toString(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      textAlign: TextAlign.center,
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Map data = {};
bool circularPrgressBar = false;
bool priceContainer = false;
LinkedHashMap fare = new LinkedHashMap();

final airlineController = TextEditingController();
final sourceController = TextEditingController();
final destinationController = TextEditingController();
final noofstopsController = TextEditingController();
final journeydayController = TextEditingController();
final journeymonthController = TextEditingController();
final arrivalhourController = TextEditingController();
final arrivalminController = TextEditingController();
final departhourController = TextEditingController();
final departminController = TextEditingController();
final durationhourController = TextEditingController();
final durationminController = TextEditingController();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

String selectedAirline = "";
String selectedSource = "";
String selectedDestination = "";

String recommendation = fare['recommendation'].toString();
