class Products {
  List<Records>? records;

  Products({this.records});

  Products.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? productName;
  List<String>? categoryId;
  String? description;
  num? price;
  List<ProductImages>? productImages;
  List<String>? wishList;
  List<String>? orderDetails;
  int? quantity;
  List<String>? discountId;

  Fields(
      {this.id,
      this.productName,
      this.categoryId,
      this.description,
      this.price,
      this.productImages,
      this.wishList,
      this.orderDetails,
      this.quantity,
      this.discountId});

  Fields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    categoryId = json['category_id'].cast<String>();
    description = json['Description'];
    price = json['price'];
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
    wishList = json['wish_list'].cast<String>();
    orderDetails = json['order_details'].cast<String>();
    quantity = json['quantity'] ?? 0;
    discountId = json['discount_id'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['category_id'] = categoryId;
    data['Description'] = description;
    data['price'] = price;
    if (productImages != null) {
      data['product_images'] = productImages!.map((v) => v.toJson()).toList();
    }
    data['wish_list'] = wishList;
    data['order_details'] = orderDetails;
    data['quantity'] = quantity;
    data['discount_id'] = discountId;
    return data;
  }
}

class ProductImages {
  String? id;
  num? width;
  num? height;
  String? url;
  String? filename;
  num? size;
  String? type;
  Thumbnails? thumbnails;

  ProductImages(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.filename,
      this.size,
      this.type,
      this.thumbnails});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    filename = json['filename'];
    size = json['size'];
    type = json['type'];
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
  num? width;
  num? height;

  Small({this.url, this.width, this.height});

  Small.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
