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
    return InkWell(
      // behavior: HitTestBehavior.translucent,
      onTap: tap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white, // Warna border putih
            width: 0.8, // Lebar border
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/icons/ic_selected_home2.png',
                width: 20,
                height: 20,
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
                width: 18,
                height: 18,
                color: const Color.fromARGB(255, 99, 99, 99),
              ),
            ),
            SizedBox(width: 1),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 108, 108, 108),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
