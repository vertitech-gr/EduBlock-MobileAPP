import 'package:another_flushbar/flushbar_helper.dart';
import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/stores/profile_store/profile_store.dart';
import 'package:edublock/core/widgets/custum_drop_down_menu/custum_drop_down_menu.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/rounded_button_widget.dart';
import 'package:edublock/core/widgets/textfield_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/country/country.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userGraduateYearController = TextEditingController();
  TextEditingController _userCountryController = TextEditingController();
  TextEditingController _userBaseProfileController = TextEditingController();

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final ProfileStore _profileStore = getIt<ProfileStore>();
  final UserStore _userStore = getIt<UserStore>();
  final CreateEnvelopesStore _createEnvelopesStore =
      getIt<CreateEnvelopesStore>();

  //focus node:---------------------------------------------- -------------------
  late FocusNode _userNameFocusNode;
  late FocusNode _userEmailFocusNode;
  late FocusNode _userGraduateYearFocusNode;
  late FocusNode _userCountryFocusNode;
  late FocusNode _userBaseProfileFocusNode;

  @override
  void initState() {
    super.initState();
    _userNameFocusNode = FocusNode();
    _userEmailFocusNode = FocusNode();
    _userGraduateYearFocusNode = FocusNode();
    _userCountryFocusNode = FocusNode();
    _userBaseProfileFocusNode = FocusNode();
    fetchData();
  }

  void fetchData() async {
    try {
      _profileStore.getProfileDetails("").then((value)  {
        print(
            'check profile details  are here ${_profileStore.currentUser}');

        _userNameController.text = _profileStore.currentUser!.existingUser.name;
        _userEmailController.text = _profileStore.currentUser!.existingUser.email;

      });

       } catch (error) {
      print('check profile details   here $error');
      // Handle errors
    }
  }











  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          _buildRightSide(context),

          Observer(
            builder: (context) {
              return Visibility(
                visible: _profileStore.isProfileDetails,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildRightSide(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // AppIconWidget(image: 'assets/icons/ic_appicon.png'),
              _buildHeadingText(),
              SizedBox(height: 24.0),
              _buildUserNameField(),
              SizedBox(height: 12.0),
              _buildUserEmailField(),
              // SizedBox(height: 12.0),
              // _buildUserBaseProfileField(),
              SizedBox(height: 12.0),
              _buildSelectCountry(),
              SizedBox(height: 12.0),

              // _buildUserGraduateYearField(),
            ],
          ),
        ),
      )
    ]);
  }

  Widget _buildSelectCountry() {
    return Observer(builder: (context) {
      return CustomDropdownMenu<Country>(
        dropdownColor: Theme.of(context).colorScheme.primaryContainer,
        options: _profileStore.countries,
        getLabel: (Country item) => item.country,
        onChanged: (Country? item) {
          _profileStore.setCountry(item!);
        },
        title: "Country/Region",
        value: _profileStore.countries.firstWhere(
          (country) => country.country == _profileStore.selectedCountry.country,
        ),
      );
    });
  }

  Widget _buildHeadingText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text('Profile',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                    )),
          ),
          Stack(
            children: [
              CircleAvatar(
                radius: 80.0,
                child: Image.asset(Assets.ProfileImage,        fit: BoxFit.cover,
                )),
              // Positioned(
              //     right: 0,
              //     bottom: 16.0,
              //     child: GestureDetector(
              //         onTap: () {},
              //         child: Icon(
              //           Icons.camera_alt,
              //           size: 32,
              //         )))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUserEmailField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          readOnly:true,
          isLabelColor: true,

          fontSize: 16,
          labelTextColor: Theme.of(context).primaryColor,

          textColor: Theme.of(context).colorScheme.primary,
          focusBorderColor: Theme.of(context).colorScheme.onPrimaryContainer,
          enableBorderColor: Theme.of(context).colorScheme.onPrimaryContainer,
          hintColor: Theme.of(context).colorScheme.onPrimaryContainer,
          // hint: AppLocalizations.of(context).translate('profile_dummy_email'),
          hint: 'student@gmail.com',
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_userGraduateYearFocusNode);
          },
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: 'Email',
        );
      },
    );
  }

  Widget _buildUserNameField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          readOnly: true,
          isLabelColor: true,

          fontSize: 16,
          textColor: Theme.of(context).colorScheme.primary,
          labelTextColor: Theme.of(context).primaryColor,
          focusBorderColor: Theme.of(context).colorScheme.onPrimaryContainer,
          enableBorderColor: Theme.of(context).colorScheme.onPrimaryContainer,
          hintColor: Theme.of(context).colorScheme.onPrimaryContainer,
          // hint: AppLocalizations.of(context).translate('profile_dummy_name'),
          hint: 'George',
          inputType: TextInputType.text,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userNameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setUserFullName(_userNameController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_userEmailFocusNode);
          },
          errorText: _formStore.formErrorStore.userFullName,
          isSuffixIcon: false,
          labelText: 'Name',
        );
      },
    );
  }

  // Widget _buildUserGraduateYearField() {
  //   return Observer(
  //     builder: (context) {
  //       return TextFieldWidget(
  //         isLabelColor: true,
  //
  //         fontSize: 16,
  //         textColor: Theme.of(context).colorScheme.primary,
  //         labelTextColor: Theme.of(context).primaryColor,
  //         focusBorderColor: Theme.of(context).colorScheme.outline,
  //         enableBorderColor: Theme.of(context).colorScheme.outline,
  //         hintColor: Theme.of(context).colorScheme.onPrimaryContainer,
  //
  //         // hint: AppLocalizations.of(context).translate('profile_dummy_graduate'),
  //         hint: '2020-2024',
  //         inputType: TextInputType.text,
  //         // icon: Icons.person,
  //         // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
  //         textController: _userGraduateYearController,
  //         inputAction: TextInputAction.next,
  //         autoFocus: false,
  //         onChanged: (value) {
  //           _profileStore.setGraduation(_userGraduateYearController.text);
  //         },
  //         onFieldSubmitted: (value) {
  //           FocusScope.of(context).requestFocus(_userCountryFocusNode);
  //         },
  //         errorText: _profileStore.formErrorStore.graduationError,
  //         isSuffixIcon: false,
  //         labelText: 'Graduate Year',
  //       );
  //     },
  //   );
  // }
  // Widget _buildUserBaseProfileField() {
  //   return Observer(
  //     builder: (context) {
  //       return TextFieldWidget(
  //         isLabelColor: true,
  //         fontSize: 16,
  //         textColor: Theme.of(context).colorScheme.primary,
  //         labelTextColor: Theme.of(context).primaryColor,
  //         focusBorderColor: Theme.of(context).colorScheme.outline,
  //         enableBorderColor: Theme.of(context).colorScheme.outline,
  //         hintColor: Theme.of(context).colorScheme.onPrimaryContainer,
  //
  //         // hint: AppLocalizations.of(context).translate('profile_dummy_student'),
  //         hint: 'Nigeria',
  //         inputType: TextInputType.text,
  //         // icon: Icons.person,
  //         // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
  //         textController: _userBaseProfileController,
  //         inputAction: TextInputAction.next,
  //         autoFocus: false,
  //         onChanged: (value) {
  //           _profileStore.setBaseProfile(_userBaseProfileController.text);
  //         },
  //         onFieldSubmitted: (value) {
  //           FocusScope.of(context).requestFocus(_userCountryFocusNode);
  //         },
  //         errorText: _profileStore.formErrorStore.baseProfileError,
  //         isSuffixIcon: false,
  //         labelText: 'Base Profile',
  //       );
  //     },
  //   );
  // }
  Widget _buildUserCountryField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          isLabelColor: true,
          labelTextColor: Theme.of(context).primaryColor,

          fontSize: 16,
          textColor: Theme.of(context).colorScheme.primary,
          focusBorderColor: Theme.of(context).colorScheme.onPrimaryContainer,
          enableBorderColor: Theme.of(context).colorScheme.onPrimaryContainer,
          hintColor: Theme.of(context).colorScheme.onPrimaryContainer,
          // hint: AppLocalizations.of(context).translate('profile_dummy_country'),
          hint: 'Greece',
          inputType: TextInputType.text,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userCountryController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setContact(_userCountryController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_userBaseProfileFocusNode);
          },
          errorText: _formStore.formErrorStore.contact,
          isSuffixIcon: false,
          labelText: 'Country/Region',
        );
      },
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: RoundedButtonWidget(
          buttonText:
              AppLocalizations.of(context).translate('login_btn_sign_in'),
          buttonColor: const Color.fromRGBO(19, 196, 159, 1),
          textColor: Colors.white,
          onPressed: onLogin),
    );
  }

  Future<void> onLogin() async {
    // if (_formStore.canLogin) {
    //   DeviceUtils.hideKeyboard(context);
    //   try {
    //     // ApiResponse? value = await _userStore.login(
    //     //     _userEmailController.text, _passwordController.text);
    //     // print(value);
    //   } catch (e) {
    //     if (e is ApiResponse) {
    //       showNotification(
    //           context, 'error', 'Error', e.message);
    //     } /*else {
    //             showNotification(
    //                 context, 'error', 'Error', e.response?.data['message']);
    //           }*/
    //   }
    // } else {
    //   showNotification(
    //       context, 'error', 'Error', 'Please fill in all fields.');
    //
    // }
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          ).show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _userNameController.dispose();
    _userCountryController.dispose();
    _userGraduateYearController.dispose();
    _userBaseProfileController.dispose();
    _userEmailFocusNode.dispose();
    _userNameFocusNode.dispose();
    _userGraduateYearFocusNode.dispose();
    _userCountryFocusNode.dispose();
    _userBaseProfileFocusNode.dispose();
    super.dispose();
  }
}
