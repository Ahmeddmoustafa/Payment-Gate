// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:payment_app/Models/payment_gate_model.dart';
import 'package:payment_app/Presentation/Home/home_page.dart';
import 'package:payment_app/Presentation/Payment%20Method/payment_method_page.dart';
import 'package:payment_app/Presentation/Payment%20View/paypal_page.dart';
import 'package:payment_app/Presentation/Processing/processing_page.dart';
import 'package:payment_app/Resources/Managers/strings_manager.dart';

class Routes {
  static const String mainRoute = '/main';
  static const String paymentMethodRoute = '/method';
  static const String processingRoute = '/processing';

  static const String profileRoute = '/profile';
  static const String playlistsRoute = '/playlist';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        {
          return MaterialPageRoute(builder: (context) => HomePage());
        }
      case Routes.paymentMethodRoute:
        {
          return MaterialPageRoute(builder: (context) => PaymentMethodPage());
        }
      case Routes.processingRoute:
        {
          switch (settings.arguments.runtimeType) {
            case PaypalGatewayModel:
              return MaterialPageRoute(builder: (context) => CheckoutPage());
            default:
              return MaterialPageRoute(builder: (context) => ProcessingPage());
          }
        }

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: Text(AppStrings.noRouteFound),
      ),
    );
  }
}
