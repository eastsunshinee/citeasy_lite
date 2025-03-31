import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:citeasy_lite/constants/app_colors.dart';
import 'package:citeasy_lite/models/reference_item.dart';

class PreviewPanel extends StatelessWidget {
	final List<ReferenceItem> selectedItems;
	final VoidCallback onGenerate;
	final VoidCallback onHide;

	const PreviewPanel({
		required this.selectedItems,
		required this.onGenerate,
		required this.onHide,
		super.key,
	});

	String _generateCitationText(List<ReferenceItem> items) {
		return items.map((item) {
			return '${item.author} (${item.year}). ${item.title}.';
		}).join('\n');
	}

	void _copyToClipboard(BuildContext context, String text) {
		Clipboard.setData(ClipboardData(text: text));
		ScaffoldMessenger.of(context).showSnackBar(
			const SnackBar(
				content: Text('복사되었습니다'),
				behavior: SnackBarBehavior.floating,
				duration: Duration(seconds: 2),
			),
		);
		onHide(); // 복사 후 패널 숨김
	}

	@override
	Widget build(BuildContext context) {
		if (selectedItems.isEmpty) return const SizedBox.shrink();

		final citationText = _generateCitationText(selectedItems);

		return Align(
			alignment: Alignment.bottomCenter,
			child: Container(
				width: double.infinity,
				padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
				color: AppColors.surfaceContainerHighest,
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: [
						Expanded(
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								mainAxisSize: MainAxisSize.min,
								children: [
									const Text(
										'인용 미리보기',
										style: TextStyle(
											color: AppColors.textSecondary,
											fontSize: 13,
										),
									),
									const SizedBox(height: 8),
									Text(
										citationText,
										style: const TextStyle(
											color: AppColors.textPrimary,
											fontSize: 14,
										),
									),
								],
							),
						),
						const SizedBox(width: 16),
						ElevatedButton(
							style: ElevatedButton.styleFrom(
								backgroundColor: AppColors.primary,
								foregroundColor: AppColors.onSurface,
								padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
								textStyle: const TextStyle(fontSize: 14),
							),
							onPressed: () => _copyToClipboard(context, citationText),
							child: const Text('인용하기'),
						),
					],
				),
			),
		);
	}
}
