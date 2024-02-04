import 'package:auto_ch_tech_assesment/core/theme/app_colors.dart';
import 'package:auto_ch_tech_assesment/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.showIcon = true,
    required this.leadingIcon,
  }) : super(key: key);

  final String title;
  final bool showIcon;
  final IconButton leadingIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              leadingIcon,
              SizedBox(width: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      fontFamily: 'Avenir'),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.pushNamed(context, '/wishlist');
                },
                icon: Icon(showIcon ? Icons.local_mall_rounded : null)),
          )
        ]),
      ),
    );
  }

  @override
  // this is the size of the appbar
  Size get preferredSize => const Size.fromHeight(40.0);
}
