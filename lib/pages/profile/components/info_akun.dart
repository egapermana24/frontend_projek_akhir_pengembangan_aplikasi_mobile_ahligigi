import 'package:flutter/material.dart';

class InfoAkun extends StatefulWidget {
  const InfoAkun({Key? key}) : super(key: key);

  @override
  State<InfoAkun> createState() => _InfoAkunState();
}

class _InfoAkunState extends State<InfoAkun> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Akun'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {
                  // Toggling the tapped state to show/hide the fullscreen image
                  setState(() {
                    isTapped = !isTapped;
                  });

                  if (isTapped) {
                    // If tapped, show the fullscreen image
                    _showFullscreenImage(context);
                  }
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip
                      .antiAlias, // Mengaktifkan anti-aliasing untuk sudut yang rounded
                  child: Image.asset(
                    'assets/icons/image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Nama :'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 162, 226, 255)),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text('Ega Permata'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Email :'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 162, 226, 255)),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text('egapermata677@gmail.com'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('No. Telepon :'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 162, 226, 255)),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text('+62 857-9491-2280'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Jenis Kelamin'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 162, 226, 255)),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text('Laki - laki'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to show fullscreen image
  void _showFullscreenImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 300,
            width: 300,
            child: Image.asset(
              'assets/icons/image.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InfoAkun(),
  ));
}
