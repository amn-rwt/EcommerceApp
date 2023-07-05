class UserAddress {
  List<Records>? records;

  UserAddress({this.records});

  UserAddress.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Records {
  String? id;
  String? createdTime;
  Fields? fields;

  Records({this.id, this.createdTime, this.fields});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdTime = json['createdTime'] ?? '';
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdTime'] = createdTime;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    return data;
  }
}

class Fields {
  int? id;
  String? addressLine1;
  String? addressLine2;
  String? city;
  int? postalCode;
  String? country;
  String? mobile;
  List<String>? userId;

  Fields(
      {this.id,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.postalCode,
      this.country,
      this.mobile,
      this.userId});

  Fields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressLine1 = json['address_line1'] ?? '';
    addressLine2 = json['address_line2'] ?? '';
    city = json['city'] ?? '';
    postalCode = json['postal_code'] ?? 0;
    country = json['country'] ?? '';
    mobile = json['mobile'] ?? '';
    userId = json['user_id'].cast<String>() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['city'] = city;
    data['postal_code'] = postalCode;
    data['country'] = country;
    data['mobile'] = mobile;
    data['user_id'] = userId;
    return data;
  }
}
