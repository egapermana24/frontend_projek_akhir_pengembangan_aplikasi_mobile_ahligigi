import 'package:ahli_gigi/pages/DetailsPage/widget/details_page_widget.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Janji Temu', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: DetailsPageWidget(
        'assets/icons/google.png',
        'Tambal Gigi',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In fringilla ex at leo hendrerit, id condimentum arcu pharetra.',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In fringilla ex at leo hendrerit, id condimentum arcu pharetra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In fringilla ex at leo hendrerit, id condimentum arcu pharetraLorem ipsum dolor sit amet, consectetur adipiscing elit. In fringilla ex at leo hendrerit, id condimentum arcu pharetra',
      ),
    );
  }
}
