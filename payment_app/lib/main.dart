import 'package:flutter/material.dart';
import 'package:payment_app/pay_button.dart';
import 'package:payment_app/payment_manage.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Payment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PaymentManager _paymentManager = PaymentManager();
  void _visaPay() async {
    final token = await _paymentManager.payWithVisa(1, "EGP");
    launchUrl(Uri.parse(
        "https://accept.paymob.com/api/acceptance/iframes/804240?payment_token=$token"));
  }

  void _walletPay() async {
    final url = await _paymentManager.payWithWallet(1, "EGP");
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: PayButton(
                text: "Pay With Vodafone Cash",
                color: Colors.red,
                payment: _walletPay,
              ),
            ),
            PayButton(
              text: "Pay With Visa or Mastercard ",
              color: Colors.blueAccent,
              payment: _visaPay,
            ),
          ],
        ),
      ),
    );
  }
}
