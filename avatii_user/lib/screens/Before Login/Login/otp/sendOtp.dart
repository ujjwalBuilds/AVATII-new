import 'package:avatii/constants/imageStrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../providers.dart';

class OtpLoginScreen extends ConsumerWidget {
  const OtpLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpState = ref.watch(otpProvider);
    final otpNotifier = ref.read(otpProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  height: 235,
                  width: 150,
                  child: Image.asset(Aimages.avatiilogo),
                ),
                const SizedBox(height: 20),
                const Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
                const SizedBox(height: 10),

                ///MOBILE NUMBER
                const Text.rich(
                  TextSpan(
                    text: 'Enter the OTP sent to ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    children: [
                      TextSpan(
                        text: '+2151312125',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return _buildOtpField(context, otpNotifier, index, otpState[index]);
                  }),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Didn’t you receive the OTP? ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your resend OTP logic here
                      },
                      child: const Text(
                        'Resend OTP',
                        style: TextStyle(
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // TODO: Change Mobile Number Logic
                  },
                  child: const Text(
                    'Change mobile number',
                    style: TextStyle(
                      color: Color.fromARGB(255, 112, 112, 112),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final otp = otpNotifier.state.join();
                      // TODO: OTP LOGIC
                      context.go('/home-screen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF000000),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, OtpNotifier otpNotifier, int index, String value) {
    return SizedBox(
      width:50,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF7C54E9)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: (val) {
          if (val.length == 1) {
            otpNotifier.updateOtp(index, val);
            if (index < 5) {
              FocusScope.of(context).nextFocus();
            }
          }
        },
      ),
    );
  }
}
