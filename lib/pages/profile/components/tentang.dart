import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class Tentang extends StatefulWidget {
  const Tentang({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _TentangState createState() => _TentangState();
}

class _TentangState extends State<Tentang> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Text(
          widget.title ?? 'Tentang',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardA,
              expandedTextColor: AppColors.primaryColor,
              title: const Text(
                'Tentang Kami',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Ahli Gigi adalah aplikasi yang didedikasikan untuk memudahkan Anda dalam mencari dan memesan layanan gigi yang berkualitas. Kami menyediakan akses yang mudah, terpercaya, dan layanan kesehatan gigi yang berkualitas.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardB,
              expandedTextColor: AppColors.primaryColor,
              title: const Text(
                'Riwayat Perusahaan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Ahli Gigi Acenk didirikan pada tahun 2018 dengan tujuan meningkatkan kualitas pelayanan kesehatan gigi. Sejak itu, kami telah tumbuh menjadi salah satu platform terkemuka dalam industri kesehatan gigi, melayani ribuan pasien setiap tahunnya.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardC,
              expandedTextColor: AppColors.primaryColor,
              title: const Text(
                'Info Kontak',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Alamat: Jl. Ampera Raya No.17, Pekiringan, Kesambi, Kota Cirebon, Jawa Barat

Email: info@acenkdental.com

Telepon: 0800-123-4567""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardD,
              expandedTextColor: AppColors.primaryColor,
              title: const Text(
                'Tim Pengembang',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Kami adalah mahasiswa dan mahasiswi Semester 5 dari Kampus Universitas Catur Insan Cendekia Kota Cirebon yang memiliki tugas projek dalam pembuatan dan pengembangan aplikasi mobile menggunakan Flutter untuk Penerapan Sistem Booking Ahli Gigi sebagai salah satu syarat dan memperoleh nilai akhir mata kuliah Pengembangan Aplikasi Mobile. Dengan menggunakan teknologi Flutter, kami bertujuan untuk menciptakan solusi yang inovatif dan efektif untuk memenuhi kebutuhan dalam bidang pelayanan kesehatan gigi.

Anggota :
- 20210120068 - Ega Permana
- 20210120059 - Fia Hamasyatus Syahadah
- 20210120071 - Royfansyah M Razavi

Dosen Pengampu :
Muhammad Hatta, M.Kom.""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardE,
              expandedTextColor: AppColors.primaryColor,
              title: const Text(
                'Versi Aplikasi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Versi Aplikasi : 1.2.2

Terakhir Diperbarui : 4 Februari 2024""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
