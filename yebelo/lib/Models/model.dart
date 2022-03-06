// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

List<ProductList> productListFromJson(String str) => List<ProductList>.from(json.decode(str).map((x) => ProductList.fromJson(x)));

String productListToJson(List<ProductList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductList {
  ProductList({
    this.pName,
    this.pId,
    this.pCost,
    this.pAvailability,
    this.pDetails,
    this.pImage,
    this.pCategory,
  });

  String? pName;
  int? pId;
  int? pCost;
  int? pAvailability;
  String? pDetails;
  String? pImage;
  String? pCategory;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    pName: json["p_name"],
    pId: json["p_id"],
    pCost: json["p_cost"],
    pAvailability: json["p_availability"],
    pDetails: json["p_details"] == null ? null : json["p_details"],
    pImage: json["p_image"],
    pCategory: json["p_category"] == null ? null : json["p_category"],
  );

  Map<String, dynamic> toJson() => {
    "p_name": pName,
    "p_id": pId,
    "p_cost": pCost,
    "p_availability": pAvailability,
    "p_details": pDetails == null ? null : pDetails,
    "p_image": pImage,
    "p_category": pCategory == null ? null : pCategory,
  };
}
