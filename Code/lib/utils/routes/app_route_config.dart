
import 'package:edublock/core/widgets/envelopes/create_envelope_form.dart';
import 'package:edublock/core/widgets/multiple_form_steppper/multiple_form_stepper.dart';
import 'package:edublock/core/widgets/requests/candidates_process/candidate_details_screen.dart';
import 'package:edublock/core/widgets/requests/institutional_process/institutinal_info_screen/insitutional_info_screen.dart';
import 'package:edublock/core/widgets/share_certificate/certificate_view_cost.dart';
import 'package:edublock/core/widgets/share_certificate/share_certificate.dart';
import 'package:edublock/presentation/auth/change_password/change_password.dart';
import 'package:edublock/presentation/auth/forget_password/forget_password.dart';
import 'package:edublock/presentation/auth/login/login.dart';
import 'package:edublock/presentation/auth/registration/registration.dart';
import 'package:edublock/presentation/auth/set_new_password/set_new_password.dart';
import 'package:edublock/presentation/auth/verify_otp/verify_otp.dart';
import 'package:edublock/presentation/home/home.dart';
import 'package:edublock/presentation/screens/all_certificate/all_certificate.dart';
import 'package:edublock/presentation/screens/all_envelopes/all_envelopes_screen.dart';
import 'package:edublock/presentation/screens/create_envelopes/create_envelopes.dart';
import 'package:edublock/presentation/screens/profile_screen/profile_screen.dart';
import 'package:edublock/presentation/screens/requests/request_screen_widget.dart';
import 'package:edublock/presentation/splash/splash.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NyAppRouter {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: Routes.login,
          path: '/login',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: LoginScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
            // routes: <RouteBase>[
            //   GoRoute(
            //     name: Routes.forgetPassword,
            //     path: '/forget-password',
            //     pageBuilder: (BuildContext context, GoRouterState state) {
            //       return CustomTransitionPage(
            //         key: state.pageKey,
            //         child: ForgetPasswordScreen(),
            //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //           return FadeTransition(
            //             opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            //             child: child,
            //           );
            //         },
            //       );
            //     },
            //   ),
            //   GoRoute(
            //     name: Routes.registration,
            //     path: '/registration',
            //     pageBuilder: (BuildContext context, GoRouterState state) {
            //       return CustomTransitionPage(
            //         key: state.pageKey,
            //         child: RegistrationScreen(),
            //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //           return FadeTransition(
            //             opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            //             child: child,
            //           );
            //         },
            //       );
            //     },
            //   ),
            //   GoRoute(
            //     name: Routes.setNewPassword,
            //     path: '/set-new-password',
            //     pageBuilder: (BuildContext context, GoRouterState state) {
            //       return CustomTransitionPage(
            //         key: state.pageKey,
            //         child: SetNewPasswordScreen(),
            //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //           return FadeTransition(
            //             opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            //             child: child,
            //           );
            //         },
            //       );
            //     },
            //   ),
            //   GoRoute(
            //     name: Routes.otpVerify,
            //     path: '/otp-verify',
            //     pageBuilder: (BuildContext context, GoRouterState state) {
            //       return CustomTransitionPage(
            //         key: state.pageKey,
            //         child: VerifyOTPScreen(),
            //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //           return FadeTransition(
            //             opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            //             child: child,
            //           );
            //         },
            //       );
            //     },
            //   ),
            //
            //
            // ]


        ),
        GoRoute(
          name: Routes.home,
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          name: Routes.splash,
          path: '/splash',
          builder: (BuildContext context, GoRouterState state) {
            return SplashScreen();
          },
        ),
        GoRoute(
          name: Routes.createEvelopesScreen,
          path: '/create-envelopes',
          builder: (BuildContext context, GoRouterState state) {
            return CreateEvelopesScreen();
          },
        ),
        GoRoute(
          name: Routes.cretificateRequestScreen,
          path: '/certificate-request',
          builder: (BuildContext context, GoRouterState state) {
            return RequestWidgetScreen();
          },
        ),
        GoRoute(
          name: Routes.changePasswordScreen,
          path: '/change-password',
          builder: (BuildContext context, GoRouterState state) {
            return ChangePasswordScreen();
          },
        ),
        GoRoute(
          name: Routes.allCertificateScreen,
          path: '/all-certificates',
          builder: (BuildContext context, GoRouterState state) {
            return AllCertificateScreen();
          },
        ),
        GoRoute(
          name: Routes.profileScreen,
          path: '/profile',
          builder: (BuildContext context, GoRouterState state) {
            return ProfileScreen();
          },
        ),
        GoRoute(
          name: Routes.allEnvelopesScreen,
          path: '/all-envelopes',
          builder: (BuildContext context, GoRouterState state) {
            return AllEnvelopesScreen();
          },
        ),
        GoRoute(
          name: Routes.candidateDetailScreen,
          path: '/candidate-detail',
          builder: (BuildContext context, GoRouterState state) {
            return CandidateDetailScreen();
          },
        ),
        GoRoute(
          name: Routes.insitutionalDetailScreen,
          path: '/institutional-detail',
          builder: (BuildContext context, GoRouterState state) {
            return InsitutionalDetailScreen();
          },
        ),
        GoRoute(
          name: Routes.multipleFormStepperScreen,
          path: '/multiple-form-stepper',
          builder: (BuildContext context, GoRouterState state) {
            return MultipleFormStepperScreen();
          },
        ),
        GoRoute(
          name: Routes.createEnvelopeFormScreen,
          path: '/create-envelope-form',
          builder: (BuildContext context, GoRouterState state) {
            return CreateEnvelopeFormScreen();
          },
        ),
        GoRoute(
          name: Routes.shareCertificateScreen,
          path: '/share-certificate',
          builder: (BuildContext context, GoRouterState state) {
            return ShareCertificateScreen();
          },
        ),
        GoRoute(
          name: Routes.certificateViewCostScreen,
          path: '/certificate-view-cost',
          builder: (BuildContext context, GoRouterState state) {
            return CertificateViewCostScreen();
          },
        ),

      ],
      redirect: (BuildContext context, GoRouterState state) {
        if (!isAuth && state.path!.startsWith('/')) {
          return '/login';
        } else {
          return null; // return "null" to display the intended route without redirecting
        }
      },

      // errorPageBuilder: (context, state) {
      //   return const MaterialPage(child: ErrorPage());
      // },
    );
    return router;
  }
}
