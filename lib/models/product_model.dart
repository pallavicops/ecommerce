class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;

  final String brand;

  final String image;
  final String thumbnail;
  final bool isFavourite;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.image,
    required this.thumbnail,
    required this.isFavourite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      stock: json['stock'],
      brand: json['brand'],

      // Safely access the first image, handle case when 'image' is null or not a list
      image: (json['image'] != null &&
              json['image'] is List &&
              json['image'].isNotEmpty)
          ? json['image'][0]
          : '',
      thumbnail: json['thumbnail'],
      isFavourite: json['isFavourite'] == 1, // Convert integer back to bool
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,

      'image': image, // Convert list to comma-separated string
      'thumbnail': thumbnail,
      // 'isFavourite': isFavourite ? 1 : 0, // Convert bool to integer
    };
  }

  // Adding a copyWith method for immutability
  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? image,
    String? thumbnail,
    bool? isFavourite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      image: image ?? this.image,
      thumbnail: thumbnail ?? this.thumbnail,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
