import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  final Function(String, String) onSubmit;
  final VoidCallback onBack;

  const ReportScreen({Key? key, required this.onSubmit, required this.onBack}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();
  String _incidentLocation = '';
  String _incidentDescription = '';

  void _submitReport() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_incidentLocation, _incidentDescription);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Report Incident',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Incident Location',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the incident location';
                      }
                      return null;
                    },
                    onSaved: (value) => _incidentLocation = value!,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Incident Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the incident description';
                      }
                      return null;
                    },
                    onSaved: (value) => _incidentDescription = value!,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitReport,
                    child: const Text('Submit Report'),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: widget.onBack,
          child: const Text('Back to Home'),
        ),
      ],
    );
  }
}