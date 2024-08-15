import 'package:avatii_driver_app/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Implement menu functionality
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.notification, color: Colors.black),
            onPressed: () {
              // Implement notifications functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome, Rohit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                 GoRouter.of(context).push('/details-screen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust this value for desired roundness
                  ),
                ),
                child: const Text(
                  'CHECK TODAYS EARNINGS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(Iconsax.car),
                            Text('Number of Trips'),
                            Text('26', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(Icons.currency_rupee),
                            Text('This week Earnings'),
                            Text('₹ 3687', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Last 7 days Earnings', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Divider(),
                        SizedBox(height: 5),
                        DateWeightCard(date: '14 August 2024', weight: '₹ 568'),
                        DateWeightCard(date: '13 August 2024', weight: '₹ 512'),
                        DateWeightCard(date: '12 August 2024', weight: '₹ 456'),
                        DateWeightCard(date: '11 August 2024', weight: '₹ 605'),
                        DateWeightCard(date: '10 August 2024', weight: '₹ 378'),
                        DateWeightCard(date: '9 August 2024', weight: '₹ 553'),
                        DateWeightCard(date: '8 August 2024', weight: '₹ 615'),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE4F05D),
                  borderRadius: BorderRadius.circular(15)
                ),
                
                padding: const EdgeInsets.all(16),
                child: const Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            children: [
              Text(
                'Total earnings this month: ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(width: 30), // Reduced width
              Expanded(
                child: Text(
                  '₹ 37861',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  overflow: TextOverflow.ellipsis, // Handles overflow
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
),

              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class DateWeightCard extends StatelessWidget {
  final String date;
  final String weight;

  const DateWeightCard({required this.date, required this.weight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Text(date,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 16)),
            Text(weight,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ],
        ),
      ],
    );
  }
}