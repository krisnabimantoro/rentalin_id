class Motorcycle {
  String merkMotor;
  String motorName;
  String typeMotor;
  String platMotor;

  double pricePerDay; // New field for price per day
  bool isRecommended;

  Motorcycle({
    required this.merkMotor,
    required this.motorName,
    required this.typeMotor,
    required this.platMotor,
    required this.pricePerDay,
    required this.isRecommended,
  });
}
