part of 'explore_bloc.dart';

enum ExploreStateStatus { initial, loading, success, failure }

class ExploreState extends Equatable {
  final ExploreStateStatus status;
  final List<AppUser> results;
  final String errorMsg;

  const ExploreState({
    this.status = ExploreStateStatus.initial,
    this.results = const [],
    this.errorMsg = '',
  });

  ExploreState copyWith({ExploreStateStatus? status, List<AppUser>? results, String? errorMsg}) {
    return ExploreState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      results: results ?? this.results,
    );
  }

  @override
  List<Object> get props => [status, results, errorMsg];
}
