import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:ahli_gigi/pages/categories/categories.dart';
import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:ahli_gigi/pages/history/historyPage.dart';
import 'package:ahli_gigi/pages/layanan/layananPage.dart';
import 'package:ahli_gigi/pages/navbar/widget/bottom_icon_widget.dart';
import 'package:ahli_gigi/pages/profile/profile.dart';
import 'package:ahli_gigi/resource/resource.gen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int initialPageIndex;
  const NavBar({Key? key, required this.initialPageIndex})
      : super(key: key);

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
      Dashboard(
      ),
      const Categories(),
      const Profile(),
      const Layanan(),
      const Riwayat(),
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
              title: 'Layanan',
              titleColor: pageIndex == 3
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              iconName: pageIndex == 3
                  ? Assets.icons.icSelectedLayanan.path
                  : Assets.icons.icUnselectedLayanan.path,
              iconColor: pageIndex == 3
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              pageIndex: 3,
              tap: () {
                setState(() {
                  pageIndex = 3;
                });
              },
            ),
            BottomIconWidget(
              title: 'Kategori',
              titleColor: pageIndex == 1
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              iconName: pageIndex == 1
                  ? Assets.icons.icSelectedCategory.path
                  : Assets.icons.icUnselectedCategory.path,
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
            BottomIconWidget(
              title: 'Riwayat',
              titleColor: pageIndex == 4
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              iconName: pageIndex == 4
                  ? Assets.icons.icSelectedHistory.path
                  : Assets.icons.icUnselectedHistory.path,
              iconColor: pageIndex == 4
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              pageIndex: 4,
              tap: () {
                setState(() {
                  pageIndex = 4;
                });
              },
            ),
            BottomIconWidget(
              title: 'Profil',
              titleColor: pageIndex == 2
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              iconName: pageIndex == 2
                  ? Assets.icons.icSelectedUser.path
                  : Assets.icons.icUnselectedUser.path,
              iconColor: pageIndex == 2
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              pageIndex: 2,
              tap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
