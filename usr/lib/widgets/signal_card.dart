import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/signal.dart';

class SignalCard extends StatelessWidget {
  final Signal signal;

  const SignalCard({super.key, required this.signal});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isBuy = signal.type == 'Buy';
    final color = isBuy ? theme.colorScheme.secondary : theme.colorScheme.error;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withOpacity(0.5), width: 1),
      ),
      color: theme.colorScheme.background.withOpacity(0.5),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(theme, color),
            const SizedBox(height: 16),
            _buildPriceInfo(theme),
            const SizedBox(height: 16),
            _buildSLTPInfo(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          signal.instrument,
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${signal.type.toUpperCase()} @ ${signal.period}',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceInfo(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Entry Price',
          style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
        ),
        Text(
          signal.entry.toStringAsFixed(4),
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSLTPInfo(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSLTPColumn('Stop Loss', signal.stopLoss.toStringAsFixed(4), theme.colorScheme.error, theme),
        _buildSLTPColumn('Take Profit', signal.takeProfit.toStringAsFixed(4), theme.colorScheme.secondary, theme),
      ],
    );
  }

  Widget _buildSLTPColumn(String title, String value, Color color, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6)),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
