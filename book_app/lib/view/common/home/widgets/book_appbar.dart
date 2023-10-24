import 'package:book_app/view/common/home/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../style/style.dart';

class BookAppBar extends StatelessWidget {
  const BookAppBar({
    super.key,
    required this.size,
  });
  // ignore: prefer_typing_uninitialized_variables
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(4),
              child: Image(
                width: 40,
                image: AssetImage('assets/owl.png'),
              ),
            ),
            Text(
              'OWL Library',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorPalette.textColor,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => userInfoModal(context, size),
            child: const Icon(
              Remix.information_line,
              size: 30,
              color: ColorPalette.greyText,
            ),
          ),
        ),
      ],
    );
  }
}
