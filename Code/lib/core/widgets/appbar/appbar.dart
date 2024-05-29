import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
class AppToolbar extends StatelessWidget implements PreferredSizeWidget {
  final Function? navigationButtonPress;
  final bool navigateBack;
  final bool appLogo;
  final String appLogoType;
  final dynamic title;
  final bool rightIcon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final String? openedUsing;

  AppToolbar({
    Key? key,
    this.navigationButtonPress,
    this.navigateBack = false,
    this.title,
    this.appLogoType = 'svg',
    this.appLogo = true,
    this.rightIcon = false,
    this.backgroundColor = Colors.white,
    this.onPressed,
    this.openedUsing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text('hello '),
        ),

      ]
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(this.appLogo == true && this.title != ''
          ? kToolbarHeight + 72
          : kToolbarHeight);
}
