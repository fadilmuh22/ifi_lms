import 'package:flutter/material.dart';

class KehadiranScreen extends StatefulWidget {
  KehadiranScreen({Key? key}) : super(key: key);

  @override
  State<KehadiranScreen> createState() => _KehadiranScreenState();
}

class _KehadiranScreenState extends State<KehadiranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView(
        children: [
          const SizedBox(height: 9),
          Text(
            'Kehadiran',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              height: 39,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 26,
                ),
                decoration: const BoxDecoration(
                  color: Color(0x00283A97),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: RichText(
                  text: TextSpan(
                    text: '14 April 2022 - ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const [
                      TextSpan(
                        text: '10:50:12',
                        style: TextStyle(
                          color: Color(0x007fca47),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 26,
                ),
                decoration: const BoxDecoration(
                  color: Color(0x00283A97),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
