import 'package:another_flushbar/flushbar_helper.dart';
import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/widgets/empty_app_bar_widget.dart';
import 'package:edublock/core/widgets/rounded_button_widget.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/data/sharedpref/constants/preferences.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/language/language_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/presentation/welcome_slider/slider.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeSliderScreen extends StatefulWidget {
  @override
  _WelcomeSliderScreenState createState() => _WelcomeSliderScreenState();
}

class _WelcomeSliderScreenState extends State<WelcomeSliderScreen> {
  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;

  final UserStore _userStore = getIt.get<UserStore>();

  final controller = PageController(viewportFraction: 1.0, keepPage: true);

  double currentPage = 0;

  final List<Map<String, String>> imgList = [
    {
      "image": Assets.EduAppLogo,
      "text_1": 'Organize Certificate Easily',
      "text_2":
          'Lorem ipsum dolor sit amet consect adipiscing elit ed vestibul facibused eget elementum dio.',
    },
    {
      "image": Assets.EduAppLogo,
      "text_1": 'Privacy Secured On Blockchain',
      "text_2":
          'Lorem ipsum dolor sit amet consect adipiscing elit ed vestibul facibused eget elementum dio.',
    },
    {
      "image": Assets.EduAppLogo,
      "text_1": 'Share Certificate Easily',
      "text_2":
          'Lorem ipsum dolor sit amet consect adipiscing elit ed vestibul facibused eget elementum dio..',
    },
  ];

  void handleNext() {
    if (controller == null) {
      // Handle the case where controller is null (not attached to any PageView)
      print("Controller is null");
      return;
    }

    final newPage = controller!.page! + 1;

    if (newPage < imgList.length) {
      setState(() {
        currentPage = newPage;
        controller!.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      });
    }
  }

  void handlePrevious() {
    if (controller == null) {
      // Handle the case where controller is null (not attached to any PageView)
      return;
    }

    final newPage = currentPage - 1;

    if (newPage >= 0) {
      setState(() {
        currentPage = newPage;
        controller!.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    print('check currentPage $currentPage');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ThemeStore _themeStore = getIt<ThemeStore>();
    final LanguageStore _languageStore = getIt<LanguageStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildLeftSide(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : Center(child: _buildRightSide()),
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  onChangedFunction(int index) {
    setState(() {
      currentPage = index.toDouble();
    });

    print('check current page in on change function $currentPage');
  }

  Widget _buildRightSide() {
    return Scaffold(
      body: Stack(children: [
        PageView(
          onPageChanged: onChangedFunction,

          controller: controller,

          children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 56.0, vertical: 24.0),
                    child: Text(
                      'eduBlock',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: const Color(0xff151522)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 28.0),
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: SvgWidget(
                        path: Assets.EduAppLogo,
                        label: Assets.EduAppLogo,
                        percentage: 0.09,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 56.0, vertical: 20.0),
                    child: Text(
                      'Organize Certificate Easily',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: const Color(0xfff1c1c1c)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet consect adipiscing elit ed vestibul facibused eget elementum dio.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xfff1c1c1c)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 40, 59, 1),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 100.0)),
                    ),
                  ),                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const Spacer(),
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 56.0, vertical: 24.0),
                        child: Text(
                          'eduBlock',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: const Color(0xffFFFFFf)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 28.0),
                        child: SizedBox(
                          height: 180,
                          width: 180,
                          child: SvgWidget(
                            path: Assets.EduAppLogo,
                            label: Assets.EduAppLogo,
                            percentage: 0.09,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 56.0, vertical: 20.0),
                        child: Text(
                          'Organize Certificate Easily',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: const Color(0xfff1c1c1c)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 44.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet consect adipiscing elit ed vestibul facibused eget elementum dio.',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xfff1c1c1c)),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
            Container(
              color: const Color.fromRGBO(36, 40, 59, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 56.0, vertical: 24.0),
                    child: Text(
                      'eduBlock',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 28.0),
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: SvgWidget(
                        path: Assets.EduAppLogo,
                        label: Assets.EduAppLogo,
                        percentage: 0.09,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 56.0, vertical: 20.0),
                    child: Text(
                      'Share Certificate Easily',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet consect adipiscing elit ed vestibul facibused eget elementum dio.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),

        Positioned(
          bottom: 120,
          left: MediaQuery.of(context).size.width*0.4,
          child: Center(
            child: SmoothPageIndicator(
                controller: controller, // PageController
                count: imgList.length,
                effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 10,

                    activeDotColor: Color.fromRGBO(73, 73, 73, 1),
                    dotColor: Color.fromRGBO(
                        73, 73, 73, 0.6)), // your preferred effect
                onDotClicked: (index) {
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },


                ),
          ),
        ),

        Positioned(
          bottom: 30,
          // left: 150,
          child:
           currentPage < 2
              ? Container(
            padding: EdgeInsets.symmetric(horizontal: 56.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                currentPage==0? GestureDetector(
                  onTap: handlePrevious,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFFE0E7E3),
                        width: 1.0,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        color: Color.fromRGBO(9, 180, 144, 1),
                        size: 24, // Adjust the size as per your requirement
                      ),
                    ),
                  ),
                ):const SizedBox(),
                Container(
                  height: 28,
                  child: ElevatedButton(
                    onPressed: handleNext,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      backgroundColor: const Color.fromRGBO(9, 180, 144, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Next',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color: const Color(0xFFFFFFFF)),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromRGBO(225, 255, 255, 1),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
              :Container(
             padding: EdgeInsets.symmetric(horizontal: 56.0),
             width: MediaQuery.of(context).size.width,

            child: ElevatedButton(
              onPressed: handleLast,
              style: ElevatedButton.styleFrom(

                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                backgroundColor: const Color.fromRGBO(9, 180, 144, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              child: Text(
                'Get Started',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    color: const Color(0xFFFFFFFF)),
              ),
            ),
          ),
        ),

      ]),
    );
  }

  void handleSkip() {
    handleLast();
  }

  void handlePageChange(int newPage) {
    setState(() {
      currentPage = double.parse(newPage.toString());
    });
  }


  void handleLast() {
    // _userStore.saveWelcomeSliderState(true);
    if (_userStore.isLoggedIn) {
      Future.delayed(const Duration(milliseconds: 0), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.home, (Route<dynamic> route) => false);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 0), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.login, (Route<dynamic> route) => false);
      });
    }
  }

  Widget _buildCarousel() {
    return ImageSlider(
      imageList: imgList,
      controller: controller,
      currentPage: currentPage,
      onPageChanged: handlePageChange,
    );
  }

  Widget _buildSignInButton() {
    return RoundedButtonWidget(
      buttonText: currentPage + 1 < imgList.length
          ? AppLocalizations.of(context).translate('login_btn_sign_in')
          : AppLocalizations.of(context).translate('welcome_get_started'),
      // width: double.infinity,
      onPressed: () {
        if (currentPage + 1 < imgList.length) {
          handleNext();
        } else {
          handleLast();
        }
      },
      // isDisable: false,
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(const Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      });
    }

    return const SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    super.dispose();
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.2,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
