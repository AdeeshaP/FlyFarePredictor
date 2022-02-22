import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

//
class _HomeBodyState extends State<HomeBody> {
  String date = "";
  DateTime selectedDate = DateTime.now();

  final TextEditingController _controller1 = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  final TextEditingController _controller3 = new TextEditingController();
  final TextEditingController _controller4 = new TextEditingController();

  var noOfStops = [1, 2, 3, 4, 5];
  var destinations = ["", "", "", "", ""];
  var sources = ["", "", "", "", ""];
  var airlines = ["", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "PREDICTION",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04,
                  decoration: TextDecoration.underline,
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
                  Container(
                    child: TextField(
                      controller: _controller1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Airline Service",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.0),
                        ),
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            _controller1.text = value;
                          },
                          itemBuilder: (BuildContext context) {
                            return airlines
                                .map<PopupMenuItem<String>>((String value) {
                              return new PopupMenuItem(
                                  child: new Text(value), value: value);
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () => _selectDate(context),
                            icon: Icon(Icons.calendar_today)),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Arrival Date",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () => _selectDate(context),
                            icon: Icon(Icons.calendar_today)),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Departure Date",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: TextField(
                      controller: _controller2,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Source Airport",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.0),
                        ),
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            _controller2.text = value;
                          },
                          itemBuilder: (BuildContext context) {
                            return sources
                                .map<PopupMenuItem<String>>((String value) {
                              return new PopupMenuItem(
                                  child: new Text(value), value: value);
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: TextField(
                      controller: _controller3,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Destination Airport",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.0),
                        ),
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            _controller3.text = value;
                          },
                          itemBuilder: (BuildContext context) {
                            return destinations
                                .map<PopupMenuItem<String>>((String value) {
                              return new PopupMenuItem(
                                  child: new Text(value), value: value);
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: TextField(
                      controller: _controller4,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "No of Stops",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.0),
                        ),
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            _controller4.text = value;
                          },
                          itemBuilder: (BuildContext context) {
                            return noOfStops
                                .map<PopupMenuItem<String>>((int value) {
                              return new PopupMenuItem(
                                  child: new Text(value.toString()),
                                  value: value.toString());
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "THE PREDICTED FARE IS : ",
            style: TextStyle(
                fontSize: size.width * 0.04,
                fontFamily: 'RobotoMono',
                fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 10),
          Text(
            "THE LOWEST PREDICTED FARE IS : ",
            style: TextStyle(
                fontSize: size.width * 0.04,
                fontFamily: 'RobotoMono',
                fontStyle: FontStyle.italic),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "RECOMMENDATION",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CounterRecommendation(
                  recommendation: "BUY",
                  color: colorForBookRecmd,
                ),
                CounterRecommendation(
                  recommendation: "WAIT",
                  color: colorForWaitRecmd,
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}

class CounterRecommendation extends StatelessWidget {
  final String recommendation;
  final Color color;
  final IsSlected = false;

  const CounterRecommendation({
    Key? key,
    required this.recommendation,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      height: MediaQuery.of(context).size.width * 0.33,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFE0E0E0),
        boxShadow: [
          BoxShadow(offset: Offset(0, 4), blurRadius: 20),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            height: MediaQuery.of(context).size.width * 0.09,
            width: MediaQuery.of(context).size.width * 0.09,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.75),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.black12,
                  width: 3,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "$recommendation",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 33, color: color),
          ),
        ],
      ),
    );
  }
}
