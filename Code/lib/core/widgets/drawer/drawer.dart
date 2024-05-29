import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/profile_store/profile_store.dart';
import 'package:edublock/core/stores/profile_store/profile_store.dart';
import 'package:edublock/core/widgets/modal_boxes/logout_modal_box/logout_modal_box.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppDrawer extends StatelessWidget {
  // final UserDetailsStore _userDetailsStore = getIt.get<UserDetailsStore>();
  // final UserStore _userStore = getIt.get<UserStore>();

  // AppDrawer({Key? key});
  final UserStore _userStore = getIt<UserStore>();
  final ProfileStore _profileStore  = getIt<ProfileStore>();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> navBarList = [
      {
        'icon': Assets.person,
        'title': 'Profile',
        'subTitle': 'See your complete profile',
        'callBack': () {
          Navigator.of(context).pushNamed(Routes.profileScreen);
        }
      },
      {
        'icon': Assets.request,
        'title': 'Requests',
        'subTitle': 'Employers , Institutional & Student',
        'callBack': () {
          Navigator.of(context).pushNamed(Routes.cretificateRequestScreen);
        }
      },
      {
        'icon': Assets.certificate,
        'title': 'Certificates',
        'subTitle': 'edit, view, delete certificates on the go',
        'callBack': () {
          Navigator.of(context).pushNamed(Routes.allCertificateScreen);
        }
      },
      {
        'icon': Assets.envelopes,
        'title': 'Envelopes',
        'subTitle': 'Create, edit, view envelopes on the go',
        'callBack': () {
          Navigator.of(context).pushNamed(Routes.allEnvelopesScreen);
        }
      },
      /*{
        'icon':Assets.request,
        'title':'Purchase Coins',
        'subTitle':'View, share certificates—buy coins',
        'callBack':(){
          Navigator.of(context).pushNamed(Routes.cretificateRequestScreen);
        }
      },
      {
        'icon':Assets.request,
        'title':'Change Password',
        'subTitle':'Change password for your account',
        'callBack':(){
          Navigator.of(context).pushNamed(Routes.changePasswordScreen);
        }
      },*/
      {
        'icon': Assets.logout,
        'title': 'Logout',
        'subTitle': 'Logout from system',
        'callBack': () {
          showAlertLogoutDialog(context,
              'You are attempting to log out from this device', 'Logout', () {
            _logout();
            if (!_userStore.isLoggedIn) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.login, (Route<dynamic> route) => false);
            }
          });
        }
      },
      {
        'icon': Assets.supports,
        'title': 'Support',
        'subTitle': 'eduBlock@gmail.com',
        'secSubTitle': '+91 8654 765 765',
        'callBack': () {
          // Navigator.of(context).pushNamed(Routes.cretificateRequestScreen);
        }
      },
    ];

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 140.0,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(
                              builder: (context) {
                                if (_userStore?.currentUser != null) {
                                  return Text(
                                    'Hi, ${_userStore.currentUser!.existingUser.name}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                            ),
                            textAlign: TextAlign.start,
                          );
                        } else {
                          // Handle the case when _userStore or currentUser is null
                          return Text(
                            'Hi, George',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                            ),
                            textAlign: TextAlign.start,
                          );
                        }
                      },
                    ),
                    /*Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgWidget(
                          path: Assets.language,
                          label: Assets.language,
                          percentage: 0.09,
                        ),
                        SizedBox(width: 8.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Language Preference',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor,
                                  height: 1.5,
                                  letterSpacing: 0.5
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(width: 16.0,),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),

                      ],
                    ),
                  )*/
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.separated(
                itemCount: navBarList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return _buildListitle(
                      context,
                      navBarList[index]['callBack'],
                      navBarList[index]['icon'],
                      navBarList[index]['title'],
                      navBarList[index]['subTitle'],
                      navBarList[index]['secSubTitle']);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0.5,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListitle(BuildContext context, VoidCallback callback,
      String icon, String title, String subTitle, String? secSubTitle) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 8.0, top: 0, bottom: 0),
      onTap: callback,
      leading: SvgWidget(
        path: icon,
        label: icon,
        percentage: 0.09,
      ),

      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subTitle,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onInverseSurface,
                fontWeight: FontWeight.w500),
          ),
          if (secSubTitle != null)
            Text(
              secSubTitle!,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          // Text(
          //   date,
          //   style: Theme.of(context).textTheme.labelMedium?.copyWith(
          //     color: Theme.of(context).colorScheme.onPrimary,
          //   ),
          // )
        ],
      ),
      // trailing: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     GestureDetector(
      //       onTap: callback,
      //       child: Icon(
      //         Icons.keyboard_arrow_right,
      //         color: Theme.of(context).colorScheme.primaryContainer,
      //         size: 24,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Future<void> _logout() async {
    _userStore.logout();
  }
}
