import 'package:flutter/material.dart';
import '../widgets/sales_chart.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sales Forecast Dashboard")),
      drawer: AppDrawer(), // Sidebar Drawer
      body: Center(
        child: SalesChart(),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_circle, size: 50, color: Colors.white),
                SizedBox(height: 10),
                Text("Welcome, User!", style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text("Sales Reports"),
            onTap: () {
              // Navigate to Sales Reports screen
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              // Navigate to Settings screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              // Implement Logout
            },
          ),
        ],
      ),
    );
  }
}
