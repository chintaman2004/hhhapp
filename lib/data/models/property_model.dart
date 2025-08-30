class PropertyModel {
  final String id;
  final String title;
  final String description;
  final String address;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final int area;
  final List<String> images;
  final String type;
  final DateTime createdAt;
  final String ownerId;
  final double latitude;
  final double longitude;
  final bool isFeatured;

  PropertyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.images,
    required this.type,
    required this.createdAt,
    required this.ownerId,
    required this.latitude,
    required this.longitude,
    this.isFeatured = false,
  });

  factory PropertyModel.fromMap(Map<String, dynamic> map, String id) {
    return PropertyModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      address: map['address'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      bedrooms: map['bedrooms'] ?? 0,
      bathrooms: map['bathrooms'] ?? 0,
      area: map['area'] ?? 0,
      images: List<String>.from(map['images'] ?? []),
      type: map['type'] ?? 'house',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      ownerId: map['ownerId'] ?? '',
      latitude: (map['latitude'] ?? 0).toDouble(),
      longitude: (map['longitude'] ?? 0).toDouble(),
      isFeatured: map['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'address': address,
      'price': price,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'images': images,
      'type': type,
      'createdAt': createdAt,
      'ownerId': ownerId,
      'latitude': latitude,
      'longitude': longitude,
      'isFeatured': isFeatured,
    };
  }

  PropertyModel copyWith({
    String? id,
    String? title,
    String? description,
    String? address,
    double? price,
    int? bedrooms,
    int? bathrooms,
    int? area,
    List<String>? images,
    String? type,
    DateTime? createdAt,
    String? ownerId,
    double? latitude,
    double? longitude,
    bool? isFeatured,
  }) {
    return PropertyModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      address: address ?? this.address,
      price: price ?? this.price,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      area: area ?? this.area,
      images: images ?? this.images,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      ownerId: ownerId ?? this.ownerId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }
}
