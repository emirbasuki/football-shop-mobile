// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> welcomeFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String welcomeToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    bool isFeatured;
    DateTime createdAt;
    int stock;
    String brand;
    String size;
    int productViews;
    int userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.createdAt,
        required this.stock,
        required this.brand,
        required this.size,
        required this.productViews,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        isFeatured: json["is_featured"],
        createdAt: DateTime.parse(json["created_at"]),
        stock: json["stock"],
        brand: json["brand"],
        size: json["size"],
        productViews: json["product_views"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "created_at": createdAt.toIso8601String(),
        "stock": stock,
        "brand": brand,
        "size": size,
        "product_views": productViews,
        "user_id": userId,
    };
}
