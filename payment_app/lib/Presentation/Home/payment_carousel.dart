import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/Presentation/Home/payment_gate.dart';
import 'package:payment_app/Resources/Managers/colors_manager.dart';
import 'package:payment_app/Resources/Managers/routes_manager.dart';
import 'package:payment_app/Resources/Managers/values_manager.dart';

class PaymentCarousel extends StatefulWidget {
  const PaymentCarousel({super.key});

  @override
  State<PaymentCarousel> createState() => _PaymentCarouselState();
}

class _PaymentCarouselState extends State<PaymentCarousel> {
  int currIndex = 0;
  final CarouselController carouselController = CarouselController();
  final List<Map<String, dynamic>> payments = [
    {
      "name": "paymob",
      "id": 0,
      "image": ColorManager.Black,
    },
    {
      "name": "stripe",
      "id": 1,
      "image": ColorManager.Orange,
    },
    {
      "name": "paypal",
      "id": 2,
      "image": ColorManager.Pink,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.paymentMethodRoute);
          },
          child: CarouselSlider(
            carouselController: carouselController,
            items: payments
                .map((item) => PaymentWay(
                      paymentName: item["name"],
                      paymentImage: item["image"],
                      paymentID: item["id"],
                    ))
                .toList(),
            options: CarouselOptions(
              // height: MediaQuery.of(context).size.height * 0.45,
              scrollPhysics: const BouncingScrollPhysics(),
              // autoPlay: true,
              aspectRatio: 16 / 11,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  currIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: payments.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currIndex == entry.key ? AppSize.s14 : AppSize.s8,
                  height: AppSize.s8,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s10),
                      color: currIndex == entry.key
                          ? ColorManager.LightSilver
                          : ColorManager.LightGrey),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
