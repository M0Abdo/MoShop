// ignore_for_file: file_names

class ItemModel {
  String? itemsId;
  String? itemsName;
  String? itemsNameArabic;
  String? itemsBrand;
  String? itemsArebicBrand;
  String? itemsDescription;
  String? itemsArebicDescription;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsActive;
  String? itemsCount;
  String? itemsImg;
  String? itemsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesArabic;
  String? categoriesImage;
  String? categoriesTime;
  String? favoret;

  ItemModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameArabic,
      this.itemsBrand,
      this.itemsArebicBrand,
      this.itemsDescription,
      this.itemsArebicDescription,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsActive,
      this.itemsCount,
      this.itemsImg,
      this.itemsCat,
      this.categoriesId,
      this.categoriesName,
      this.categoriesArabic,
      this.categoriesImage,
      this.categoriesTime,
      this.favoret
      });

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameArabic = json['items_name_arabic'];
    itemsBrand = json['items_brand'];
    itemsArebicBrand = json['items_arebic_brand'];
    itemsDescription = json['items_description'];
    itemsArebicDescription = json['items_arebic_description'];
    itemsPrice = int.parse(json['items_price']);
    itemsDiscount =  int.parse(json['items_discount']);
    itemsActive = json['items_active'];
    itemsCount = json['items_count'];
    itemsImg = json['items_img'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesArabic = json['categories_arabic'];
    categoriesImage = json['categories_image'];
    categoriesTime = json['categories_time'];
    favoret = json['favoret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_arabic'] = itemsNameArabic;
    data['items_brand'] = itemsBrand;
    data['items_arebic_brand'] = itemsArebicBrand;
    data['items_description'] = itemsDescription;
    data['items_arebic_description'] = itemsArebicDescription;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_active'] = itemsActive;
    data['items_count'] = itemsCount;
    data['items_img'] = itemsImg;
    data['items_cat'] = itemsCat;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_arabic'] = categoriesArabic;
    data['categories_image'] = categoriesImage;
    data['categories_time'] = categoriesTime;
    data['favoret'] = categoriesTime;
    return data;
  }
}