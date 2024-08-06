class ExtinguisherModel {
  final bool status;
  final String name;
  final int gm;
  final String type;
  final int counter;
  final bool? isDiscover;

  ExtinguisherModel({
    required this.status,
    required this.name,
    required this.gm,
    required this.type,
    required this.counter,
    this.isDiscover,
  });
}
