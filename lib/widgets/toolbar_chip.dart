import 'package:flutter/material.dart';

class ToolbarChip extends StatelessWidget {
	final String label;
	final bool isSelected;
	final VoidCallback onPressed;

	const ToolbarChip({
		super.key,
		required this.label,
		required this.isSelected,
		required this.onPressed,
	});

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);

		final backgroundColor = isSelected
			? theme.colorScheme.primary.withOpacity(0.15)
			: theme.colorScheme.surfaceVariant;
		final borderColor = isSelected
			? theme.colorScheme.primary
			: theme.dividerColor;
		final textColor = isSelected
			? theme.colorScheme.primary
			: theme.colorScheme.onSurface;

		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 4),
			child: InkWell(
				borderRadius: BorderRadius.circular(6),
				onTap: onPressed,
				child: Container(
					padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
					decoration: BoxDecoration(
						color: backgroundColor,
						border: Border.all(color: borderColor),
						borderRadius: BorderRadius.circular(6),
					),
					child: Text(
						label,
						style: TextStyle(
							color: textColor,
							fontWeight: FontWeight.w500,
							fontSize: 13,
						),
					),
				),
			),
		);
	}
}
