class PriceModel {
  final String tanaman;
  final int hargaJual;

  const PriceModel({
    required this.tanaman,
    required this.hargaJual
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      tanaman: json['tanaman'], 
      hargaJual: json['hargaJual']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tanaman': tanaman, 
      'hargaJual': hargaJual
    };
  }
}