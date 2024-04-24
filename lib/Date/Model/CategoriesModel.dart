// ignore_for_file: file_names

class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesArabic;
  String? categoriesImage;
  String? categoriesTime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesArabic,
      this.categoriesImage,
      this.categoriesTime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesArabic = json['categories_arabic'];
    categoriesImage = json['categories_image'];
    categoriesTime = json['categories_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_arabic'] = categoriesArabic;
    data['categories_image'] = categoriesImage;
    data['categories_time'] = categoriesTime;
    return data;
  }
}