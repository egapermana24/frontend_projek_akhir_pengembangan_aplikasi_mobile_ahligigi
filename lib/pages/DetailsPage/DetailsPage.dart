import 'package:ahli_gigi/pages/DetailsPage/widget/details_page_widget.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String imagePath;
  final String layanan;
  final String details;
  final String penjelasan;

  const DetailsPage({
    Key? key,
    required this.imagePath,
    required this.layanan,
    required this.details,
    required this.penjelasan,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Janji Temu', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: DetailsPageWidget(
        imagePath: 'assets/icons/google.png',
        layanan: 'Tambal Gigi',
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In fringilla ex at leo hendrerit, id condimentum arcu pharetra.',
        penjelasan:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In fringilla ex at leo hendrerit, id condimentum arcu pharetra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In fringilla ex at leo hendrerit, id condimentum arcu pharetraLorem ipsum dolor sit amet, consectetur adipiscing elit. In fringilla ex at leo hendrerit, id condimentum arcu pharetra',
      ),
    );
  }
}
