class BillingCellData {
  final String date;
  final String status;
  final String message;
  final int amount;
  BillingCellData({
    required this.amount,
    required this.status,
    required this.date,
    required this.message,
  });
}
