class CurrentUser {
  List<Records>? records;

  CurrentUser({this.records});

  CurrentUser.fromJson(Map<String, dynamic> json) {
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
    createdTime = json['createdTime'];
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
  int? userId;
  String? email;
  String? phone;
  String? firstName;
  String? lastName;
  List<UserImage>? userImage;
  List<String>? wishList;
  List<String>? orderDetails;
  List<String>? userAddress;

  Fields(
      {this.userId,
      this.email,
      this.phone,
      this.firstName,
      this.lastName,
      this.userImage,
      this.wishList,
      this.orderDetails,
      this.userAddress});

  Fields.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    if (json['user_image'] != null) {
      userImage = <UserImage>[];
      json['user_image'].forEach((v) {
        userImage!.add(UserImage.fromJson(v));
      });
    }
    wishList = json['wish_list'].cast<String>() ?? <String>[];
    orderDetails = json['order_details'].cast<String>();
    userAddress = json['user_address'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['email'] = email;
    data['phone'] = phone;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    if (userImage != null) {
      data['user_image'] = userImage!.map((v) => v.toJson()).toList();
    }
    data['wish_list'] = wishList;
    data['order_details'] = orderDetails;
    data['user_address'] = userAddress;
    return data;
  }
}

class UserImage {
  String? id;
  int? width;
  int? height;
  String? url;
  String? filename;
  int? size;
  String? type;
  Thumbnails? thumbnails;

  UserImage(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.filename,
      this.size,
      this.type,
      this.thumbnails});

  UserImage.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? ' ';
    width = json['width'] ?? ' ';
    height = json['height'] ?? ' ';
    url = json['url'] ?? ' ';
    filename = json['filename'] ?? ' ';
    size = json['size'] ?? ' ';
    type = json['type'] ?? ' ';
    thumbnails = json['thumbnails'] != null
        ? Thumbnails.fromJson(json['thumbnails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    data['filename'] = filename;
    data['size'] = size;
    data['type'] = type;
    if (thumbnails != null) {
      data['thumbnails'] = thumbnails!.toJson();
    }
    return data;
  }
}

class Thumbnails {
  Small? small;
  Small? large;
  Small? full;

  Thumbnails({this.small, this.large, this.full});

  Thumbnails.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? Small.fromJson(json['small']) : null;
    large = json['large'] != null ? Small.fromJson(json['large']) : null;
    full = json['full'] != null ? Small.fromJson(json['full']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (small != null) {
      data['small'] = small!.toJson();
    }
    if (large != null) {
      data['large'] = large!.toJson();
    }
    if (full != null) {
      data['full'] = full!.toJson();
    }
    return data;
  }
}

class Small {
  String? url;
  int? width;
  int? height;

  Small({this.url, this.width, this.height});

  Small.fromJson(Map<String, dynamic> json) {
    url = json['url'] ?? ' ';
    width = json['width'] ?? ' ';
    height = json['height'] ?? ' ';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
