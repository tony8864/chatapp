import 'package:chatapp/features/explore/bloc/explore_bloc.dart';
import 'package:chatapp/features/explore/screens/widgets/user_search_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreSearchBuilder extends StatelessWidget {
  const ExploreSearchBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ExploreBloc, ExploreState>(
        builder: (context, state) {
          switch (state.status) {
            case ExploreStateStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ExploreStateStatus.success:
              return UserSearchResults(displayedResults: state.results);
            case ExploreStateStatus.failure:
              return Center(child: Text(state.errorMsg));
            case ExploreStateStatus.initial:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
