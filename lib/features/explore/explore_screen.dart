import 'dart:async';
import 'package:chatapp/core/routes/app_navigator.dart';
import 'package:chatapp/features/explore/widgets/user_search_results.dart';
import 'package:chatapp/shared/widgets/bottom_nav_bar.dart';
import 'package:chatapp/shared/widgets/custom_search_bar.dart';
import 'package:chatapp/shared/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class ExploreScren extends StatefulWidget {
  const ExploreScren({super.key});

  @override
  State<ExploreScren> createState() => _ExploreScrenState();
}

class _ExploreScrenState extends State<ExploreScren> {
  final _searchController = TextEditingController();

  final List<String> fakeUsers = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie Lee',
    'Diana Prince',
    'Ethan Hunt',
    'Fiona Adams',
  ];

  List<String> displayedResults = [];
  bool isSearching = false;
  Timer? _debounce;

  void performSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedResults = [];
        isSearching = false;
      });
      return;
    }

    // TODO: Replace this block with backend API call
    final filtered =
        fakeUsers.where((user) => user.toLowerCase().contains(query.toLowerCase())).toList();

    setState(() {
      displayedResults = filtered;
      isSearching = false;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {}); // For suffixIcon visibility

    _debounce?.cancel();

    setState(() {
      isSearching = true;
    });

    _debounce = Timer(const Duration(milliseconds: 500), () {
      performSearch(query.trim().toLowerCase());
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      displayedResults = [];
    });
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
            UserSearchResults(isSearching: isSearching, displayedResults: displayedResults),
            BottomNavBar(appPage: AppPage.explore),
          ],
        ),
      ),
    );
  }
}
