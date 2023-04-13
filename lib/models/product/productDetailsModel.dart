class ProductDetailsModel {
  List<Data>? data;
  bool? success;
  int? status;

  ProductDetailsModel({this.data, this.success, this.status});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? addedBy;
  int? sellerId;
  int? shopId;
  String? shopName;
  String? shopLogo;
  List<Photos>? photos;
  String? thumbnailImage;
  List<String>? tags;
  String? priceHighLow;
  List<ChoiceOptions>? choiceOptions;
  List<String>? colors;
  bool? hasDiscount;
  String? discount;
  String? strokedPrice;
  String? mainPrice;
  int? calculablePrice;
  String? currencySymbol;
  int? currentStock;
  String? unit;
  int? rating;
  int? ratingCount;
  int? earnPoint;
  String? description;
  String? videoLink;
  Brand? brand;
  String? link;

  Data(
      {this.id,
      this.name,
      this.addedBy,
      this.sellerId,
      this.shopId,
      this.shopName,
      this.shopLogo,
      this.photos,
      this.thumbnailImage,
      this.tags,
      this.priceHighLow,
      this.choiceOptions,
      this.colors,
      this.hasDiscount,
      this.discount,
      this.strokedPrice,
      this.mainPrice,
      this.calculablePrice,
      this.currencySymbol,
      this.currentStock,
      this.unit,
      this.rating,
      this.ratingCount,
      this.earnPoint,
      this.description,
      this.videoLink,
      this.brand,
      this.link});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addedBy = json['added_by'];
    sellerId = json['seller_id'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopLogo = json['shop_logo'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    thumbnailImage = json['thumbnail_image'];
    tags = json['tags'].cast<String>();
    priceHighLow = json['price_high_low'];
    if (json['choice_options'] != null) {
      choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(new ChoiceOptions.fromJson(v));
      });
    }
    colors = json['colors'].cast<String>();
    hasDiscount = json['has_discount'];
    discount = json['discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
    calculablePrice = json['calculable_price'];
    currencySymbol = json['currency_symbol'];
    currentStock = json['current_stock'];
    unit = json['unit'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    earnPoint = json['earn_point'];
    description = json['description'];
    videoLink = json['video_link'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['added_by'] = this.addedBy;
    data['seller_id'] = this.sellerId;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_logo'] = this.shopLogo;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    data['thumbnail_image'] = this.thumbnailImage;
    data['tags'] = this.tags;
    data['price_high_low'] = this.priceHighLow;
    if (this.choiceOptions != null) {
      data['choice_options'] =
          this.choiceOptions!.map((v) => v.toJson()).toList();
    }
    data['colors'] = this.colors;
    data['has_discount'] = this.hasDiscount;
    data['discount'] = this.discount;
    data['stroked_price'] = this.strokedPrice;
    data['main_price'] = this.mainPrice;
    data['calculable_price'] = this.calculablePrice;
    data['currency_symbol'] = this.currencySymbol;
    data['current_stock'] = this.currentStock;
    data['unit'] = this.unit;
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    data['earn_point'] = this.earnPoint;
    data['description'] = this.description;
    data['video_link'] = this.videoLink;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['link'] = this.link;
    return data;
  }
}

class Photos {
  String? variant;
  String? path;

  Photos({this.variant, this.path});

  Photos.fromJson(Map<String, dynamic> json) {
    variant = json['variant'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant'] = this.variant;
    data['path'] = this.path;
    return data;
  }
}

class ChoiceOptions {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['options'] = this.options;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? logo;

  Brand({this.id, this.name, this.logo});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}
