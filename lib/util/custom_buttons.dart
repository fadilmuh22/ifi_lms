import 'package:flutter/material.dart';
import 'package:ifi_lms/util/colors.dart';

ElevatedButton cancelButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: ColorsUtil.gray,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: ColorsUtil.font,
      ),
    ),
    child: Text(
      'Cancel',
      style: TextStyle(
        color: ColorsUtil.font,
      ),
    ),
  );
}

ElevatedButton submitButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    ),
    child: const Text('Submit'),
  );
}
