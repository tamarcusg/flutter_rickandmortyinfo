import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/model/character_data.dart';
import 'package:flutter_rickandmortyinfo/model/page_data.dart';
import 'package:flutter_rickandmortyinfo/network/character_repository.dart';
import 'package:flutter_rickandmortyinfo/provider/network/character_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _searchString = "";
  List<CharacterData> _characters = [];
  bool _isLoading = false;

  void _loadInitialData() async {
    setState(() {
      _isLoading = true;
    });
    final characterRepository = ref.read(characterRepositoryProvider);
    return await characterRepository.getCharacters().then((ApiResult result) {
      if (result.isSuccessful) {
        setState(() {
          _characters = (result.data as PageData).characters;
        });
        result.data as PageData;
      } else {
        throw Exception('Failed to load characters');
      }
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(title: Text('Character ${_characters[index].name}'));
      },
    );
    if (_characters.isEmpty) {
      _loadInitialData();
    }
    if (_isLoading) {
      mainContent = const Center(child: CircularProgressIndicator());
    }
    return Scaffold(body: mainContent);
  }
}
