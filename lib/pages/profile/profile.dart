import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:ahli_gigi/pages/profile/components/info_akun.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
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
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.antiAlias,
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
          // -------INFO AKUN-------
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoAkun()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(
                              right: 8), // Jarak antara ikon dan teks
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 199, 199, 199),
                          ),
                          child: Icon(
                            Icons.account_circle,
                            size: 20,
                          ),
                        ),
                      ),
                      Text('Info Akun'),
                      Spacer(), // Spacer untuk memberikan jarak ke kanan
                      Icon(Icons.arrow_right),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // -------ALAMAT-------
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Dashboard()),
                // );
              },
              child: Container(
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(
                              right: 8), // Jarak antara ikon dan teks
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 199, 199, 199),
                          ),
                          child: Icon(
                            Icons.location_pin,
                            size: 20,
                          ),
                        ),
                      ),
                      Text('Alamat'),
                      Spacer(), // Spacer untuk memberikan jarak ke kanan
                      Icon(Icons.arrow_right),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
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

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}
