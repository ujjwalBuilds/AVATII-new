import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegCertScreen extends StatelessWidget {
  const RegCertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Upload your Registration Certificate',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
              ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){}, child: Text('Upload your RC')),
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