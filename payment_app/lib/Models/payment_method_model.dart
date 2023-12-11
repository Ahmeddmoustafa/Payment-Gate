import 'package:payment_app/Resources/Managers/assets_manager.dart';

abstract class PaymentMethodModel {
  final String methodName;
  final String methodImage;

  PaymentMethodModel({required this.methodImage, required this.methodName});
}

class VisaModel extends PaymentMethodModel {
  String amount = "";
  DateTime date = DateTime.now();

  VisaModel({
    super.methodName = "Visa",
    super.methodImage = AssetsManager.visaImage,
  });
}

class WalletModel extends PaymentMethodModel {
  String number = '';
  String amount = '';
  DateTime date = DateTime.now();

  WalletModel({
    super.methodName = "Wallet",
    super.methodImage = AssetsManager.walletImage,
  });
}
