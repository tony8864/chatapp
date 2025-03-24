part of 'explore_bloc.dart';

sealed class ExploreEvent {}

class SearchUsersEvent extends ExploreEvent {
  final String query;

  SearchUsersEvent(this.query);
}
