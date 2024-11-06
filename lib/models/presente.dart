class Presente {
  String id;
  String titulo;
  String descricao;
  DateTime data;

  Presente({required this.id, required this.titulo, required this.descricao, required this.data});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'data': data.toIso8601String(),
    };
  }

  factory Presente.fromMap(Map<String, dynamic> map) {
    return Presente(
      id: map['id'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      data: DateTime.parse(map['data']),
    );
  }
}
