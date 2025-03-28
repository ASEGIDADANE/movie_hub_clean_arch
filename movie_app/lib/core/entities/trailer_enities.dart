class TrailerEntity {
  TrailerEntity({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  final String ? iso6391;
  final String ? iso31661;
  final String ? name;
  final String ? key;
  final String ? site;
  final int ? size;
  final String ? type;
  final bool ? official;
  final DateTime ? publishedAt;
  final String ? id;


   @override
  String toString() {
    return 'TrailerEntity(iso6391: $iso6391, iso31661: $iso31661, name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, publishedAt: $publishedAt, id: $id)';
  }

}