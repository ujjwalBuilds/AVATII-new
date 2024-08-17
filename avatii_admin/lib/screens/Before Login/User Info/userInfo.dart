// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class UserInfoScreen extends StatefulWidget {
//   const UserInfoScreen({super.key});

//   @override
//   State<UserInfoScreen> createState() => _UserInfoScreenState();
// }

// class _UserInfoScreenState extends State<UserInfoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Please enter your details', style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w600, fontSize: 28),),
//             const SizedBox(height: 5),
//             const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168) ,fontWeight: FontWeight.w400, fontSize: 14),),
//             const SizedBox(height: 20),
//             TextField(
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             hintText: 'Enter your name',
//                             hintStyle: const TextStyle(
//                               color: Color.fromARGB(255, 108, 107, 107),
//                               fontWeight: FontWeight.normal,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                               borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.blueAccent),
//                               borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                             ),
//                             suffixIcon: const Icon(Icons.arrow_forward_rounded),
//                           ),
//                           keyboardType: TextInputType.phone,
//                         ),
//             const SizedBox(height: 15),
//             TextField(
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             hintText: 'Choose your city',
//                             hintStyle: const TextStyle(
//                               color: Color.fromARGB(255, 108, 107, 107),
//                               fontWeight: FontWeight.normal,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                               borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.blueAccent),
//                               borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                             ),
//                             suffixIcon: const Icon(Icons.arrow_forward_rounded),
//                           ),
//                           keyboardType: TextInputType.phone,
//                         ),
//             const SizedBox(height: 50),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 100,
//                   child: ElevatedButton(
//                     onPressed: (){
//                       GoRouter.of(context).push('/home-screen');
//                     },
//                     style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF000000),
//                           padding: EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                     ),
//                     child: Text('Next',style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),)),
//                 )
//               ],
//             )
        
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String? _selectedState;

  // List of Indian states and union territories
  final List<String> _statesAndUTs = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand',
    'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
    'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab',
    'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
    'Uttar Pradesh', 'Uttarakhand', 'West Bengal', 'Andaman and Nicobar Islands',
    'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Lakshadweep',
    'Delhi', 'Puducherry'
  ];

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
            const Text('Please enter your details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28)),
            const SizedBox(height: 5),
            const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14)),
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
                suffixIcon: const Icon(Icons.person,color: Colors.grey,),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: _selectedState,
              items: _statesAndUTs.map((state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Choose your city',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 108, 107, 107),
                  fontWeight: FontWeight.normal,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0), // Adjust padding to center hint text
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                ),
              ),
              isExpanded: true, // Ensures dropdown fits the available width
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/vehicle-registration');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF000000),
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Next', style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
