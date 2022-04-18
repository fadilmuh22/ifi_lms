import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ifi_lms/screens/dashboard_screen.dart';
import 'package:ifi_lms/screens/profile_screen.dart';
import 'package:ifi_lms/screens/schedule_screen.dart';
import 'package:ifi_lms/util/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          primaryContainer: ColorsUtil.primaryVariant,
          secondary: ColorsUtil.secondary,
          tertiary: ColorsUtil.tertiary,
          error: Colors.red,
          surface: ColorsUtil.primary,
          background: ColorsUtil.background,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
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

class _HomeBottomNavState extends State<HomeBottomNav> {
  int _botnavIndex = 0;

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
        return const ScheduleScreen();
      case 3:
        return const ScheduleScreen();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getNav(),
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
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                label: 'Jadwal',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.messenger_outline_rounded),
                label: 'Pesan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
