import 'package:ahli_gigi/aturan/constants/warna_apps.dart';
import 'package:ahli_gigi/pages/categories/categories.dart';
import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:ahli_gigi/pages/navbar/widget/bottom_icon_widget.dart';
import 'package:ahli_gigi/resource/resource.gen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int initialPageIndex;
  const NavBar({Key? key, required this.initialPageIndex}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // int _selectedIndex = 0;
  late int pageIndex;
  late int initialPageIndex;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    initialPageIndex = widget.initialPageIndex;
    pageIndex = initialPageIndex;
    // Inisialisasi pages di dalam initState
    pages = [
      const Dashboard(),
      const Categories(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[pageIndex],
      ),
      bottomNavigationBar: Container(
        height: 60,
        // BUAT AGAR POJOK KANAN ATAS DAN POJOK KIRI ATAS MENJADI RONDED
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomIconWidget(
              title: 'Home',
              titleColor: pageIndex == 0
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              iconName: pageIndex == 0
                  ? Assets.icons.icSelectedHome.path
                  : Assets.icons.icUnselectedHome.path,
              iconColor: pageIndex == 0
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              pageIndex: 0,
              tap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
            ),
            BottomIconWidget(
              title: 'Kategori',
              titleColor: pageIndex == 1
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              iconName: pageIndex == 1
                  ? Assets.icons.icSelectedUser.path
                  : Assets.icons.icUnselectedUser.path,
              iconColor: pageIndex == 1
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              pageIndex: 1,
              tap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
