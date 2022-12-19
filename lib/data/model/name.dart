import 'dart:convert';

class Name {
  final String en;
  final String ptPT;
  final String ptBR;
  Name({
    required this.en,
    required this.ptPT,
    required this.ptBR,
  });

  Name copyWith({
    String? en,
    String? ptPT,
    String? ptBR,
  }) {
    return Name(
      en: en ?? this.en,
      ptPT: ptPT ?? this.ptPT,
      ptBR: ptBR ?? this.ptBR,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'en': en,
      'pt-PT': ptPT,
      'pt-BR': ptBR,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      en: map['en'] as String,
      ptPT: map['pt-PT'] as String,
      ptBR: map['pt-BR'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) => Name.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Name(en: $en, ptPT: $ptPT, ptBR: $ptBR)';

  @override
  bool operator ==(covariant Name other) {
    if (identical(this, other)) return true;
  
    return 
      other.en == en &&
      other.ptPT == ptPT &&
      other.ptBR == ptBR;
  }

  @override
  int get hashCode => en.hashCode ^ ptPT.hashCode ^ ptBR.hashCode;
}