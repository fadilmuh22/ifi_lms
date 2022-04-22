import 'package:flutter/material.dart';
import 'package:ifi_lms/util/colors.dart';

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
