import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'src/hero_component.dart';
import 'src/hero_service.dart';
import 'src/routes.dart';
// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  template: '''
   <h1>{{title}}</h1>
  <nav>
    <a [routerLink]="RoutePaths.dashboard.toUrl()"
       [routerLinkActive]="'active'">Dashboard</a>
    <a [routerLink]="RoutePaths.heros.toUrl()"
       [routerLinkActive]="'active'">Heroes</a>
  </nav>
  <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  directives: [routerDirectives],
  providers: [ClassProvider(HeroService)],
  exports: [RoutePaths, Routes],
)
class AppComponent  {
 final  title = 'Tour de heros';
}