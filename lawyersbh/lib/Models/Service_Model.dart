
// ignore_for_file: camel_case_types

class Service_Model {
  String id;
  String enName;
  String arName;
  String enDesc;
  String arDesc;
  String imagePath;
  String categoryId;
  String categoryEnName;
  String categoryArName;

  Service_Model(
      {this.id,
        this.enName,
        this.arName,
        this.enDesc,
        this.arDesc,
        this.imagePath,
        this.categoryId,
        this.categoryEnName,
        this.categoryArName});

  Service_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enName = json['en_name'];
    arName = json['ar_name'];
    enDesc = json['en_desc'];
    arDesc = json['ar_desc'];
    imagePath = json['image_path'];
    categoryId = json['category_id'];
    categoryEnName = json['category_en_name'];
    categoryArName = json['category_ar_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['en_name'] = enName;
    data['ar_name'] = arName;
    data['en_desc'] = enDesc;
    data['ar_desc'] = arDesc;
    data['image_path'] = imagePath;
    data['category_id'] = categoryId;
    data['category_en_name'] = categoryEnName;
    data['category_ar_name'] = categoryArName;
    return data;
  }
}
