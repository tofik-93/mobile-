import 'package:flutter/material.dart';

class InventoryAccountPage extends StatelessWidget {
  const InventoryAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Picture & Name
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with real image
                  ),
                  SizedBox(height: 10),
                  Text('Samuel Yonas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Inventory Manager', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Info Section
            ProfileInfoTile(label: 'Email', value: 'samuel@example.com'),
            ProfileInfoTile(label: 'Phone', value: '+251 912 345 678'),
            ProfileInfoTile(label: 'Location', value: 'Addis Ababa, Ethiopia'),

            Spacer(),

            // Action Buttons
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            ),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout, color: Colors.deepPurple),
              label: Text('Logout', style: TextStyle(color: Colors.deepPurple)),
              style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.deepPurple)),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfoTile extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(value, style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
