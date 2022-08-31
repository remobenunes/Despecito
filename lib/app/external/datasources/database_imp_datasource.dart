import '../../data/datasources/database_datasource.dart';

class DatabaseImpDatasource implements DatabaseDatasource {
  @override
  create() {
    print('create');
  }

  @override
  delete() {
    print('delete');
  }

  @override
  read() {
    print('read');
  }

  @override
  update() {
    print('update');
  }
}
