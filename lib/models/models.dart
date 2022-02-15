class Wallpaper {
  late int? id;
  late int? width;
  late int? height;
  late String? url;
  late String? photographer;
  late int? photographerId;

  late String? original;

  Wallpaper({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerId,
  });

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      id: json['id'] ?? '',
      width: json['width'] ?? '',
      height: json['height'] ?? '',
      url: json['src']['small'] ?? '',
      photographer: json['photographer'] ?? '',
      photographerId: json['photographer_id'] ?? '',
    );
  }
}
