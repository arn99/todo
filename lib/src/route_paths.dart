import 'package:angular_router/angular_router.dart';


const idParam = 'id';
class RoutePaths {
  static final hero = RoutePath(path: '${heros.path}/:$idParam');
  static final heros = RoutePath(path: 'heros');
  static final dashboard = RoutePath(path: 'dashboard');

  
}
int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}