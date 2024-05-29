import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/widgets/drawer/drawer.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class PrimaryLayout extends StatelessWidget {
  final Widget child;

  const PrimaryLayout({super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.home);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SvgWidget(
                path: Assets.EduAppLogo,
                label: Assets.EduAppLogo,
                percentage: 0.07,
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                'eduBlock',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 2.0),
              )
            ],
          ),
        ),
        actions: [_buildActionButton(context)],
        iconTheme: const IconThemeData(color: Color(0xFFFAFBFB)),
      ),
      drawer: AppDrawer(),
      body: child,
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          // Search action button
          /*IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            },
          ),*/
          // Notification action button
          /*Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Add your notification action logic here
                },
              ),
              Positioned(
                top: 2.0,
                right: 6.0,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondaryContainer, // Badge color
                  ),
                  child: Text(
                    '2', // You can replace this with your actual notification count
                      style: Theme.of(context)
                          .textTheme.labelSmall
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 2.0
                      )
                  ),
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
