import 'package:flutter/material.dart';

class DetailsPageWidget extends StatelessWidget {
  final String imagePath;
  final String layanan;
  final String details;
  final String penjelasan;
  final String isipenjelasan;

  DetailsPageWidget(
    this.imagePath,
    this.layanan,
    this.details,
    this.penjelasan,
    this.isipenjelasan,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 210,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(7)),
                  child: Image.asset('assets/icons/google.png'),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        layanan,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        details,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.phone),
                              SizedBox(height: 8.0),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.video_call),
                              SizedBox(height: 8.0),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.mail),
                              SizedBox(height: 8.0),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
