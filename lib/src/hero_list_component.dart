import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
import 'hero.dart';
import 'hero_component.dart';
import 'hero_service.dart';
@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives, HeroComponent],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;
  List<Hero> heros;
  Hero selected;
  HeroListComponent(this._heroService, this._router);
  Future<void> _getHeroes() async {
    heros = await _heroService.getAll();
  }
  Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    heros.add(await _heroService.create(name));
    selected = null;
  }
  Future<void> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heros.remove(hero);
    if (selected == hero) selected = null;
  }
  void ngOnInit() => _getHeroes();
  void onSelect(Hero hero) => selected = hero;
  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});
  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}