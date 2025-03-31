import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
	final TextEditingController controller;
	final String hintText;
	final ValueChanged<String>? onChanged;

	const SearchInputField({
		super.key,
		required this.controller,
		this.hintText = '검색어를 입력하세요',
		this.onChanged,
	});

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);

		return Container(
			height: 36,
			padding: const EdgeInsets.symmetric(horizontal: 8),
			decoration: BoxDecoration(
				color: theme.colorScheme.surfaceVariant,
				borderRadius: BorderRadius.circular(6),
				border: Border.all(
					color: theme.dividerColor,
					width: 1,
				),
			),
			child: Row(
				children: [
					const Icon(Icons.search, size: 16, color: Colors.grey),
					const SizedBox(width: 6),
					Expanded(
						child: TextField(
							controller: controller,
							onChanged: onChanged,
							style: const TextStyle(fontSize: 13),
							decoration: InputDecoration(
								border: InputBorder.none,
								hintText: hintText,
								hintStyle: TextStyle(color: theme.hintColor),
								isDense: true,
							),
						),
					),
				],
			),
		);
	}
}
