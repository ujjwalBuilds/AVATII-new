import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrivingLicenseNumberScreen extends StatelessWidget {
  const DrivingLicenseNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Enter your Driving License Number',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(height: 10),
            TextField(
                    decoration: InputDecoration(
                      
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your Driving License Number',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 108, 107, 107),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: const Icon(Icons.directions_car_outlined, color: Colors.grey),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
            ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push('/upload-documents');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF000000),
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}