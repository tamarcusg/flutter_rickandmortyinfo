import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RickAndMortySearchBar extends StatelessWidget {
  final String searchString;
  final Function(String) onSearchChanged;
  final bool isEnabled;

  RickAndMortySearchBar({
    required this.searchString,
    required this.onSearchChanged,
    this.isEnabled = true,
    super.key,
  });

  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    _controller.text = searchString;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: searchString.length),
    );
    _focusNode.requestFocus();
    return SearchBar(
      controller: _controller,
      focusNode: _focusNode,
      hintText: AppLocalizations.of(context)!.search_bar_hint,
      elevation: const WidgetStatePropertyAll(2),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.only(left: 8),
      ),
      trailing: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _controller.clear();
            onSearchChanged('');
          },
        ),
      ],
      onChanged: (value) {
        onSearchChanged(value);
      },
    );
  }
}
