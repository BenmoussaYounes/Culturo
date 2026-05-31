class CategoriesResponseModel {
  final String id;
  final int incid;
  final String name;
  final String icon;
  final String subtitle;
  final int quizCount;
  final String theme;

  CategoriesResponseModel({
    required this.id,
    required this.incid,
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.quizCount,
    required this.theme,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
      id: json['id'],
      incid: json['incid'],
      name: json['name'],
      subtitle: json['subtitle'] ?? "NULL",
      icon: json['icon'],
      quizCount: json['quizquantity'],
      theme: json['theme'],
    );
  }
}
