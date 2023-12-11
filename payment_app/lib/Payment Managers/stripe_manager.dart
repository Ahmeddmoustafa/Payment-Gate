import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/PaymentConstants/payment_constants.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeManager {
  Future<void> pay(int amount, String currency) async {
    try {
      final String clientSecret = await _getClientToken(
          amount: (amount * 100).toString(), currency: currency);
      await initializePaymentSheet(clientSecret: clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> initializePaymentSheet({required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Ahmed Mostafa",
      ),
    );
  }

  Future<String> _getClientToken({
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio().post(
      '${StripeConstants.baseUrl}/v1/payment_intents',
      options: Options(
        headers: {
          "Authorization": 'Bearer ${StripeConstants.apiKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    print('the token is ${response.data['client_secret']}');
    return response.data['client_secret'];
  }
}
