import 'package:dio/dio.dart';
import 'package:payment_app/PaymentConstants/payment_constants.dart';

class PaymentManager {
  Future<String> payWithWallet(int amount, String currency) async {
    try {
      final token = await _getPaymentToken(
          amount, currency, PaymentConstants.paymentWalletId);
      final url = await _payWithWalet(token);
      return url;
    } catch (err) {
      // print("err is $err");
      return Future.value("error $err");
    }
  }

  Future<String> payWithVisa(int amount, String currency) async {
    final key = await _getPaymentToken(
      amount,
      currency,
      PaymentConstants.paymentCardId,
    );
    return key;
  }

  Future<String> _getPaymentToken(
      int amount, String currency, int method) async {
    try {
      final String authToken = await _getAuthToken();

      ///************************************************////
      ///
      final int orderId = await _getOrderId(
          authtoken: authToken,
          amount: (amount * 100).toString(),
          currency: currency);

      ///************************************************////
      ///
      final String paymentKey = await _getPaymentKey(
          authToken: authToken,
          orderId: orderId.toString(),
          amount: (amount * 100).toString(),
          currency: currency,
          method: method);

      ///************************************************////
      return paymentKey;
    } catch (e) {
      // print("EXCEPTION *******************************");
      // print(e.toString());
      throw Exception();
    }
  }

  Future<String> _getAuthToken() async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/auth/tokens",
      data: {"api_key": PaymentConstants.apiKey},
    );
    // print('step 1 ${response.data["token"]}');
    return response.data["token"];
  }

  Future<int> _getOrderId(
      {required String authtoken,
      required String amount,
      required String currency}) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/ecommerce/orders",
      data: {
        "auth_token": authtoken,
        "delivery_needed": "false",
        "amount_cents": amount,
        "currency": currency,
        "items": [],
      },
    );
    // print('step 2 ${response.data["id"]}');
    return response.data["id"];
  }

  Future<String> _getPaymentKey(
      {required String authToken,
      required String orderId,
      required String amount,
      required String currency,
      required int method}) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/acceptance/payment_keys",
      data: {
        "auth_token": authToken,
        "amount_cents": amount,
        "expiration": 3600,
        "order_id": orderId,
        "billing_data": {
          "apartment": "NA",
          "email": "claudette09@exa.com",
          "floor": "NA",
          "first_name": "Clifford",
          "street": "NA",
          "building": "NA",
          "phone_number": "+86(8)9135210487",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "Nicolas",
          "state": "NA"
        },
        "currency": currency,
        "integration_id": method,
      },
    );
    // print('step 3 ${response.data["token"]}');
    return response.data["token"];
  }
  //******************* PAY WITH VODAFONE ************** */

  Future<String> _payWithWalet(String token) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/acceptance/payments/pay",
      data: {
        "source": {"identifier": "01010101010", "subtype": "WALLET"},
        "payment_token": token // token obtained in step 3
      },
    );
    // print('wallet url ${response.toString()}');
    return response.data["redirect_url"];
  }
}
