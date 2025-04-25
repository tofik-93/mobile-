import 'package:flutter/material.dart';

class CustomerDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Dashboard"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Welcome Banner
            Text(
              'Welcome back, John!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Here’s a summary of your recent activity.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Profile Card
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('John Doe'),
                subtitle: Text('john@example.com'),
                trailing: Icon(Icons.edit),
              ),
            ),
            SizedBox(height: 20),

            // Recent Purchases
            Text("Recent Purchases", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Premium Sales Plan"),
                subtitle: Text("Purchased on April 20, 2025"),
                trailing: Text("\$49.99"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Data Analysis Tool"),
                subtitle: Text("Purchased on March 15, 2025"),
                trailing: Text("\$29.99"),
              ),
            ),
            SizedBox(height: 20),

            // Support
            Text("Support", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.support_agent, color: Colors.green),
                title: Text("Contact Support"),
                subtitle: Text("Need help? We’re here 24/7."),
                onTap: () {
                  // You can navigate to a support page here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
