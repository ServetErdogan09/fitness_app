import 'package:flutter/material.dart';
import 'package:fitness_app/models/user_points.dart';

class PointsDashboard extends StatelessWidget {
  final UserPoints? points;
  final VoidCallback? onTap;

  const PointsDashboard({super.key, this.points, this.onTap});

  @override
  Widget build(BuildContext context) {
    // Puan yoksa placeholder göster
    if (points == null) {
      return _buildPlaceholder();
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _getBadgeColor(points!.currentBadge).withOpacity(0.15),
              _getBadgeColor(points!.currentBadge).withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _getBadgeColor(points!.currentBadge).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Üst kısım: Toplam puan ve rozet
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Toplam puan
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Toplam Puan',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatPoints(points!.totalPoints),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
                // Rozet
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: _getBadgeColor(
                      points!.currentBadge,
                    ).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _getBadgeColor(points!.currentBadge),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    points!.currentBadge ?? 'Beginner 🌱',
                    style: TextStyle(
                      color: _getBadgeColor(points!.currentBadge),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Seviye progress bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seviye ${points!.currentLevel ?? 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    Text(
                      '${_getLevelProgress(points!.totalPoints)}%',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _getLevelProgress(points!.totalPoints) / 100,
                    minHeight: 8,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getBadgeColor(points!.currentBadge),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Haftalık ve aylık puanlar
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    label: 'Bu Hafta',
                    value: _formatPoints(points!.weeklyPoints),
                    icon: Icons.calendar_today,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    label: 'Bu Ay',
                    value: _formatPoints(points!.monthlyPoints),
                    icon: Icons.calendar_month,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Stat card (haftalık/aylık)
  Widget _buildStatCard({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.5), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                    fontFamily: 'Lexend',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Placeholder (puan yoksa)
  Widget _buildPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Icon(
            Icons.emoji_events_outlined,
            size: 48,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 12),
          const Text(
            'İlk Antrenmanını Tamamla!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Puan kazanmaya başla ve seviye atla',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
              fontFamily: 'Lexend',
            ),
          ),
        ],
      ),
    );
  }

  /// Rozet rengini getir
  /// NEDEN RENK KODLU?
  /// - Görsel hiyerarşi: Her seviye farklı renk
  /// - Motivasyon: Kullanıcı seviye atladıkça renk değişir
  Color _getBadgeColor(String? badge) {
    if (badge == null) return const Color(0xFF10b981); // Yeşil (Beginner)

    if (badge.contains('Elite')) {
      return const Color(0xFFfbbf24); // Altın
    } else if (badge.contains('Advanced')) {
      return const Color(0xFFa855f7); // Mor
    } else if (badge.contains('Intermediate')) {
      return const Color(0xFF3b82f6); // Mavi
    }
    return const Color(0xFF10b981); // Yeşil (Beginner)
  }

  /// Seviye progress hesapla (0-100)
  /// FORMÜL: (totalPoints % 100)
  /// NEDEN: Her 100 puan = 1 seviye, kalan puan = progress
  int _getLevelProgress(int totalPoints) {
    return totalPoints % 100;
  }

  /// Puanları formatla (1000 -> 1.0k)
  /// NEDEN: Büyük sayılar daha okunabilir
  String _formatPoints(int points) {
    if (points >= 1000) {
      return '${(points / 1000).toStringAsFixed(1)}k';
    }
    return points.toString();
  }
}
