import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:citeasy_lite/constants/app_colors.dart';

class SideMenu extends StatelessWidget {
	final int selectedIndex;
	final ValueChanged<int> onItemSelected;

	const SideMenu({
		super.key,
		required this.selectedIndex,
		required this.onItemSelected,
	});

	@override
	Widget build(BuildContext context) {
		return Material(
			color: AppColors.surface,
			child: SafeArea(
				child: Container(
					width: 240,
					padding: const EdgeInsets.symmetric(vertical: 24),
					color: AppColors.surface,
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							const Padding(
								padding: EdgeInsets.symmetric(horizontal: 24),
								child: Text(
									'CITEASY',
									style: TextStyle(
										fontSize: 24,
										fontWeight: FontWeight.bold,
										color: AppColors.onSurface,
										decoration: TextDecoration.none,
									),
								),
							),
							const SizedBox(height: 32),
							_navItem(
								icon: PhosphorIcons.bookOpen,
								label: '내 서재',
								index: 0,
								selected: selectedIndex == 0,
								onTap: () => onItemSelected(0),
							),
							_navItem(
								icon: PhosphorIcons.gearSix,
								label: '설정',
								index: 1,
								selected: selectedIndex == 1,
								onTap: () => onItemSelected(1),
							),
							const Spacer(),
							_navItem(
								icon: PhosphorIcons.arrowCounterClockwise,
								label: '불러오기',
								index: 2,
								selected: false,
								onTap: () {},
							),
							_navItem(
								icon: PhosphorIcons.question,
								label: '도움말',
								index: 3,
								selected: false,
								onTap: () {},
							),
						],
					),
				),
			),
		);
	}

	Widget _navItem({
		required IconData icon,
		required String label,
		required int index,
		required bool selected,
		required VoidCallback onTap,
	}) {
		return InkWell(
			onTap: onTap,
			child: Container(
				width: double.infinity,
				padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
				margin: const EdgeInsets.only(bottom: 4),
				decoration: BoxDecoration(
					color: selected ? AppColors.primary : Colors.transparent,
					// borderRadius: BorderRadius.circular(8),
				),
				child: Row(
					children: [
						Icon(
							icon,
							color: selected ? AppColors.onSurface : AppColors.textSecondary,
							size: 20,
						),
						const SizedBox(width: 12),
						Text(
							label,
							style: TextStyle(
								fontSize: 16,
								color: selected ? AppColors.onSurface : AppColors.textSecondary,
								fontWeight: selected ? FontWeight.bold : FontWeight.normal,
								decoration: TextDecoration.none,
							),
						),
					],
				),
			),
		);
	}
}
