class CategoriesResponseModel {
  final String id;
  final int incid;
  final String name;
  final String icon;

  CategoriesResponseModel({required this.id, required this.incid, required this.name, required this.icon});

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(id: json['id'], incid: json['incid'], name: json['name'], icon: json['icon']);
  }
}
