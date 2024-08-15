// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfilePictureScreen extends StatelessWidget {
//   const ProfilePictureScreen({super.key});

//   Future<void> _pickImage(BuildContext context) async {
//     final ImagePicker _picker = ImagePicker();

//     // Display a dialog to choose between camera or gallery
//     final ImageSource? source = await showDialog<ImageSource>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Select Image Source'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(ImageSource.camera),
//               child: const Text('Camera'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
//               child: const Text('Gallery'),
//             ),
//           ],
//         );
//       },
//     );

//     if (source == null) return;

//     final XFile? image = await _picker.pickImage(source: source);

//     if (image != null) {
//       // Handle the image (e.g., display it or upload it)
//       print('Image selected: ${image.path}');
//       // You can use the image.path to work with the selected image
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile Picture'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//                 'Upload your Profile Picture',
//                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28),
//               ),
//               const SizedBox(height: 10),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () => _pickImage(context),
//                 child: const Text('Upload your Profile Picture'),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//                       onPressed: () {
//                         GoRouter.of(context).push('/upload-documents');
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF000000),
//                         padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Text(
//                         'Submit',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureScreen extends StatelessWidget {
  const ProfilePictureScreen({super.key});

  Future<void> _pickImage(BuildContext context) async {
    print("_pickImage function called"); // Debug print
    try {
      final ImagePicker _picker = ImagePicker();

      final ImageSource? source = await showDialog<ImageSource>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select Image Source'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(ImageSource.camera),
                child: const Text('Camera'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
                child: const Text('Gallery'),
              ),
            ],
          );
        },
      );

      print("Selected source: $source"); // Debug print

      if (source == null) return;

      final XFile? image = await _picker.pickImage(source: source);
      
      if (image != null) {
        print('Image selected: ${image.path}');
        // Handle the image (e.g., display it or upload it)
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error picking image: $e');
      // Show an error dialog or snackbar to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Upload your Profile Picture',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _pickImage(context),
              child: const Text('Upload your Profile Picture'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/upload-documents');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF000000),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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