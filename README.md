# Cubit & BLoC Flutter Tutorial

<p align="center">
    <img align="center" src="media/app_gif.gif" width="300px"/>
</p>

This repository was created by following a [Youtube Tutorial](https://youtu.be/y564ETOCog8) related to the lib **flutter_bloc** and their way of implementation.

For both strategies, it's necessary to define all the possible states involved for each "variable". In this scenario, it was used a Weather Application as an example, so the "variable" in question is exactly the weather data model, whose information were fecthed from an API.

In this scenario, four states were defined, all extending from the abstract class WeatherState:

- WeatherInitial
- WeatherLoading
- WeatherLoaded
- WeatherError

The _WeatherLoaded_ state has a _weather_ attribute, which will carry the weather data, and the _WeatherError_ has a _message_ attribute, which can be set whenever an error occurs.

**It's important to point that all states containing any attributes need the equality override, which can be either hard coded or implemented using a package.**

&nbsp;

## The Cubit

According to the [documentation](https://bloclibrary.dev/#/coreconcepts):

> A Cubit is a special type of Stream which is used as the base for the Bloc class.

The archtecture is based in _functions_ and _states_ and its implementation is quite simpler than the _Bloc_. It basically consists on _emitting_ states, which can be mapped and the UI can respond to each of them differently.

<img src="media/cubit_architecture_full.png" />

&nbsp;

## The Bloc

Also according to the [documentation](https://bloclibrary.dev/#/coreconcepts):

> A Bloc is a special type of Cubit which transforms incoming events into outgoing states.

In this case, the archtecture changes slightly and it's based on _events_ and _states_. This implementation is quite more complex that the _Cubit_, however it can be a more interesting approach whenever the application needs to deal with several events and respond to them.

<img src="media/bloc_architecture_full.png" />

&nbsp;

## The _flutter_bloc_ package

This package is quite complete. It not only brings _Cubit_ and _Bloc_ state managements, but it also brings a built in "provider", so the instances are created in some point of the application and can be retrieved whenever necessary. This is applied both for Bloc/Cubit instances (with \_BlocProvider/MultiBlocProvider) and repositories instances (with RepositoryProvider/MultiRepositoryProvider), which helps a lot with the Dependency Injection.

&nbsp;

## Packages

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [bloc](https://pub.dev/packages/bloc)

&nbsp;

## Running the application

Considering the whole development environment is already set:

- Download/clone this repository
- In the project's root directory, run the command `flutter pub get`
- Start the application
