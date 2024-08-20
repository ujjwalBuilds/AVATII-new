// import 'package:avatii/Navigation%20Bar/bottomNavigationBar.dart';
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       body: Center(
//         child: Text('This is Profile Screen'),
//       ),
//       bottomNavigationBar: CustomNavigationBar(),
//     );
    
//   }
  
// }

import 'package:avatii/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Action for more options
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_image.png'),
              
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 15,
                  child: Icon(Icons.edit, size: 15, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Rohit Kumar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('+91 8376981250', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            _buildListTile(
              Icons.person_outline, 
              'Edit Profile', 
              onPressed: () {
                // Action for Edit Profile
              }
            ),
            _buildListTile(
              Iconsax.location, 
              'Address',
              onPressed: () {
                // Action for Address
              }
            ),
            _buildListTile(
              Iconsax.notification, 
              'Notification', 
              onPressed: () {
                // Action for Notification
              }
            ),
            _buildListTile(
              Iconsax.card, 
              'Payment', 
              onPressed: () {
                // Action for Payment
              }
            ),
            _buildListTile(
              Icons.security, 
              'Security', 
              onPressed: () {
                // Action for Security
              }
            ),
            _buildListTile(
              Iconsax.global, 
              'Language', 
              trailing: 'English (US)',
              onPressed: () {
                // Action for Language
              }
            ),
            _buildSwitchTile(
              Icons.dark_mode, 
              'Dark Mode'
            ),
            _buildListTile(
              Iconsax.lock, 
              'Privacy Policy', 
              onPressed: () {
                // Action for Privacy Policy
              }
            ),
            _buildListTile(
              Iconsax.message_question, 
              'Help Center', 
              onPressed: () {
                // Action for Help Center
              }
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Action for Logout
              },
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  Widget _buildListTile(
    IconData icon, 
    String title, 
    {String? trailing, 
    required VoidCallback onPressed}
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: trailing != null 
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(trailing, style: const TextStyle(color: Colors.grey)),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              )
            : const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  Widget _buildSwitchTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Switch(
        value: false,
        onChanged: (bool value) {
          setState(() {
            // Update state for the switch
          });
        },
      ),
    );
  }
}
