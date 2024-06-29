import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'What\'s your phone?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please enter your phone number, we will send you a verification code.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            IntlPhoneField(
              decoration:  const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.red),


                  // borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              initialCountryCode: 'US',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
          ],
        ),
      ),
    );
  }
}


          