import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/reference_item.dart';

class CitationCard extends StatelessWidget {
	final ReferenceItem item;
	final VoidCallback onToggle;
	final bool isSelected;

	const CitationCard({
		super.key,
		required this.item,
		required this.onToggle,
		required this.isSelected,
	});

	@override
	Widget build(BuildContext context) {
		return Card(
			color: isSelected
					? AppColors.surfaceContainerHighest
					: AppColors.surface,
			child: ListTile(
				contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
				title: Text(
					item.title,
					style: const TextStyle(color: AppColors.textPrimary),
				),
				subtitle: Text(
					"${item.author} • ${item.year}",
					style: const TextStyle(color: AppColors.textSecondary),
				),
				trailing: Checkbox(
					value: isSelected,
					onChanged: (_) => onToggle(),
					activeColor: AppColors.primary,
                    checkColor: AppColors.onSurface,
				),
				onTap: onToggle,
			),
		);
	}
}
