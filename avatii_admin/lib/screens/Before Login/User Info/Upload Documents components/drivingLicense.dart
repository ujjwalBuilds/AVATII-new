import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrivingLicenseScreen extends StatelessWidget {
  const DrivingLicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Upload your Driving License',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
              ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){}, child: const Text('Upload your Driving License')),
            const SizedBox(height: 20),
            ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push('/upload-documents');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF000000),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
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