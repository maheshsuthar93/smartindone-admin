class CreateShipmentProjectModel {
  const CreateShipmentProjectModel({required this.id, required this.name});

  final String id;
  final String name;
  factory CreateShipmentProjectModel.fromJson(Map<String, dynamic> json) {
    return CreateShipmentProjectModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}
