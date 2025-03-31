import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Clipboard 관련 import
import 'package:citeasy_lite/constants/app_colors.dart';
import 'package:citeasy_lite/models/reference_item.dart';
import 'package:citeasy_lite/widgets/citation_card.dart';
import 'package:citeasy_lite/widgets/preview_panel.dart';
import 'package:citeasy_lite/widgets/top_toolbar.dart';

class HomeView extends StatefulWidget {
	const HomeView({super.key});

	@override
	State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
	final List<ReferenceItem> _allItems = [
		ReferenceItem(title: "Flutter for Beginners", author: "John Smith", year: "2021"),
		ReferenceItem(title: "Advanced Dart", author: "Jane Doe", year: "2022"),
		ReferenceItem(title: "Effective State Management", author: "Alex Johnson", year: "2023"),
	];

	final List<ReferenceItem> _selectedItems = [];

	bool _showPreview = false;

	final TextEditingController _searchController = TextEditingController();

	void _onToggle(ReferenceItem item) {
		setState(() {
			if (_selectedItems.contains(item)) {
				_selectedItems.remove(item);
			} else {
				_selectedItems.add(item);
			}
			_showPreview = _selectedItems.isNotEmpty;
		});
	}

	void _onHidePreview() {
		setState(() {
			_showPreview = false;
			_selectedItems.clear();
		});
	}

	void _onGeneratePressed() {
		if (_selectedItems.isEmpty) return;

		final citationText = _selectedItems
			.map((item) => '${item.author} (${item.year}). ${item.title}.')
			.join('\n');

		Clipboard.setData(ClipboardData(text: citationText));
		ScaffoldMessenger.of(context).showSnackBar(
			const SnackBar(
				content: Text('복사되었습니다'),
				duration: Duration(seconds: 2),
			),
		);

		setState(() {
			_showPreview = false;
			_selectedItems.clear();
		});
	}

	void _onSearchChanged(String query) {
		setState(() {
			// 검색 기능 미구현 상태
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: AppColors.background,
			body: Stack(
				children: [
					Padding(
						padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								TopToolbar(
									searchController: _searchController,
									onSearchChanged: _onSearchChanged,
									onGeneratePressed: _onGeneratePressed,
                                    isGenerateEnabled: _selectedItems.isNotEmpty,
								),
								const SizedBox(height: 24),
								Expanded(
									child: ListView.separated(
										itemCount: _allItems.length,
										separatorBuilder: (_, __) => const SizedBox(height: 12),
										itemBuilder: (context, index) {
											final item = _allItems[index];
											return CitationCard(
												item: item,
												isSelected: _selectedItems.contains(item),
												onToggle: () => _onToggle(item),
											);
										},
									),
								),
							],
						),
					),
					if (_showPreview)
						Align(
							alignment: Alignment.bottomCenter,
							child: PreviewPanel(
								selectedItems: _selectedItems,
								onGenerate: _onGeneratePressed,
								onHide: _onHidePreview,
							),
						),
				],
			),
		);
	}
}
