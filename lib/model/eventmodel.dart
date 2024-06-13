class Event {
  final String title;

  Event(this.title);

  // Convert an Event to a map for JSON encoding
  Map<String, dynamic> toJson() {
    return {
      'title': title,
    };
  }

  // Create an Event from a JSON map
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(json['title']);
  }

  @override
  String toString() => title;
}