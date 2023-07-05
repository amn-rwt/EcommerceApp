class Discount {
  List<Records>? records;

  Discount({this.records});

  Discount.fromJson(Map<String, dynamic> json) {
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
    id = json['id'] ?? '';
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
  String? name;
  String? desc;
  double? discountPercentage;
  bool? active;

  Fields({this.id, this.name, this.desc, this.discountPercentage, this.active});

  Fields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    desc = json['desc'] ?? 0.0;
    discountPercentage = json['discount_percentage'] ?? 0.0;
    active = json['active'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['desc'] = desc;
    data['discount_percentage'] = discountPercentage;
    data['active'] = active;
    return data;
  }
}
