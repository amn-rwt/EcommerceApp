class OrderDetails {
  List<Records>? records;

  OrderDetails({this.records});

  OrderDetails.fromJson(Map<String, dynamic> json) {
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
  List<String>? userId;
  int? total;
  List<String>? orderItems;

  Fields({this.id, this.userId, this.total, this.orderItems});

  Fields.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    userId = json['user_id'].cast<String>() ?? [];
    total = json['total'] ?? 0;
    orderItems = json['order_items'].cast<String>() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['total'] = total;
    data['order_items'] = orderItems;
    return data;
  }
}
