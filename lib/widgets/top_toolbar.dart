// lib/widgets/top_toolbar.dart
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'search_input_field.dart';
import 'primary_action_button.dart';

class TopToolbar extends StatelessWidget {
	final TextEditingController searchController;
	final void Function(String) onSearchChanged;
	final void Function() onGeneratePressed;
    final bool isGenerateEnabled;

	const TopToolbar({
		Key? key,
		required this.searchController,
		required this.onSearchChanged,
		required this.onGeneratePressed,
        this.isGenerateEnabled = true,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
			color: AppColors.background,
			child: Row(
				children: [
					Expanded(
						child: SearchInputField(
							controller: searchController,
							onChanged: onSearchChanged,
							hintText: '논문 제목, 저자명 등으로 검색',
						),
					),
					const SizedBox(width: 12),
					PrimaryActionButton(
                        label: '참고문헌 생성',
                        icon: Icons.format_quote,
                        onPressed: onGeneratePressed,
                        isEnabled: isGenerateEnabled,
                    ),
				],
			),
		);
	}
}