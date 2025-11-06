import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/signal.dart';
import 'package:couldai_user_app/widgets/signal_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dummy data for demonstration
  final List<Signal> _signals = [
    Signal(instrument: 'EUR/USD', type: 'Buy', entry: 1.0850, takeProfit: 1.0900, stopLoss: 1.0820, period: 'M15'),
    Signal(instrument: 'GBP/JPY', type: 'Sell', entry: 198.25, takeProfit: 197.50, stopLoss: 198.75, period: 'M15'),
    Signal(instrument: 'XAU/USD', type: 'Buy', entry: 2350.75, takeProfit: 2360.00, stopLoss: 2345.00, period: 'M15'),
    Signal(instrument: 'BTC/USD', type: 'Sell', entry: 68500.00, takeProfit: 67000.00, stopLoss: 69200.00, period: 'M15'),
    Signal(instrument: 'USD/CAD', type: 'Buy', entry: 1.3720, takeProfit: 1.3780, stopLoss: 1.3690, period: 'M15'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sinyal Trading (M15)'),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _signals.length,
        itemBuilder: (context, index) {
          return SignalCard(signal: _signals[index]);
        },
      ),
    );
  }
}
