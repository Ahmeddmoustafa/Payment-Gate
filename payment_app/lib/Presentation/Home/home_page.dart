import 'package:flutter/material.dart';
import 'package:payment_app/Presentation/Home/history_list.dart';
import 'package:payment_app/Presentation/Home/payment_carousel.dart';
import 'package:payment_app/Resources/Managers/colors_manager.dart';
import 'package:payment_app/Resources/Managers/values_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final PaymentManager _paymentManager = PaymentManager();
  // void _visaPay() async {
  //   final token = await _paymentManager.payWithVisa(1, "EGP");
  //   launchUrl(Uri.parse(
  //       "https://accept.paymob.com/api/acceptance/iframes/804240?payment_token=$token"));
  // }

  // void _walletPay() async {
  //   final url = await _paymentManager.payWithWallet(1, "EGP");
  //   launchUrl(Uri.parse(url));
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: const Text(
            "Welcome, User",
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.notifications,
                color: ColorManager.Golden,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s10, vertical: AppSize.s20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please choose Payment Gateway.",
                  style: textTheme.displayLarge,
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                const PaymentCarousel(),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  "Account History",
                  style: textTheme.displayLarge,
                ),
                const SizedBox(
                  height: AppSize.s30,
                ),
                const History(),
              ],
            ),
          ),
        ));
  }
}
