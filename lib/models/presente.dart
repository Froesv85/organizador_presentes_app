class Presente {
  String id;
  String titulo;
  String descricao;
  double preco;
  DateTime data;

  Presente({required this.id, required this.titulo, required this.descricao, required this.preco, required this.data});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'preco': preco,
      'data': data.toIso8601String(),
    };
  }

  factory Presente.fromMap(Map<String, dynamic> map, String id) {
    return Presente(
      id: id,
      titulo: map['titulo'],
      descricao: map['descricao'],
      preco: map['preco'],
      data: DateTime.parse(map['data']),
    );
  }
}
