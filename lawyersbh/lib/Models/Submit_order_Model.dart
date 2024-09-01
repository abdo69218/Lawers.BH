// ignore_for_file: camel_case_types, non_constant_identifier_names
class Create_Account_Request_model {
  String mobile;
  String name;
  String email;
  String comment;
  String service_id;

  Create_Account_Request_model({this.mobile, this.name, this.email, this.comment, this.service_id});

  Create_Account_Request_model.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    name = json['name'];
    email = json['email'];
    comment = json['comment'];
    service_id = json['service_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['name'] = name;
    data['email'] = email;
    data['comment'] = comment;
    data['service_id'] = service_id;
    return data;
  }
}