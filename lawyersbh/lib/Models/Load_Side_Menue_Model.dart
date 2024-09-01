// ignore_for_file: camel_case_types

class Load_Side_Menue_Model {
  String id;
  String enName;
  String enDesc;
  String arName;
  String arDesc;
  String imagePath;

  Load_Side_Menue_Model(
      {this.id,
        this.enName,
        this.enDesc,
        this.arName,
        this.arDesc,
        this.imagePath});

  Load_Side_Menue_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enName = json['en_name'];
    enDesc = json['en_desc'];
    arName = json['ar_name'];
    arDesc = json['ar_desc'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['en_name'] = enName;
    data['en_desc'] = enDesc;
    data['ar_name'] = arName;
    data['ar_desc'] = arDesc;
    data['image_path'] = imagePath;
    return data;
  }
}