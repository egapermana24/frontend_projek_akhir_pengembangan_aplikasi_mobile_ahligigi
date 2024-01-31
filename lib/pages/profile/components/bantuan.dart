import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class BantuanPage extends StatefulWidget {
  const BantuanPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _BantuanPageState createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = GlobalKey();

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
          widget.title ?? 'Bantuan',
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
                'FAQ (Pertanyaan yang Sering Diajukan)',
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
                      """* Bagaimana cara membuat janji temu dengan Ahli Gigi?

Untuk membuat janji temu, buka aplikasi dan masuk ke bagian "Layanan".  Pilih waktu yang sesuai, lalu pilih metode pembayaran yang diinginkan.""",
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
                'Panduan Penggunaan Aplikasi',
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
                      """* Navigasi Dasar

Aplikasi kami memiliki menu navigasi di bagian bawah layar. Gunakan menu tersebut untuk mengakses fitur-fitur utama yaitu, Layanan, Kategori, Home, Riwayat dan Profil.""",
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
                'Cara Menghubungi Dukungan Pelanggan',
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
                      """* Melalui Email atau Telepon

Anda juga dapat menghubungi dukungan pelanggan melalui email di permanaega677@gmail.com atau melalui telepon di nomor 085794912280.""",
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
                'Kebijakan Privasi dan Syarat Penggunaan',
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
                      """* Kebijakan Privasi

Baca kebijakan privasi kami di www.acenkdental.com/privasi untuk memahami bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda.


* Syarat Penggunaan

Syarat dan ketentuan penggunaan aplikasi kami dapat ditemukan di www.acenkdental.com/syarat-dan-ketentuan. Harap baca dengan seksama sebelum menggunakan layanan kami.""",
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
