import 'package:flutter/material.dart';

class TripDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> trip;

  const TripDetailsScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final id = trip["id"]?.toString() ?? "";
    final from = trip["from"]?.toString() ?? "";
    final to = trip["to"]?.toString() ?? "";
    final amount = trip["amount"]?.toString() ?? "";
    final distance = trip["distance"]?.toString() ?? "";
    final time = trip["time"]?.toString() ?? "";
    return Scaffold(
      appBar: AppBar(title: const Text("Trip Details")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trip ID: $id"),
            const SizedBox(height: 12),
            Text("From: $from"),
            const SizedBox(height: 12),
            Text("To: $to"),
            const SizedBox(height: 12),
            Text("Amount: $amount"),
            const SizedBox(height: 12),
            Text("Distance: $distance"),
            const SizedBox(height: 12),
            Text("Time: $time"),
          ],
        ),
      ),
    );
  }
}
