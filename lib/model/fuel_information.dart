class FuelInformation {
  final String date;
  final String fuelType;
  final double quantity;
  final int unitPrice;
  final int totalPrice;
  final String stationName;

  FuelInformation(
      {required this.date,
      required this.fuelType,
      required this.quantity,
      required this.unitPrice,
      required this.totalPrice,
      required this.stationName});

  Map<String, dynamic> toMap() {
    return {
      'stationName': stationName,
      'date': date,
      'fuelType': fuelType,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'totalPrice': totalPrice
    };
  }

  @override
  String toString() {
    return '----주유정보----\n주소: $stationName \n날짜: $date\n유종: $fuelType\n단가: $unitPrice\n수량: $quantity\n총액: $totalPrice\n----------------';
  }
}
