//   import 'package:avatii/constants/imageStrings.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// void _sheetneeche() {
//     showMaterialModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) => ClipRRect(
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//         child: Container(
//           color: const Color(0xFFF2F2F5),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: Container(
//                 height: 450,
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: SingleChildScrollView(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             const Align(
//                               alignment: Alignment.topCenter,
//                               child: Padding(
//                                 padding: EdgeInsets.only(top: 12, bottom: 6),
//                                 child: Text(
//                                   'Select Address',
//                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                             Divider(
//                               indent: 17,
//                               endIndent: 17,
//                               color: Colors.grey.shade300,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 14),
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   hintText: 'Your Location',
//                                   hintStyle: const TextStyle(
//                                     fontSize: 15,
//                                     color: Color.fromARGB(255, 129, 129, 129),
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(25),
//                                     borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(color: Colors.blueAccent),
//                                     borderRadius: BorderRadius.circular(25),
//                                   ),
//                                   prefixIcon: const Icon(Icons.share_location_rounded, color: Colors.amber),
//                                   suffixIcon: const Icon(Icons.my_location_rounded, color: Colors.grey, size: 15),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 14),
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   hintText: 'Destination',
//                                   hintStyle: const TextStyle(
//                                     fontSize: 15,
//                                     color: Color.fromARGB(255, 129, 129, 129),
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(25),
//                                     borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(color: Colors.blueAccent),
//                                     borderRadius: BorderRadius.circular(25),
//                                   ),
//                                   prefixIcon: const Icon(Icons.local_taxi_rounded, color: Colors.amber),
//                                   suffixIcon: const Icon(Icons.location_pin, color: Colors.grey, size: 15),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             ElevatedButton(
//                               onPressed: () => _sheetaglaneeche(),
//                               style: ElevatedButton.styleFrom(
//                                 minimumSize: const Size(350, 50),
//                                 backgroundColor: Colors.black,
//                                 elevation: 1,
//                               ),
//                               child: const Text('Continue', style: TextStyle(color: Colors.white),)
//                             ),
//                             const SizedBox(height: 20),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 12.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Saved Places',
//                                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                                   ),
//                                   Icon(Icons.arrow_forward_ios, size: 16),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             _buildSavedPlace('Eleonora Hotel', '6 Glendale St. Worcester, MA 01604', '2.9 km'),
//                             _buildSavedPlace('Grand City Park', '307 Lilac Drive Munster, IN 46321', '8.3 km'),
//                             _buildSavedPlace('Mall Plaza', '8694 Essex St. Sunnyside, NY 11104', '4.4 km'),
//                             _buildSavedPlace('Hellana Restaurant', '39 Oakland St. Clementon, NJ 08021', '2.5 km'),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSavedPlace(String name, String address, String distance) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//     child: Row(
//       children: [
//         const Icon(Icons.access_time, color: Colors.grey),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//               Text(address, style: const TextStyle(color: Colors.grey, fontSize: 12)),
//             ],
//           ),
//         ),
//         Text(distance, style: const TextStyle(color: Colors.grey)),
//       ],
//     ),
//   );
// }

//   void _sheetaglaneeche() {
//     showMaterialModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) => ClipRRect(
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//         child: SingleChildScrollView(
//           child: Container(
//             color: const Color(0xFFF2F2F5),
//             child: Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: Container(
//                 height: 450,
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: SingleChildScrollView(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             const Align(
//                               alignment: Alignment.topCenter,
//                               child: Padding(
//                                 padding: EdgeInsets.only(top: 12, bottom: 6),
//                                 child: Text(
//                                   'Available rides',
//                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                             Divider(
//                               indent: 17,
//                               endIndent: 17,
//                               color: Colors.grey.shade300,
//                             ),
//                             const SizedBox(height: 10),
//                             _buildrides(rideType: 'Avatii X',price: '₹254.66',time: '8:15pm',distance: '4 min away',details: 'Private • Most popular',image: const AssetImage(Aimages.hatchback)),
//                             _buildrides(rideType: 'Avatii XL',price: '₹290.57',time: '8:15pm',distance: '3 min away',details: 'Private • Popular',image: const AssetImage(Aimages.sedan)),
//                             _buildrides(rideType: 'Avatii Lux',price: '₹350.13',time: '8:15pm',distance: '10 min away',details: 'Private • Very popular',image: const AssetImage(Aimages.hatchback)),
//                             _buildrides(rideType: 'Avatii Auto',price: '₹180.45',time: '8:15pm',distance: '2 min away',details: 'Private • Popular',image: const AssetImage(Aimages.sedan)),
//                             _buildrides(rideType: 'Avatii Moto',price: '₹120.37',time: '8:15pm',distance: '5 min away',details: 'Private • Very popular',image: const AssetImage(Aimages.hatchback)),
//                             _buildrides(rideType: 'Avatii Share',price: '₹130.75',time: '8:15pm',distance: '20 min away',details: 'Shared • Less popular',image: const AssetImage(Aimages.sedan)),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
// }



// Widget _buildrides({
//   required String rideType,
//   required String price,
//   required String time,
//   required String distance,
//   required String details,
//   required ImageProvider image,
// }) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//     child: Row(
//       children: [
//         Image(
//           image: image,
//           width: 50,
//           height: 50,
//           fit: BoxFit.contain,
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     rideType,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     price,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 children: [
//                   Text(
//                     time,
//                     style: const TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     distance,
//                     style: const TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 details,
//                 style: const TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
