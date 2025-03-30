import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
	const SideMenu({super.key});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: 240, // 좌측 메뉴 너비
			color: Theme.of(context).colorScheme.surfaceVariant,
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					const SizedBox(height: 24),
					_buildMenuItem(context, Icons.folder_copy, '내 서재', onTap: () {
						// TODO: 내 서재 화면으로 이동
					}),
					_buildMenuItem(context, Icons.format_quote, '인용 양식', onTap: () {
						// TODO: 인용 양식 화면으로 이동
					}),
					_buildMenuItem(context, Icons.settings, '설정', onTap: () {
						// TODO: 설정 화면으로 이동
					}),
					const Spacer(),
					Padding(
						padding: const EdgeInsets.all(16.0),
						child: Text(
							'v1.0.0',
							style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey),
						),
					),
				],
			),
		);
	}

	Widget _buildMenuItem(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
		return InkWell(
			onTap: onTap,
			child: Padding(
				padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
				child: Row(
					children: [
						Icon(icon, size: 20, color: Theme.of(context).colorScheme.onSurface),
						const SizedBox(width: 12),
						Text(
							title,
							style: Theme.of(context).textTheme.bodyMedium,
						),
					],
				),
			),
		);
	}
}
