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
                  "This is an application for flight fares predcition and generate a rough recommendation for passengers. This is for public usage. Any user can access this application."
                  "Since you are not aware of fluctuation of airline ticket prices and this app will help you to think the best time for"
                  " reserving your tickets. Also this predicts the lowest price of the ticket of the airline which he wishes to travel. \n\n"
                  "This app is based on a pilot study and I selected only few flight routes in India.\n\n"
                  "In the Home Page, you should input the details of the flight when you wish to book the ticket. Then the app will "
                  "predict the results and shpw you the predicted results. Also the system will recommend "
                  "to whether you should book the ticket or you should wait to book the ticket on that date which you needs to fly.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 96, 3, 53).withOpacity(0.9),
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
                  "I am an undergraduate student who is following a BEng (Hons) Software Engineering Degree at Informatics Institute of Technology affiliated with"
                  " University of Westminster at Colombo 06. \n\n"
                  "As per the key requirement for passing the Final year, we need to complete the final year research project. For that project, I selected the aviation domain."
                  "There are so many web based apps to predict the flight fares but there are no number of Mobile apps I was able find.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 96, 3, 53).withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
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
