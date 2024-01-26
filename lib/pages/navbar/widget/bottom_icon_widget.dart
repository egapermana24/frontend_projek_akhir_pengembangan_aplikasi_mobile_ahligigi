import 'package:flutter/material.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';

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
    return pageIndex == 0 ? _buildFloatingButton() : _buildNormalButton();
  }

  Widget _buildFloatingButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white, // Warna border putih
          width: 1, // Lebar border
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          elevation: 10.0,
          color: AppColors.primaryColor,
          shadowColor: Colors.black,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: tap,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/icons/ic_selected_home.png',
                width: 25,
                height: 25,
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
