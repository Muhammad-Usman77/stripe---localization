import 'package:flutter/material.dart';
import 'package:multiproj/stripe/stripe_services.dart';

class SThome extends StatefulWidget {
  const SThome({super.key});

  @override
  State<SThome> createState() => _SThomeState();
}

class _SThomeState extends State<SThome> {
  String amount = "5000";
  String currency = "USD";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stripe Payment'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  try {
                    await StripeServices.initPaymentSheet(amount, currency);
                    await StripeServices.presentPaymentSheet();
                  } catch (e) {
                    Text('Error');
                  }
                },
                child: Text("Pay \$50"))
          ],
        ),
      ),
    );
  }
}
