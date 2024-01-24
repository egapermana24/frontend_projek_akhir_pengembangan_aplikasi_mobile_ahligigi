import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String imagePath;

  ServiceCard(this.serviceName, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 100,
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Flexible(
            child: Text(
              serviceName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
