import 'package:flutter/material.dart';
import 'package:fitness_app/models/user_points.dart';

void showPointsBreakdownDialog(
  BuildContext context,
  PointCalculation calculation,
) {
  showDialog(
    context: context,
    builder: (context) => PointsBreakdownDialog(calculation: calculation),
  );
}

class PointsBreakdownDialog extends StatelessWidget {
  final PointCalculation calculation;

  const PointsBreakdownDialog({super.key, required this.calculation});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1C1C1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Puan Detayları',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LexendExa',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF9CA3AF)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Puan dağılımı
            _buildPointItem(
              icon: Icons.fitness_center,
              label: 'Taban Puan',
              points: calculation.basePoints,
              color: const Color(0xFF3b82f6),
            ),

            if (calculation.setRepsBonus != 0) ...[
              const SizedBox(height: 12),
              _buildPointItem(
                icon: calculation.setRepsBonus > 0
                    ? Icons.check_circle
                    : Icons.warning_amber_rounded,
                label: 'Egzersiz Performansı',
                points: calculation.setRepsBonus,
                color: calculation.setRepsBonus > 0
                    ? const Color(0xFF10b981)
                    : const Color(0xFFef4444),
              ),
            ],

            if (calculation.weightBonus > 0) ...[
              const SizedBox(height: 12),
              _buildPointItem(
                icon: Icons.trending_up,
                label: 'Ağırlık Artışı',
                points: calculation.weightBonus,
                color: const Color(0xFFf59e0b),
              ),
            ],

            if (calculation.consistencyBonus > 0) ...[
              const SizedBox(height: 12),
              _buildPointItem(
                icon: Icons.local_fire_department,
                label: 'Tutarlılık Bonusu',
                points: calculation.consistencyBonus,
                color: const Color(0xFFef4444),
              ),
            ],

            const SizedBox(height: 20),

            // Divider
            Container(height: 1, color: Colors.white.withOpacity(0.1)),

            const SizedBox(height: 20),

            // Toplam
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF13ec49), Color(0xFF0ea5e9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Toplam Kazanılan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  Text(
                    '${calculation.totalPoints > 0 ? "+" : ""}${calculation.totalPoints} puan',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Kapat butonu
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF13ec49),
                  foregroundColor: const Color(0xFF102215),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Harika! 🎉',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointItem({
    required IconData icon,
    required String label,
    required int points,
    required Color color,
  }) {
    final isPositive = points >= 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Lexend',
              ),
            ),
          ),
          const SizedBox(width: 4),
          SizedBox(
            width: 40,
            child: Text(
              '${isPositive ? "+" : ""}$points',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
