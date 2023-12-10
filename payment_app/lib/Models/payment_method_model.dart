abstract class PaymentMethodModel {
  final String methodName;

  PaymentMethodModel({required this.methodName});
}

class VisaModel extends PaymentMethodModel {
  String amount = "";
  DateTime date = DateTime.now();

  VisaModel({super.methodName = "Visa"});
}

class WalletModel extends PaymentMethodModel {
  String number = '';
  String amount = '';
  DateTime date = DateTime.now();

  WalletModel({super.methodName = "Wallet"});
}
