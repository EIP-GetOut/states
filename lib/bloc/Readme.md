# Bloc Under Flutter

## Instalation of bloc packages and dependencies

flutter pub get flutter_bloc<version>
flutter pub get bloc<version>

## BLoC

Initially Business Logic Component (BLoC) pattern was introduced by Google as a solution to handle
states in Flutter applications. 
It allows you to reduce the workload on UI components by separating the business logic from them.
Over time, other frameworks also started to support the BLoC pattern.

## flutterBloc 

bloc & flutter_bloc help to handle this pattern inside Flutter App.
flutterBloc is widely used and `dart package` website notice a score of popularity of 100/100. 

## Usage

flutter_bloc use new class named <Data>Bloc that inerit from Bloc or Cubit type to handle noe

### Initializing class <Data>Bloc

```dart
abstract class ThemeEvent {}
class ThemePressed extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(_lightTheme) {
    on<ThemePressed>((event, emit) =>
        emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme));
  }
  static final _lightTheme = ThemeData(...);
  static final _darkTheme = ThemeData(...);
}
```

### Bloc vs Cubit

Cubit is a simplified version of Bloc and Bloc is event driven

- Bloc is more complex and follows an event-driven architecture where events trigger state changes.
- Cubit is simpler and does not have an explicit event layer; it directly updates the state in response to method calls.

### Provide Bloc
call this as the return of the widget in `StatelessWidget``
```dart
  @override
  Widget build(BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeBloc()),
        ],
        child: const AppView()
      );
  }
```

### Builder Bloc

Build it where you want to use it.

```dart
@override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final theme = context.watch<ThemeBloc>().state;
      return MaterialApp(
        theme: theme,
        home: const CounterPage(),
      );
    });
  }
```

## Logs

You can have logs about every event/transition about the states of you blocs.

```dart
class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc,
      Transition<dynamic, dynamic> transition,
      ) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
```

### Cubits

Yes Cubit & Bloc can be used together but it's prettier if you use only one.
