import 'package:avatii_admin/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> newRequests = [
    {
      'driverName': 'Rajesh Kumar',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'DL4CAF5035',
      'carName': 'Toyota Innova',
      'carDetails': 'Diesel, 7-seater, 2018 model',
      'driverDetails': 'Age: 35, City: Delhi',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'DL-1234567890',
    },
    {
      'driverName': 'Raghav vats',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Aashish rana',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Shivansh wadhwa',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    // Add other new requests here
  ];

  final List<Map<String, dynamic>> approvedRequests = [
    {
      'driverName': 'Amit Verma',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Ujjwal Mishra',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Vishal sharma',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Raghav vats',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Aashish rana',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Shivansh wadhwa',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Eesh Kumar',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Paramjeet singh',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Suresh kulkarni',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Rajat sood',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    {
      'driverName': 'Kanav pahwa',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    // Add other approved requests here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'New Requests'),
            Tab(text: 'Approved Requests'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRequestsList(newRequests, true),
          _buildRequestsList(approvedRequests, false),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  Widget _buildRequestsList(List<Map<String, dynamic>> requests, bool isNewRequest) {
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(requests[index]['photo']),
            ),
            title: Text(requests[index]['driverName'], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${requests[index]['carName']} - ${requests[index]['carNo']}'),
            children: [
              _buildExpandedContent(requests[index], isNewRequest),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExpandedContent(Map<String, dynamic> request, bool isNewRequest) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Car Details: ${request['carDetails']}'),
              Text('Driver Details: ${request['driverDetails']}'),
              Text('Driving License Number: ${request['licenseNo']}'),
              const SizedBox(height: 10),
              _buildImageRow('RC Photo', request['rcPhoto']),
              _buildImageRow('Driving License', request['licensePhoto']),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: isNewRequest ? Colors.green : Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () {
              _showConfirmationDialog(isNewRequest ? 'Approve' : 'Revoke', () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text('Rider request ${isNewRequest ? 'approved' : 'revoked'}'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
            child: Text(isNewRequest ? 'Approve Request' : 'Revoke Request'),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImageRow(String label, String imageUrl) {
    return Row(
      children: [
        Text('$label: '),
        GestureDetector(
          onTap: () {
            _showImageDialog(imageUrl);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  void _showImageDialog(String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Image.network(imageUrl),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(String action, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm $action'),
        content: Text('Do you want to $action this request?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: onConfirm,
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
