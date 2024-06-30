import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:myapp/Auth/cubit/auth_cubit.dart';
import 'package:myapp/Auth/cubit/screens/otp_screen.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
late final authCubit = BlocProvider.of<AuthCubit>(context);
final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 80,
        leading: 
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          
          margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
         decoration: BoxDecoration(
        
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
              ),
        
          child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios,size: 20,),
                 ),
        ),
      )


      
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What\'s your phone?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Please enter your phone number, we will send you a verification code.',
                style: TextStyle(fontSize: 16,color: Colors.grey),
              ),
              const SizedBox(height: 16),
              IntlPhoneField(
                controller: phoneNumberController,
                decoration:  const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
        
        
                    // borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                initialCountryCode: 'US',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
                        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [    Checkbox(
        value: true,
        onChanged: (value) {}),
               
                   const Flexible(
        child: Text(
          'I agree with Ask Asap\'s Privacy Policy and Terms of Service.',
          style: TextStyle(fontSize: 16.0),
        ),
          )]   ),
        SizedBox(height: 30,),
        MaterialButton(color: Colors.blue,
          minWidth: double.infinity,
          
          onPressed: () {
          authCubit.phoneAuth(phoneNumberController.text).then((value) => 
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return OTPScreen(phone: phoneNumberController.text,);
            },)));
          },
          child: const Text('Continue',style: TextStyle(color: Colors.white),),
        ),
        
        
        
          ],
        
        
            
          ),
        ),
      ),
    );
  }
}


          