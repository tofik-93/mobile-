import 'package:flutter/material.dart';
import '../controllers/demand_controller.dart';
import '../models/demand_model.dart';

class DemandForm extends StatefulWidget {
  final DemandController controller;
  final VoidCallback onSubmit;

  DemandForm({required this.controller, required this.onSubmit});

  @override
  _DemandFormState createState() => _DemandFormState();
}

class _DemandFormState extends State<DemandForm> {
  final _formKey = GlobalKey<FormState>();
  String _product = '';
  int _quantity = 0;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.controller.addDemand(Demand(product: _product, quantity: _quantity));
      widget.onSubmit();
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Product Name'),
                onSaved: (value) => _product = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a product name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                onSaved: (value) =>
                    _quantity = int.tryParse(value!) ?? 0,
                validator: (value) =>
                    value!.isEmpty ? 'Enter quantity' : null,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Add Demand'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
