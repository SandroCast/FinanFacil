import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN USUARIOS
Future<List<UsuariosRow>> performUsuarios(
  Database database,
) {
  final query = '''
select * from usuarios;
''';
  return _readQuery(database, query, (d) => UsuariosRow(d));
}

class UsuariosRow extends SqliteRow {
  UsuariosRow(Map<String, dynamic> data) : super(data);

  int? get id => data['ID'] as int?;
  String? get name => data['Name'] as String?;
}

/// END USUARIOS
