import 'package:avatii_admin/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);  // Initializing the TabController
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> activeRides = [
    {'from': 'Delhi', 'to': 'Mumbai', 'name': 'Rohit Sharma', 'payment': '₹350', 'paymentMode': 'Cash', 'date': DateTime.now(), 'status': 'Active'},
  ];

  final List<Map<String, dynamic>> completedRides = [
    {'from': 'Bangalore', 'to': 'Chennai', 'name': 'Sachin Rao', 'payment': '₹200', 'paymentMode': 'Card', 'date': DateTime(2024, 8, 10), 'status': 'Completed'},
    {'from': 'Hyderabad', 'to': 'Pune', 'name': 'Priya Singh', 'payment': '₹150', 'paymentMode': 'Cash', 'date': DateTime(2024, 8, 11), 'status': 'Completed'},
    // Add more completed rides
  ];

  final List<Map<String, dynamic>> cancelledRides = [
    {'from': 'Kolkata', 'to': 'Patna', 'name': 'Virat Patel', 'date': DateTime(2024, 8, 20), 'status': 'Cancelled'},
    // Add more cancelled rides
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Avatii', style: TextStyle(color: Colors.white)),
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
            tabs: const [
              Tab(text: 'Active'),
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
                _buildRidesList(activeRides),
                _buildRidesList(completedRides),
                _buildRidesList(cancelledRides),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(), // Assuming you have this implemented
    );
  }

  Widget _buildRidesList(List<Map<String, dynamic>> rides) {
    return ListView.builder(
      itemCount: rides.length,
      itemBuilder: (context, index) {
        return RidesPageContainer(
          from: rides[index]['from'],
          to: rides[index]['to'],
          name: rides[index]['name'],
          payment: rides[index]['payment'],
          paymentMode: rides[index]['paymentMode'],
          date: rides[index]['date'],
          status: rides[index]['status'],
        );
      },
    );
  }
}

class RidesPageContainer extends StatelessWidget {
  final String from;
  final String to;
  final String name;
  final String? payment; // Payment is nullable
  final String? paymentMode; // Payment mode is nullable
  final DateTime date;
  final String status;

  const RidesPageContainer({
    super.key,
    required this.from,
    required this.to,
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
        color: const Color.fromARGB(255, 247, 245, 245),
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
            title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (payment != null && paymentMode != null) ...[
                  Text('Payment: $payment', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Payment Mode: $paymentMode'),
                ],
                Text('From: $from'),
                Text('To: $to'),
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
