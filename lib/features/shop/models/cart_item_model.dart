class CartItemModel{
  final String productId;
  final String name;
  final double price;
  int quantity;
  final String? sku;
  final Map<String, dynamic>? variation;
  final String brandName;
  final String image;

  CartItemModel({
    required this.productId,
    required this.name,
    required this.price,
    this.quantity=0,
    this.sku,
    this.variation,
    required this.brandName,
    required this.image,
  });

  Map<String, dynamic> toJson(){
    return {
      "productId": productId,
      "name": name,
      "price": price,
      "quantity": quantity,
      "sku": sku,
      "variation": variation,
      "brandName": brandName,
      "image": image
    };
  }

  factory CartItemModel.fromJson(dynamic json){
    return CartItemModel(
        productId: json["productId"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        brandName: json["brandName"],
        image: json["image"],
        sku: json["sku"],
        variation: json["variation"]
    );
  }
}