import 'package:flutter/material.dart';
import 'package:phone_auth/utils/utils.dart';
import 'package:phone_auth/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.white),
                  child: Image.asset("assets/img3.png"),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter the code send to your phone number.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Pinput(
                  onTap: showSnackBar(context, "button pressed"),
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pink),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: CustomButton(
                    text: "Verify",
                    onPressed: () {
                      if (otpCode != null) {
                        verifyOtp(context, otpCode!);
                      } else {
                        showSnackBar(context, "Enter 6-Digit code");
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Didn't receieve a code?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Resend New Code",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 252, 33, 168)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {}
}
