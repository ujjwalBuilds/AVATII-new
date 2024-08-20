import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Before we start,\nwhat should we call you?', style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w600, fontSize: 28),),
            const SizedBox(height: 20),
            TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your name',
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
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: (){
                      GoRouter.of(context).push('/home-screen');
                    },
                    style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF000000),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                    ),
                    child: Text('Proceed',style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),)),
                )
              ],
            )
        
          ],
        ),
      ),
    );
  }
}