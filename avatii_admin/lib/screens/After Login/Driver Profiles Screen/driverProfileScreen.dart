import 'package:avatii_admin/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  _DriverProfileScreenState createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
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
      'driverName': 'Vishal Sharma',
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
      'driverName': 'Raghav Vats',
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
      'driverName': 'Aashish Rana',
      'photo': 'https://via.placeholder.com/150',
      'carNo': 'KA03MR1234',
      'carName': 'Hyundai i20',
      'carDetails': 'Petrol, 5-seater, 2020 model',
      'driverDetails': 'Age: 30, City: Bangalore',
      'rcPhoto': 'https://via.placeholder.com/150',
      'licensePhoto': 'https://via.placeholder.com/150',
      'licenseNo': 'KA-8765432109',
    },
    // Add more approved requests as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Avatii Driver', style: TextStyle(color: Colors.white)),
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
      body: _buildRequestsList(approvedRequests),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  Widget _buildRequestsList(List<Map<String, dynamic>> requests) {
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(requests[index]['photo']),
            ),
            title: Text(
              requests[index]['driverName'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${requests[index]['carName']} - ${requests[index]['carNo']}'),
            children: [
              _buildExpandedContent(requests[index]),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExpandedContent(Map<String, dynamic> request) {
    return Padding(
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
            margin: const EdgeInsets.only(left: 8),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showImageDialog(String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}


