class Motorcycle {
  String? motorcycleId;
  String? merkMotor;
  String? motorName;
  String? typeMotor;
  String? fileImage;
  String? platMotor;
  double? pricePerDay; // New field for price per day
  bool? isRecommended;

  Motorcycle({
    this.motorcycleId,
    this.merkMotor,
    this.motorName,
    this.fileImage,
    this.typeMotor,
    this.platMotor,
    this.pricePerDay,
    this.isRecommended,
  });
}
