import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function payment;

  const PayButton({
    super.key,
    required this.text,
    required this.color,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
          clipBehavior: Clip.none,
          onPressed: () async {
            await payment();
          },
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Flexible(
                flex: 1,
                child: Icon(
                  Icons.payment_outlined,
                  color: Colors.white,
                ),
              ),
              Flexible(
                flex: 5,
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white, overflow: TextOverflow.ellipsis),
                ),
              )
            ],
          )),
    );
  }
}
