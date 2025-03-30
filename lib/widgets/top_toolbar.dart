import 'package:flutter/material.dart';
import 'package:citeasy_lite/widgets/flat_button.dart';
import 'package:citeasy_lite/widgets/primary_action_button.dart';
import 'package:citeasy_lite/widgets/toolbar_chip.dart';
import 'package:citeasy_lite/widgets/search_input_field.dart';

class TopToolbar extends StatelessWidget {
	const TopToolbar({
		super.key,
		required this.sorting,
		required this.onSortingChanged,
		required this.searchController,
		required this.onSearchChanged,
		required this.onGeneratePressed,
	});

	final String sorting;
	final void Function(String) onSortingChanged;
	final TextEditingController searchController;
	final void Function(String) onSearchChanged;
	final VoidCallback onGeneratePressed;

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
			child: Column(
				children: [
					Row(
						children: [
							FlatButton(label: "양식: APA", onPressed: () {}),
							const SizedBox(width: 8),
							FlatButton(label: "언어: 한국어", onPressed: () {}),
							const Spacer(),
							PrimaryActionButton(
								label: "참고문헌 생성",
								icon: Icons.menu_book_rounded,
								onPressed: onGeneratePressed,
							),
						],
					),
					const SizedBox(height: 12),
					Row(
						children: [
							ToolbarChip(
								label: "최신순",
								isSelected: sorting == '최신순',
								onPressed: () => onSortingChanged('최신순'),
							),
							ToolbarChip(
								label: "등록순",
								isSelected: sorting == '등록순',
								onPressed: () => onSortingChanged('등록순'),
							),
							const Spacer(),
							SizedBox(
								width: 240,
								child: SearchInputField(
									controller: searchController,
									hintText: "참고문헌 검색",
									onChanged: onSearchChanged,
								),
							),
						],
					),
				],
			),
		);
	}
}
