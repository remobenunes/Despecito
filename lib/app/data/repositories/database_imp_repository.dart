import 'package:despecito/app/data/datasources/database_datasource.dart';
import '../../domain/repositories/database_repository.dart';

class DatabaseImpRepository implements DatabaseRepository {
  final DatabaseDatasource _databaseDatasource;

  DatabaseImpRepository(this._databaseDatasource);

  @override
  void create() {
    _databaseDatasource.create();
  }

  @override
  void delete() {
    _databaseDatasource.delete();
  }

  @override
  void read() {
    _databaseDatasource.read();
  }

  @override
  void update() {
    _databaseDatasource.update();
  }
}
