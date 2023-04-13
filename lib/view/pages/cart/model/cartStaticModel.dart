class CartModel {
  final int? productId;
  final String? productName;
  final productThumbnailImage;
  final price;
  final variation;
  final currencySymbol;
  int? tax;
  int? shippingCost;
  int quantity = 1;
  int? lowerLimit;
  int? upperLimit;

  CartModel({
    required this.productId,
    required this.productName,
    required this.productThumbnailImage,
    required this.price,
    required this.variation,
    required this.currencySymbol,
  
    required this.quantity,
    required this.lowerLimit,
    required this.shippingCost,
    required this.tax,
    required this.upperLimit,
  });
}
