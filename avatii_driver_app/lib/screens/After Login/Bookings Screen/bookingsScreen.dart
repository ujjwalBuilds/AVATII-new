import 'package:avatii_driver_app/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // Only one active booking allowed
  final List<Map<String, dynamic>> activeBookings = [
    {'name': 'Rohit Sharma', 'payment': '₹350', 'paymentMode': 'Cash', 'date': DateTime.now(), 'status': 'Active'},
  ];

  final List<Map<String, dynamic>> completedBookings = [
    {'name': 'Sachin Rao', 'payment': '₹200', 'paymentMode': 'Card', 'date': DateTime(2024, 8, 10), 'status': 'Completed'},
    {'name': 'Priya Singh', 'payment': '₹150', 'paymentMode': 'Cash', 'date': DateTime(2024, 8, 11), 'status': 'Completed'},
    {'name': 'Anil Kumar', 'payment': '₹300', 'paymentMode': 'Card', 'date': DateTime(2024, 8, 12), 'status': 'Completed'},
    {'name': 'Sanya Patel', 'payment': '₹400', 'paymentMode': 'Online', 'date': DateTime(2024, 8, 13), 'status': 'Completed'},
    {'name': 'Ramesh Chandra', 'payment': '₹250', 'paymentMode': 'Cash', 'date': DateTime(2024, 8, 14), 'status': 'Completed'},
    {'name': 'Meera Sharma', 'payment': '₹350', 'paymentMode': 'Card', 'date': DateTime(2024, 8, 15), 'status': 'Completed'},
    {'name': 'Rajesh Yadav', 'payment': '₹300', 'paymentMode': 'Online', 'date': DateTime(2024, 8, 16), 'status': 'Completed'},
    {'name': 'Kavita Mehta', 'payment': '₹200', 'paymentMode': 'Cash', 'date': DateTime(2024, 8, 17), 'status': 'Completed'},
    {'name': 'Suresh Babu', 'payment': '₹150', 'paymentMode': 'Card', 'date': DateTime(2024, 8, 18), 'status': 'Completed'},
    {'name': 'Pooja Rao', 'payment': '₹100', 'paymentMode': 'Online', 'date': DateTime(2024, 8, 19), 'status': 'Completed'},
  ];

  final List<Map<String, dynamic>> cancelledBookings = [
    {'name': 'Virat Patel', 'date': DateTime(2024, 8, 20), 'status': 'Cancelled'},
    {'name': 'Raghav Sharma', 'date': DateTime(2024, 8, 21), 'status': 'Cancelled'},
    {'name': 'Sunil Yadav', 'date': DateTime(2024, 8, 22), 'status': 'Cancelled'},
    {'name': 'Gita Kumari', 'date': DateTime(2024, 8, 23), 'status': 'Cancelled'},
    {'name': 'Raj Kumar', 'date': DateTime(2024, 8, 24), 'status': 'Cancelled'},
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
          payment: bookings[index]['payment'],
          paymentMode: bookings[index]['paymentMode'],
          date: bookings[index]['date'],
          status: bookings[index]['status'],
        );
      },
    );
  }
}

class BookingsPageContainer extends StatelessWidget {
  final String name;
  final String? payment; // Payment is nullable
  final String? paymentMode; // Payment mode is nullable
  final DateTime date;
  final String status;

  const BookingsPageContainer({
    super.key,
    required this.name,
    this.payment,
    this.paymentMode,
    required this.date,
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
        color: Color.fromARGB(255, 247, 245, 245),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          
          ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (payment != null && paymentMode != null) ...[
                  Text('Payment: $payment', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Payment Mode: $paymentMode'),
                ],
                Text('Date: ${DateFormat('dd MMM yyyy').format(date)}'),
                Text('Day: ${DateFormat('EEEE').format(date)}'),
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
        ],
      ),
    );
  }
}
