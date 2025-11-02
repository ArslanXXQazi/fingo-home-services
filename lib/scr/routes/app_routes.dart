


import 'package:fingodriver/scr/bottom_nav_bar_views/bottom_nav_view.dart';
import 'package:fingodriver/scr/home_views/account_detail_view.dart';
import 'package:fingodriver/scr/home_views/add_bank_view.dart';
import 'package:fingodriver/scr/bottom_nav_bar_views/booking_view/booking_nav_view.dart';
import 'package:fingodriver/scr/home_views/contact_us_view.dart';
import 'package:fingodriver/scr/home_views/driver_inbox.dart';
import 'package:fingodriver/scr/home_views/home_view.dart';
import 'package:fingodriver/scr/home_views/language_view.dart';
import 'package:fingodriver/scr/home_views/my_profile_view.dart';
import 'package:fingodriver/scr/home_views/privacy_policy.dart';
import 'package:fingodriver/scr/home_views/terms_and_conditions.dart';
import 'package:fingodriver/scr/home_views/top_up_history.dart';
import 'package:fingodriver/scr/home_views/wallet_view.dart';
import 'package:fingodriver/scr/home_views/withdraw_method.dart';
import 'package:fingodriver/scr/home_views/map_view.dart';

import '../components/components/constant/linker.dart';

class AppRoutes {


  static  final String splashView = '/';
  static  final String onBoardingView = '/onBoardingView';
  static  final String loginView = '/loginView';
  static  final String signUpView = '/signUpView';
  static  final String phoneNumberView = '/phoneNumberView';
  static  final String otpView = '/otpView';
  static  final String myProfileView = '/myProfileView';
  static  final String contactUsView = '/contactUsView';
  static  final String accountDetailView = '/accountDetailView';
  static  final String termsAndConditions = '/termsAndConditions';
  static  final String privacyPolicy = '/privacyPolicy';
  static  final String driverInbox = '/driverInbox';
  static  final String languageView = '/languageView';
  static  final String walletView = '/walletView';
  static  final String topUpHistory = '/topUpHistory';
  static  final String withdrawMethod = '/withdrawMethod';
  static  final String addBankView = '/addBankView';
  static  final String bottomNavView = '/bottomNavView';
  static  final String homeView = '/homeView';
  static  final String bookingNavView = '/bookingNavView';
  static  final String mapView = '/mapView';

  static final routes = [

    GetPage(name: splashView, page: ()=>SplashView()),
    GetPage(name: onBoardingView, page: ()=>OnBoardingView()),
    GetPage(name: loginView, page: ()=>LoginView()),
    GetPage(name: signUpView, page: ()=>SignUpView()),
    GetPage(name: phoneNumberView, page: ()=>PhoneNumberView()),
    GetPage(name: otpView, page: ()=>OtpVerificationView()),
    GetPage(name: myProfileView, page: ()=>MyProfileView()),
    GetPage(name: contactUsView, page: ()=>ContactUsView()),
    GetPage(name: accountDetailView, page: ()=>AccountDetailsView()),
    GetPage(name: privacyPolicy, page: ()=>PrivacyPolicyView()),
    GetPage(name: termsAndConditions, page: ()=>TermsConditionsView()),
    GetPage(name: driverInbox, page: ()=>DriverInbox()),
    GetPage(name: languageView, page: ()=>LanguageView()),
    GetPage(name: walletView, page: ()=>WalletView()),
    GetPage(name: topUpHistory, page: ()=>TopUpHistory()),
    GetPage(name: withdrawMethod, page: ()=>WithdrawMethod()),
    GetPage(name: addBankView, page: ()=>AddBankView()),
    GetPage(name: bottomNavView, page: ()=>BottomNavView()),
    GetPage(name: homeView, page: ()=>HomeView()),
    GetPage(name: bottomNavView, page: ()=>BookingNavView()),
    GetPage(name: mapView, page: ()=>MapView()),
  ];


}