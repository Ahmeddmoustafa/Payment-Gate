part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {
  final List<PaymentMethodModel> paymentMethods;
  const PaymentState({required this.paymentMethods});
}

final class PaymentInitial extends PaymentState {
  const PaymentInitial({required super.paymentMethods});
}

final class PaymentSelected extends PaymentState {
  const PaymentSelected({required super.paymentMethods});
}
