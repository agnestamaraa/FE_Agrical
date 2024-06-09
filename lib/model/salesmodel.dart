class SalesModel {
  final String tanaman;
  final int volumePenjualan;

  const SalesModel({
    required this.tanaman,
    required this.volumePenjualan
  });

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
      tanaman: json['tanaman'], 
      volumePenjualan: json['volumePenjualan']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tanaman': tanaman, 
      'volumePenjualan': volumePenjualan
    };
  }
}