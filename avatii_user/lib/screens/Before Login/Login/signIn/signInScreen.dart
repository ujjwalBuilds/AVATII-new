import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Avatii',
                      style: TextStyle(
                        color: const Color(0xFFF212121),
                        fontSize: screenSize.width * 0.1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.02),

                // Sign In Form
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenSize.width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenSize.width * 0.08),
                    color: const Color.fromARGB(255, 229, 229, 229).withOpacity(0.4),
                    border: Border.all(
                      width: 0.7,
                      color: const Color.fromARGB(255, 175, 175, 175),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Login to Avatii',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.07,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 116, 116, 116),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Mobile number',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 108, 107, 107),
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                          ),
                          suffixIcon: const Icon(Icons.arrow_forward_rounded),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: screenSize.height * 0.02),

                      // Continue Button
                      ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).push('/otp-login');
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF000000)),
                        ),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                    ],
                  ),
                ),

                // Spacer to push the text to the bottom
                SizedBox(height: screenSize.height * 0.3),

                // Footer text
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'By proceeding you agree to our',
                            style: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: screenSize.width * 0.033,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Terms & conditions',
                            style: TextStyle(
                              color: const Color(0xFF7C54E9),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              fontSize: screenSize.width * 0.033,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'and confirm you have read our',
                            style: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: screenSize.width * 0.033,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: const Color(0xFF7C54E9),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              fontSize: screenSize.width * 0.033,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}