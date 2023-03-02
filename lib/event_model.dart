class EventModel {
  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.country,
    required this.date,
  });

  final int id;
  final String title;
  final String description;
  final String country;
  final DateTime date;
  static const idKey = 'id';
  static const titleKey = 'title';
  static const descriptionKey = 'description';
  static const countryKey = 'country';
  static const dateKey = 'date';

  toMap() {
    return {
      idKey: id,
      titleKey: title,
      descriptionKey: description,
      countryKey: country,
      dateKey: date,
    };
  }

  EventModel.fromMap(Map<String, dynamic> map)
      : id = map[idKey],
        title = map[titleKey],
        description = map[descriptionKey],
        country = map[countryKey],
        date = map[dateKey];
}
