import 'package:flutter/material.dart';
import 'package:ifi_lms/util/colors.dart';
import 'package:ifi_lms/util/custom_icons.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({Key? key}) : super(key: key);

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen>
    with SingleTickerProviderStateMixin {
  late FocusNode _searchFieldFocus;
  late TabController _tabController;

  @override
  void initState() {
    _searchFieldFocus = FocusNode();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                constraints: const BoxConstraints(),
                icon: Icon(
                  CustomIcons.setting_schedule,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 124,
                child: TextFormField(
                  focusNode: _searchFieldFocus,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    fillColor: Colors.white,
                    prefixIconConstraints: const BoxConstraints(),
                    prefixIcon: _searchFieldFocus.hasPrimaryFocus
                        ? null
                        : const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.search,
                              size: 12,
                            ),
                          ),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xFFD9DCE3),
                      width: 1,
                    )),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              Container(
                height: 34,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(.5),
                  tabs: const [
                    Tab(
                      text: 'Kelas',
                    ),
                    Tab(
                      text: 'Batch',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _getTabViews(_tabController.index),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getTabViews(int index) {
    switch (index) {
      case 0:
        return Column(
          children: [
            _classListCard(context),
            _classListCard(context),
            _classListCard(context),
          ],
        );
      case 1:
        return Column(
          children: [
            const Text('Batchs'),
            _classListCard(context),
            _classListCard(context),
            _classListCard(context),
          ],
        );
      default:
        return Container();
    }
  }

  Container _classListCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 23),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.menu_book_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          'Lab Sewing',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                      Text(
                        'Praktek jahit',
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
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 14,
              bottom: 19,
            ),
            child: const Divider(
              height: 1,
              thickness: 2,
              color: Color(0xFFD9DCE3),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available',
                style: TextStyle(
                  color: ColorsUtil.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal Dibuat',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '2022-01-22 02:52:09',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '2022-01-22 02:52:09',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
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
}
