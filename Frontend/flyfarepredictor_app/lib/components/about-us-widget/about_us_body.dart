import 'package:flutter/material.dart';

import '../../constants.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(),
              Text(
                "ABOUT THE APPPLICATION",
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(7.0),
                child: Text(
                  "This is a Flight Fares Predcitable Application. This is for public usage. Any user can access this application."
                  "You can be aware of fluctuation of airline ticket prices and this app may help you to know the best time to"
                  " buy your ticket. Also it predicts  the lowest price  of the ticket of the airline which he wishes to travel. \n\n"
                  "This app is based on a pilot study and I selected only few flight routes such as from USA to UK, UK to USA, India to USA, USA to India, "
                  "Qatar to Sri Lanka, Sri Lanka to Qatar.\n\n"
                  "You should input the date when you wish to book the ticket and also you should select the flight also. Then The system will "
                  "predict the price of the ticket and show the predicted ticket price. Also the system will recommend "
                  "to whether you should book the ticket or you should wait to book the ticket on that date which you needs to fly.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF880E4F).withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 70,
                      width: 90,
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.7)),
                      child: Image.asset(
                        'assets/images/Flutter.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Powered By : ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF212121),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Flutter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212121),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(thickness: 5),
              Divider(),
              Text(
                "ABOUT THE DEVELOPER",
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(7.0),
                child: Text(
                  "I am a software enginner undergraduate studying in Informatics Institute of Technology located at Colombo 06. "
                  "As per the key requirement for passing the Final year, we need to complete a research project and that's why I selected this domain."
                  "There are so many web based apps to predict the flight fares but there are less number of Mobile apps.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF880E4F).withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: profilePicBorderColor,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                      radius: 45,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        "Copyright Permission : ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF212121),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Adeesha Perera",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212121),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
