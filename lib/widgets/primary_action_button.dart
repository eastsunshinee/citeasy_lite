import 'package:flutter/material.dart';
import 'package:citeasy_lite/constants/app_colors.dart';

class PrimaryActionButton extends StatelessWidget {
	final String label;
	final VoidCallback? onPressed;
	final IconData? icon;
	final bool isEnabled;

	const PrimaryActionButton({
		super.key,
		required this.label,
		this.onPressed,
		this.icon,
		this.isEnabled = true,
	});

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);
		final backgroundColor = isEnabled
			? AppColors.primary
			: AppColors.onSurface.withOpacity(0.3);
		final foregroundColor = AppColors.onSurface;

		return SizedBox(
			height: 44,
			child: ElevatedButton.icon(
				onPressed: isEnabled ? onPressed : null,
				icon: icon != null
					? Icon(icon, size: 18, color: foregroundColor)
					: const SizedBox.shrink(),
				label: Text(
					label,
					style: const TextStyle(
						color: Colors.white,
						fontWeight: FontWeight.bold,
						fontSize: 14,
					),
				),
				style: ElevatedButton.styleFrom(
					backgroundColor: backgroundColor,
					disabledBackgroundColor: backgroundColor,
					padding: const EdgeInsets.symmetric(horizontal: 20),
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(8),
					),
					elevation: isEnabled ? 2 : 0,
				),
			),
		);
	}
}
