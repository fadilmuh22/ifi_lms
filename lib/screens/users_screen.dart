import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ifi_lms/util/colors.dart';
import 'package:ifi_lms/util/custom_icons.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final FocusNode _searchFieldFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 52),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Icon(
                                  CustomIcons.person,
                                  color: ColorsUtil.primary,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pengguna',
                                style: TextStyle(
                                  color: ColorsUtil.primary,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '123 Terdaftar',
                                style: TextStyle(
                                  color: ColorsUtil.font.withOpacity(.5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.add,
                            size: 24,
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 84,
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsUtil.background,
                          border: Border.all(
                            color: const Color(0xFFD9DCE3),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: DropdownButton<String>(
                          isDense: true,
                          isExpanded: true,
                          focusColor: ColorsUtil.gray,
                          underline: Container(),
                          hint: Text(
                            'Dosen',
                            style: TextStyle(
                              color: ColorsUtil.font,
                              fontSize: 12,
                            ),
                          ),
                          items: <String>['Mahasiswa', 'Admin']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: ColorsUtil.font.withOpacity(.5),
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                      SizedBox(
                        width: 124,
                        child: TextFormField(
                          focusNode: _searchFieldFocus,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                ],
              ),
            ),
            const SizedBox(height: 32),
            _usersListTile(context, true),
            _usersListTile(context, true),
          ],
        ),
      ),
    );
  }

  Widget _usersListTile(BuildContext context, bool active) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFD9DCE3).withOpacity(.5),
      ),
      child: Slidable(
        key: const ValueKey(0),
        closeOnScroll: true,
        endActionPane: ActionPane(
          extentRatio: .15,
          dragDismissible: false,
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.red,
              icon: CustomIcons.trash,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(4),
            splashColor: ColorsUtil.font.withOpacity(.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              'Aher',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ),
                          Text(
                            'Aher@gmail.com',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.more_vert,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
