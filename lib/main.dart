import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ifi_lms/screens/dashboard_screen.dart';
import 'package:ifi_lms/screens/profile_screen.dart';
import 'package:ifi_lms/screens/schedule_screen.dart';

import 'package:ifi_lms/util/md2_indicator.dart';
import 'package:ifi_lms/util/colors.dart';
import 'package:ifi_lms/util/custom_icons.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = "id";

    return MaterialApp(
      title: 'LMS IFI',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        backgroundColor: ColorsUtil.background,
        textTheme: TextTheme(
            labelMedium: TextStyle(
          color: ColorsUtil.font,
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
        )),
        inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: false,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: ColorsUtil.gray,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 23),
          hintStyle: TextStyle(
            color: ColorsUtil.font.withOpacity(.5),
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
          labelStyle: TextStyle(
            color: ColorsUtil.font,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: ColorsUtil.primary,
          primaryContainer: ColorsUtil.primaryContainer,
          inversePrimary: ColorsUtil.inversePrimary,
          secondary: ColorsUtil.secondary,
          tertiary: ColorsUtil.tertiary,
          error: Colors.red,
          surface: ColorsUtil.primary,
          background: ColorsUtil.background,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: ColorsUtil.font,
          onError: Colors.red,
        ),
      ),
      home: const HomeBottomNav(),
    );
  }
}

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({Key? key}) : super(key: key);

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav>
    with TickerProviderStateMixin {
  int _botnavIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _onBotnavTapped(int index) {
    setState(() {
      _botnavIndex = index;
    });
  }

  Widget _getNav() {
    switch (_botnavIndex) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const ProfileScreen();
      case 2:
        return ScheduleScreen(tabController: _tabController);
      case 3:
        return const Center(child: CircularProgressIndicator());
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _botnavIndex != 2
          ? null
          : AppBar(
              backgroundColor: const Color(0xFF4c5ebf),
              actions: [
                IconButton(
                  icon: const Icon(
                    CustomIcons.setting_schedule,
                  ),
                  onPressed: () {},
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const MD2Indicator(
                  indicatorHeight: 6,
                  indicatorColor: Colors.white,
                  indicatorSize: MD2IndicatorSize.full,
                ),
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: Colors.white.withOpacity(.5),
                tabs: const [
                  Tab(text: 'Bulan'),
                  Tab(text: 'Hari Ini'),
                ],
              ),
            ),
      body: _getNav(),
      floatingActionButton: _botnavIndex != 2
          ? null
          : FloatingActionButton(
              child: Container(
                width: 60,
                height: 60,
                child: Icon(
                  Icons.add,
                  size: 32,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5769C1),
                      Color(0xFFAAA3E2),
                    ],
                    begin: Alignment(-1, -1),
                    end: Alignment(1, 1),
                    tileMode: TileMode.mirror,
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 3,
                  //     spreadRadius: 1,
                  //     color: const Color(0xFF4F4E4E).withOpacity(.25),
                  //   ),
                  // ],
                ),
              ),
              onPressed: () {},
            ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorsUtil.gray,
          ),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFC4C4C4),
              spreadRadius: -4,
              blurRadius: 17,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _botnavIndex,
            onTap: _onBotnavTapped,
            iconSize: 22.0,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor:
                Theme.of(context).colorScheme.primary.withOpacity(.5),
            selectedLabelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 8,
            ),
            unselectedLabelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary.withOpacity(.5),
              fontSize: 8,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.calendar),
                label: 'Jadwal',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.message),
                label: 'Pesan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
