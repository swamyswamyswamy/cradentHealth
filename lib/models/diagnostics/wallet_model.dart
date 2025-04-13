class WalletResponse {
  String? message;
  String? walletBalance;
  List<Transaction>? transactionHistory;

  WalletResponse({this.message, this.walletBalance, this.transactionHistory});

  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      message: json['message']?.toString(),
      walletBalance: json['wallet_balance']?.toString(),
      transactionHistory: (json['transaction_history'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e))
          .toList(),
    );
  }
}

class Transaction {
  String? type;
  String? amount;
  String? description;
  String? timeAgo;
  String? date;

  Transaction(
      {this.type, this.amount, this.description, this.timeAgo, this.date});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      type: json['type']?.toString(),
      amount: json['amount']?.toString(),
      description: json['description']?.toString(),
      timeAgo: json['time_ago']?.toString(),
      date: json['date']?.toString(),
    );
  }
}
