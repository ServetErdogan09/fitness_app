import 'package:flutter/material.dart';

class ChartPatritionMeasurement extends StatefulWidget {
  const ChartPatritionMeasurement({super.key});

  @override
  State<ChartPatritionMeasurement> createState() =>
      _ChartPatritionMeasurementState();
}

class _ChartPatritionMeasurementState extends State<ChartPatritionMeasurement> {
  final List<String> body = ['Ağırlık', 'Yağ Oranı', 'Kol', 'Bel'];
  String selectedMetric = 'Ağırlık';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: body.map((metric) {
            final isSelected = metric == selectedMetric;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedMetric = metric;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.green
                      : Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  metric,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 24),

        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Center(
              child: Text(
                '$selectedMetric Grafiği',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
