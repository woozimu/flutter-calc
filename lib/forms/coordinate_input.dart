import 'package:flutter/material.dart';

class CoordinateInputForm extends StatefulWidget {
  final TextEditingController latitudeController;
  final TextEditingController longitudeController;
  final TextEditingController zoomController;
  final VoidCallback handlePress;

  const CoordinateInputForm(
      {super.key,
      required this.latitudeController,
      required this.longitudeController,
      required this.zoomController,
      required this.handlePress});

  @override
  _CoordinateInputFormState createState() => _CoordinateInputFormState();
}

class _CoordinateInputFormState extends State<CoordinateInputForm> {
  bool isError = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: widget.latitudeController,
            decoration: const InputDecoration(labelText: 'Широта'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: widget.longitudeController,
            decoration: const InputDecoration(labelText: 'Долгота'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: widget.zoomController,
            decoration: const InputDecoration(labelText: 'Зум'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  widget.handlePress();
                }
              },
              child: const Text('Найти плитку карты с парковками'),
            ),
          ),
        ],
      ),
    );
  }
}
