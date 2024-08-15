import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({super.key});

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // Define colors
    final Color defaultColor = Colors.white;
    final Color selectedColor = Colors.blue.shade100;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Upload Documents',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28),
            ),
            const SizedBox(height: 5),
            const Text(
              'Please enter the required details',
              style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14),
            ),
            const SizedBox(height: 25),
            const Text(
              'Earnings are only a few steps away',
              style: TextStyle(color: Color.fromARGB(255, 71, 70, 70), fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                ElevatedButton(
                            onPressed: () {
                      GoRouter.of(context).push('/registration-certficate');
                    }, 
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(400, 50),
                              backgroundColor: const Color.fromARGB(255, 241, 237, 237),
                              elevation: 0.3,
                              shadowColor: Colors.black,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Registration Certificate (RC) of your vehicle', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),),
                                SizedBox(width: 8),
                                Icon(Icons.credit_card_outlined, color: Colors.grey,),
                              ],
                            ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                            onPressed: () {
                      GoRouter.of(context).push('/driving-license');
                    },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(400, 50),
                              backgroundColor: const Color.fromARGB(255, 241, 237, 237),
                              elevation: 0.3,
                              shadowColor: Colors.black,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Driving License', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),),
                                SizedBox(width: 8),
                                
                              ],
                            ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                            onPressed: () {
                      GoRouter.of(context).push('/driving-license-number');
                    },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(400, 50),
                              backgroundColor: const Color.fromARGB(255, 241, 237, 237),
                              elevation: 0.3,
                              shadowColor: Colors.black,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Driving License Number', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),),
                                SizedBox(width: 8),
                                
                              ],
                            ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                            onPressed: () {
                      GoRouter.of(context).push('/profile-picture');
                    },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(400, 50),
                              backgroundColor: const Color.fromARGB(255, 241, 237, 237),
                              elevation: 0.3,
                              shadowColor: Colors.black,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Profile Picture', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),),
                                SizedBox(width: 8),
                                Icon(Icons.photo, color: Colors.grey,),
                              ],
                            ),
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/sign-in');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF000000),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Submit Application',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
