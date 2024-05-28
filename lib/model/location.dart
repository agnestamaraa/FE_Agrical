class Location {
  final String location;

  Location({required this.location});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      location: json['lokasi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lokasi': location,
    };
  }
}