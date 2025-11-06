class Signal {
  final String instrument;
  final String type; // "Buy" or "Sell"
  final double entry;
  final double takeProfit;
  final double stopLoss;
  final String period;

  Signal({
    required this.instrument,
    required this.type,
    required this.entry,
    required this.takeProfit,
    required this.stopLoss,
    required this.period,
  });
}
