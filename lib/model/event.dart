class Event {
  static const String collectionName = 'events';
  String id;
  final String title;
  final String description;
  final String category;
  final DateTime date;
  final String time;
  final String imageUrl;
  bool isFavorite;

  Event({
    this.id = '',
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.time,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Event.fromFirestore(Map<String, dynamic> map)
    : this(
        id: map['id'] ?? '',
        title: map['title'],
        description: map['description'],
        category: map['category'],
        date: DateTime.fromMillisecondsSinceEpoch(map['date']),
        time: map['time'],
        imageUrl: map['imageUrl'],
        isFavorite: map['isFavorite'],
      );

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'date': date.millisecondsSinceEpoch,
      'time': time,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }
}
