import 'package:flutter/material.dart';
import 'package:ifi_lms/util/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _notifButton(context),
          ],
        ),
        _userCard(context),
        const SizedBox(
          height: 36,
        ),
        _jadwalPembelajaranCard(context),
        const SizedBox(height: 12),
        _checkinCard(context),
        const SizedBox(height: 22),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Menu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 22),
            _crudMenuListTile(context, Icons.person, 'Pengguna', '123 Aktif'),
            _crudMenuListTile(
                context, Icons.class__outlined, 'Kelas', '12 Terdaftar'),
            _crudMenuListTile(
                context, Icons.book_outlined, 'Pengguna', '3 Kategori'),
          ],
        ),
        const SizedBox(height: 48),
      ],
    );
  }

  Container _crudMenuListTile(
      BuildContext context, IconData iconTile, String title, String stats) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 23),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: ColorsUtil.gray,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF373F66).withOpacity(.5),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorsUtil.gray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  iconTile,
                  size: 20,
                ),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  Text(
                    stats,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.71),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 40,
            height: 20,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Lihat'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                primary: Theme.of(context).colorScheme.primary,
                textStyle: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(.5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _notifButton(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: ElevatedButton(
        onPressed: () {},
        child: Icon(
          Icons.notifications_outlined,
          color: Theme.of(context).colorScheme.onBackground,
          size: 24,
        ),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(6),
          primary: Theme.of(context).colorScheme.background,
          onPrimary: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  ListTile _userCard(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 20,
      leading: const SizedBox(
        width: 60,
        height: 60,
        child: CircleAvatar(),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text(
          'Admin IFI',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      subtitle: Text(
        'Admin',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.71),
        ),
      ),
    );
  }

  Container _checkinCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F1E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Check in',
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(.86),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Row(
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    size: 8,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '07:12:25',
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.5),
                  ),
                  Container(
                    width: 80,
                    height: 32,
                    color: Colors.transparent,
                    child: Stack(
                      children: const <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 14,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 14,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _jadwalPembelajaranCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 21),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF323E99),
            Color(0xFF5762AC),
          ],
          begin: Alignment(-1, 0),
          end: Alignment(1, 0),
          tileMode: TileMode.mirror,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF373F66).withOpacity(.5),
            blurRadius: 11,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 220,
            child: Text(
              'Jadwal Pembelajaran',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 220,
            child: Text(
              'Untuk mengakomodasi aktivitas belajar maka pembentukan jadwal pelajaran sangatlah penting.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(.5),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 32,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Periksa',
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 9,
                  horizontal: 29,
                ),
                primary: Theme.of(context).colorScheme.tertiary,
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
