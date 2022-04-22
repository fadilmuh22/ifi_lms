import 'package:flutter/material.dart';
import 'package:ifi_lms/util/colors.dart';
import 'package:ifi_lms/util/custom_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _radioValue1 = -1;

  bool _passwordVisible = false;
  late final _passwordController = TextEditingController();

  void _handleRadioValueChange1(int? value) {
    setState(() {
      _radioValue1 = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 142,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_header.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: ColorsUtil.gray.withOpacity(.5),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              child: const Icon(
                                Icons.arrow_back_outlined,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: -42,
              child: Column(
                children: const [
                  SizedBox(
                    width: 84,
                    height: 84,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 54),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Admin IFI',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'admin@admin.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.5),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 78,
              height: 24,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Edit'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5),
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
        const SizedBox(height: 36),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nama',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'E-mail',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'admin@admin.com',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      controller: _passwordController,
                      obscureText:
                          !_passwordVisible, //This will obscure text dynamically
                      decoration: InputDecoration(
                        hintText: '********',
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Default Role',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsUtil.gray,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        focusColor: ColorsUtil.gray,
                        hint: Text(
                          'Roles',
                          style: TextStyle(
                            color: ColorsUtil.font.withOpacity(.5),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        items: <String>['A', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 3 - 24,
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tempat Lahir',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 4),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Bandung',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 3 - 24,
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 4),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '1/1/1970',
                            suffixIcon: IconButton(
                              icon: Icon(
                                CustomIcons.calendar,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Gender',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: _radioValue1,
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: _handleRadioValueChange1,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Laki-Laki',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                    activeColor: Theme.of(context).colorScheme.primary,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Perempuan',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nomor Identitas',
                    style: TextStyle(
                      color: ColorsUtil.font.withOpacity(.5),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nomor Kependudukan',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 4),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: '320xxxxxxxxx',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NPWP',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 4),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: '120xxxxxxxxx',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        uploadFileBottomSheet(context);
                      },
                      child: Text(
                        'Unggah File Identitas',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  submitButton(context),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}

dynamic uploadFileBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isDismissible: false,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
          child: Column(
            children: [
              const SizedBox(height: 42),
              Text(
                'Upload File',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 32),
              _uploadFileCard(context),
              _uploadFileCard(context),
              _uploadFileCard(context),
              const SizedBox(height: 42),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  cancelButton(context),
                  const SizedBox(width: 12),
                  submitButton(context),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

ElevatedButton cancelButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: Text(
      'Cancel',
      style: TextStyle(
        color: ColorsUtil.font,
      ),
    ),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      primary: ColorsUtil.gray,
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: ColorsUtil.font,
      ),
    ),
  );
}

ElevatedButton submitButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {},
    child: const Text('Submit'),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      primary: Theme.of(context).colorScheme.primary,
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    ),
  );
}

Widget _uploadFileCard(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Admin IFI',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF777777).withOpacity(.25),
                offset: const Offset(0, 1),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.photo,
                      size: 24,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Photo',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.upload_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
