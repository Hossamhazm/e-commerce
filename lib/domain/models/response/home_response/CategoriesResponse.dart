import 'package:mvvm_e_commerce/domain/models/response/home_response/meta_data.dart';

class CategoriesResponse {
  CategoriesResponse({
      this.results, 
      this.metadata, 
      this.data,});

  CategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Category.fromJson(v));
      });
    }
  }
  num? results;
  Metadata? metadata;
  List<Category>? data;


}

class Category {
  Category({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

}

