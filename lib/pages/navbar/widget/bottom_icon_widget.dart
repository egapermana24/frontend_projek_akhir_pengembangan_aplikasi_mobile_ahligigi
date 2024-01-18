import 'package:flutter/material.dart';
import 'package:ahli_gigi/aturan/constants/warna_apps.dart';

class BottomIconWidget extends StatelessWidget {
  const BottomIconWidget({
    Key? key,
    required this.title,
    this.titleColor,
    required this.iconName,
    this.iconColor,
    this.tap,
    required this.pageIndex,
  }) : super(key: key);

  final String title;
  final Color? titleColor;
  final String iconName;
  final Color? iconColor;
  final Function()? tap;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return pageIndex == 2 ? _buildFloatingButton() : _buildNormalButton();
  }

  Widget _buildFloatingButton() {
    return Container(
      // bottom: 20,
      child: ClipOval(
        child: Material(
          elevation: 10.0, // Sesuaikan dengan kebutuhan Anda
          color: AppColors.primaryColor,
          shadowColor:
              Colors.black, // Sesuaikan dengan warna bayangan yang diinginkan
          child: InkWell(
            onTap: tap,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/icons/ic_selected_achive.png',
                width: 30,
                height: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNormalButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: tap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                iconName,
                width: 16,
                height: 16,
                color: iconColor,
              ),
            ),
            SizedBox(width: 1),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
