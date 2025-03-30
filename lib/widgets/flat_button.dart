import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
	final String label;
	final VoidCallback? onPressed;
	final bool isEnabled;

	const FlatButton({
		super.key,
		required this.label,
		required this.onPressed,
		this.isEnabled = true,
	});

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);
		final backgroundColor = isEnabled
				? theme.colorScheme.surfaceVariant
				: theme.disabledColor.withOpacity(0.1);
		final foregroundColor = isEnabled
				? theme.colorScheme.onSurface
				: theme.disabledColor;

		return TextButton(
			onPressed: isEnabled ? onPressed : null,
			style: TextButton.styleFrom(
				backgroundColor: backgroundColor,
				foregroundColor: foregroundColor,
				padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
				shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(6),
				),
				textStyle: const TextStyle(fontSize: 13),
			),
			child: Text(label),
		);
	}
}
