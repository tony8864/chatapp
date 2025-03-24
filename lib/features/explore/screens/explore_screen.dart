import 'dart:async';
import 'package:chatapp/core/routes/app_navigator.dart';
import 'package:chatapp/features/explore/bloc/explore_bloc.dart';
import 'package:chatapp/features/explore/screens/widgets/explore_search_builder.dart';
import 'package:chatapp/shared/widgets/bottom_nav_bar.dart';
import 'package:chatapp/shared/widgets/custom_search_bar.dart';
import 'package:chatapp/shared/widgets/screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScren extends StatefulWidget {
  const ExploreScren({super.key});

  @override
  State<ExploreScren> createState() => _ExploreScrenState();
}

class _ExploreScrenState extends State<ExploreScren> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<ExploreBloc>().add(SearchUsersEvent(query.trim()));
    });

    setState(() {});
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<ExploreBloc>().add(SearchUsersEvent(''));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ScreenTitle(title: 'Explore'),
            Divider(color: const Color.fromARGB(255, 195, 195, 195)),
            const SizedBox(height: 24),
            CustomSearchBar(
              hintText: 'Search users',
              controller: _searchController,
              onChanged: _onSearchChanged,
              onClearChanged: _clearSearch,
            ),
            const SizedBox(height: 24),
            ExploreSearchBuilder(),
            BottomNavBar(appPage: AppPage.explore),
          ],
        ),
      ),
    );
  }
}
