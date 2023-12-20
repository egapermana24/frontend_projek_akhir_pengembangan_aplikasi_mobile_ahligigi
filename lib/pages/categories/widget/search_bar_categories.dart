import 'package:flutter/material.dart';
import '../../../aturan/constants/warna_apps.dart';

class SearchBar extends StatelessWidget {
  final Function(String)? onSearchSubmitted;

  const SearchBar({
    Key? key,
    this.onSearchSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 45, 24, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.search,
              color: AppColors.primaryColor,
            ),
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Cari..',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    color: Color(0xff95a6aa),
                  ),
                ),
                onSubmitted: (value) {
                  // agar mengirimkan inputan user untuk menampilkan data berita menggunakan class card_view_widget.dart
                  // onSearchSubmitted!(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
