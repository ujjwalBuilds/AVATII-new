// import 'package:avatii/Navigation%20Bar/bottomNavigationBar.dart';
// import 'package:flutter/material.dart';

// class BookingsScreen extends StatelessWidget {
//   const BookingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Sample data for multiple bookings
//     final List<Map<String, String>> bookings = [
//       {'name': 'Daniel Austin', 'carModel': 'Mercedes-Benz E-Cl..', 'licensePlate': 'HSW 4736 XK'},
//       {'name': 'Emma Watson', 'carModel': 'BMW 5 Series', 'licensePlate': 'LMN 2468 AB'},
//       {'name': 'John Smith', 'carModel': 'Audi A6', 'licensePlate': 'PQR 1357 CD'},
//       {'name': 'Sarah Johnson', 'carModel': 'Tesla Model S', 'licensePlate': 'XYZ 9876 EF'},
//       {'name': 'Daniel Austin', 'carModel': 'Mercedes-Benz E-Cl..', 'licensePlate': 'HSW 4736 XK'},
//       {'name': 'Emma Watson', 'carModel': 'BMW 5 Series', 'licensePlate': 'LMN 2468 AB'},
//       {'name': 'John Smith', 'carModel': 'Audi A6', 'licensePlate': 'PQR 1357 CD'},
//       {'name': 'Sarah Johnson', 'carModel': 'Tesla Model S', 'licensePlate': 'XYZ 9876 EF'},
//     ];

//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F2F5),
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('My Bookings' , style: TextStyle(color: Colors.white),),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             color: Colors.white,
//             onPressed: () {
//               // Add search functionality
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.more_vert),
//             color: Colors.white,
//             onPressed: () {
//               // Add more functionality
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: bookings.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: BookingsPageContainer(
//               name: bookings[index]['name']!,
//               carModel: bookings[index]['carModel']!,
//               licensePlate: bookings[index]['licensePlate']!,
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: const CustomNavigationBar(),
//     );
//   }
// }

// class BookingsPageContainer extends StatelessWidget {
//   final String name;
//   final String carModel;
//   final String licensePlate;

//   const BookingsPageContainer({
//     super.key,
//     required this.name,
//     required this.carModel,
//     required this.licensePlate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 2,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: ListTile(
//         leading: const CircleAvatar(
//           backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with actual image path
//         ),
//         title: Text(name),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(carModel),
//             Text(licensePlate),
//           ],
//         ),
//         trailing: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//           decoration: BoxDecoration(
//             color: Colors.amber,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: const Text(
//             'Active',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:avatii/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> activeBookings = [
  {'name': 'Rohit Sharma', 'carModel': 'Maruti WagonR', 'licensePlate': 'MH 01 AB 1234', 'status': 'Active'},
  {'name': 'Manav Patel', 'carModel': 'Maruti Swift', 'licensePlate': 'GJ 05 CD 5678', 'status': 'Active'},
  {'name': 'Aarti Verma', 'carModel': 'Hyundai Verna', 'licensePlate': 'UP 32 EF 4567', 'status': 'Active'},
  {'name': 'Vikram Singh', 'carModel': 'Toyota Camry', 'licensePlate': 'DL 03 GH 7890', 'status': 'Active'},
];

final List<Map<String, dynamic>> completedBookings = [
  {'name': 'Sachin Rao', 'carModel': 'Maruti Ertiga', 'licensePlate': 'MH 02 EF 9012', 'status': 'Completed'},
  {'name': 'Priya Singh', 'carModel': 'Hyundai i20', 'licensePlate': 'DL 03 GH 3456', 'status': 'Completed'},
  {'name': 'Anil Kumar', 'carModel': 'Honda Accord', 'licensePlate': 'UP 04 IJ 7890', 'status': 'Completed'},
  {'name': 'Sanya Patel', 'carModel': 'Toyota Innova', 'licensePlate': 'GJ 05 KL 1234', 'status': 'Completed'},
  {'name': 'Ramesh Chandra', 'carModel': 'BMW 3 Series', 'licensePlate': 'MH 06 MN 5678', 'status': 'Completed'},
  {'name': 'Meera Sharma', 'carModel': 'Audi A6', 'licensePlate': 'KA 07 OP 9012', 'status': 'Completed'},
  {'name': 'Rajesh Yadav', 'carModel': 'Mercedes Benz E-Class', 'licensePlate': 'DL 08 QR 3456', 'status': 'Completed'},
  {'name': 'Kavita Mehta', 'carModel': 'Ford EcoSport', 'licensePlate': 'TN 09 ST 7890', 'status': 'Completed'},
  {'name': 'Suresh Babu', 'carModel': 'Maruti Baleno', 'licensePlate': 'GJ 10 UV 1234', 'status': 'Completed'},
  {'name': 'Pooja Rao', 'carModel': 'Chevrolet Beat', 'licensePlate': 'MH 11 WX 5678', 'status': 'Completed'},
];

final List<Map<String, dynamic>> cancelledBookings = [
  {'name': 'Virat Patel', 'carModel': 'Toyota Innova', 'licensePlate': 'KA 04 IJ 7890', 'status': 'Cancelled'},
  {'name': 'Raghav Sharma', 'carModel': 'Honda City', 'licensePlate': 'MH 05 KL 2345', 'status': 'Cancelled'},
  {'name': 'Sunil Yadav', 'carModel': 'Hyundai Tucson', 'licensePlate': 'DL 06 MN 6789', 'status': 'Cancelled'},
  {'name': 'Gita Kumari', 'carModel': 'Renault Duster', 'licensePlate': 'UP 07 OP 2345', 'status': 'Cancelled'},
  {'name': 'Raj Kumar', 'carModel': 'Maruti Celerio', 'licensePlate': 'GJ 08 QR 6789', 'status': 'Cancelled'},
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('My Bookings', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Add search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {
              // Add more functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Active Now'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildBookingsList(activeBookings),
                _buildBookingsList(completedBookings),
                _buildBookingsList(cancelledBookings),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  Widget _buildBookingsList(List<Map<String, dynamic>> bookings) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return BookingsPageContainer(
          name: bookings[index]['name'],
          carModel: bookings[index]['carModel'],
          licensePlate: bookings[index]['licensePlate'],
          status: bookings[index]['status'],
        );
      },
    );
  }
}

class BookingsPageContainer extends StatelessWidget {
  final String name;
  final String carModel;
  final String licensePlate;
  final String status;

  const BookingsPageContainer({
    super.key,
    required this.name,
    required this.carModel,
    required this.licensePlate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case 'Active':
        statusColor = Colors.amber;
        break;
      case 'Completed':
        statusColor = Colors.green;
        break;
      case 'Cancelled':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with actual image path
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(carModel),
            Text(licensePlate),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}