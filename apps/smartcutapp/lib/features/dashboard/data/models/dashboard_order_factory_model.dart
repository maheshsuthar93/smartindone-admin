class DashboardOrderFactoryModel {
  const DashboardOrderFactoryModel({required this.id, required this.name});

  final String id;
  final String name;

  factory DashboardOrderFactoryModel.fromJson(Map<String, dynamic> json) =>
      DashboardOrderFactoryModel(
        id: json['id'] as String,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
