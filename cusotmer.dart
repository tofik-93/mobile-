import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomerDemandPage extends StatefulWidget {
  @override
  _CustomerDemandPageState createState() => _CustomerDemandPageState();
}

class _CustomerDemandPageState extends State<CustomerDemandPage> {
  final List<Map<String, dynamic>> demandData = [
    {'product': 'Product A', 'quantity': 120},
    {'product': 'Product B', 'quantity': 80},
    {'product': 'Product C', 'quantity': 150},
  ];

  final _formKey = GlobalKey<FormState>();
  String productName = '';
  int quantity = 0;

  void _addDemand() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        demandData.add({'product': productName, 'quantity': quantity});
      });
    }
  }

  List<BarChartGroupData> _buildChartData() {
    return demandData.asMap().entries.map((entry) {
      int index = entry.key;
      final data = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(toY: data['quantity'].toDouble(), color: Colors.blue),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Demand Forecast"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bar chart
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  barGroups: _buildChartData(),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Demand list
            Expanded(
              child: ListView.builder(
                itemCount: demandData.length,
                itemBuilder: (context, index) {
                  final demand = demandData[index];
                  return ListTile(
                    title: Text(demand['product']),
                    trailing: Text('Qty: ${demand['quantity']}'),
                  );
                },
              ),
            ),
            // Input form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Product Name'),
                    onSaved: (value) => productName = value ?? '',
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a product name' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) =>
                        quantity = int.tryParse(value ?? '0') ?? 0,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a quantity' : null,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _addDemand,
                    child: Text('Add Demand'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
