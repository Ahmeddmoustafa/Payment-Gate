import 'package:payment_app/Resources/Managers/assets_manager.dart';

abstract class PaymentGateModel {
  final String paymentName;
  final String image;
  final int id;
  PaymentGateModel({
    required this.id,
    required this.image,
    required this.paymentName,
  });
}

class PaymobGatewayModel extends PaymentGateModel {
  PaymobGatewayModel({
    super.id = 0,
    super.image = AssetsManager.paymobImage,
    super.paymentName = "Paymob",
  });
}

class PaypalGatewayModel extends PaymentGateModel {
  PaypalGatewayModel({
    super.id = 1,
    super.paymentName = "Paypal",
    super.image = AssetsManager.paypalImage,
  });
}

class StripeGatewayModel extends PaymentGateModel {
  StripeGatewayModel({
    super.id = 2,
    super.paymentName = "Stripe",
    super.image = AssetsManager.stripeImage,
  });
}
