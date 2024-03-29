import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function() onPressedAddButton;

  const CustomAppBar({
    Key? key,
    required this.onPressedAddButton,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            widget.onPressedAddButton();
          },
        ),
      ],
    );
  }
}
