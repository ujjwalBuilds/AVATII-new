import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  
                  'Avatii',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'About Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome to Avatii, a revolutionary cab service app that is reshaping the transportation industry. Founded by Dr. Suneel Kumar, Avatii operates on a unique 0% commission-based model for drivers, prioritizing fairness and sustainability in every ride.\n\n"
                "Our Vision\n\n"
                "At Avatii, we envision a future where drivers are valued partners, not just service providers. By eliminating commissions, we empower drivers to earn more from their hard work, fostering a community where everyone thrives.\n\n"
                "Our Mission\n\n"
                "Our mission at Avatii is simple yet transformative: to provide a platform that supports drivers and delivers exceptional service to passengers. We are committed to transparency, reliability, and creating a positive impact on both sides of the ride.\n\n"
                "Why Avatii?\n\n"
                "- Fairness: We believe in fairness for all. Our 0% commission model means more earnings for drivers and better value for passengers.\n"
                "- Community: Join a community of drivers who are respected and valued partners in our journey towards better transportation solutions.\n"
                "- Quality Service: From our rigorous driver selection process to our commitment to customer satisfaction, we ensure every ride with Avatii is safe, comfortable, and reliable.\n"
                "- Innovation: We harness the power of technology to continually improve our platform, making your experience with Avatii seamless and convenient.\n\n"
                "Our Commitment\n\n"
                "At Avatii, we are committed to redefining the standard of service in the transportation industry. By putting people first—both drivers and passengers—we are driving change and setting new benchmarks for excellence.\n\n"
                "Experience the difference with Avatii. Join us in creating a future where everyone benefits from fair, reliable, and innovative transportation solutions.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
