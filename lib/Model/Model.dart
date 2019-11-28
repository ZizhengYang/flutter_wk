class Task {

  String name;
  Payment payment;
  String logo;

}

class Payment {

  PaymentType type;
  int upperBound;
  int lowerBound;

}

enum PaymentType {
  Hourly,
  Daily,
  Weekly,
  Monthly,
  Seasonally,
  yearly
}