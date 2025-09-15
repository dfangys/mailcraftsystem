import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search mail',
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            // Handle search
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Search results will appear here.'),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CheckboxListTile(
                title: const Text('Has attachment'),
                value: false,
                onChanged: (bool? value) {},
              ),
              CheckboxListTile(
                title: const Text('Unread'),
                value: false,
                onChanged: (bool? value) {},
              ),
              // Add more filter options here
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Apply'),
              onPressed: () {
                // Handle apply filter
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

