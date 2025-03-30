import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:citeasy_lite/viewmodels/citation_view_model.dart';
import 'package:citeasy_lite/widgets/top_toolbar.dart';
import 'package:citeasy_lite/widgets/citation_card.dart';
import 'package:citeasy_lite/widgets/preview_panel.dart';

class HomeView extends StatelessWidget {
	const HomeView({super.key});

	@override
	Widget build(BuildContext context) {
		return ChangeNotifierProvider(
			create: (_) => CitationViewModel(),
			child: Consumer<CitationViewModel>(
				builder: (context, vm, _) {
					return Scaffold(
						backgroundColor: Theme.of(context).colorScheme.surface,
						body: Column(
							children: [
								TopToolbar(
									sorting: vm.sorting,
									onSortingChanged: vm.updateSorting,
									searchController: vm.searchController,
									onSearchChanged: vm.updateSearch,
									onGeneratePressed: vm.generateCitation,
								),
								const Divider(height: 1),
								Expanded(
									child: ListView.builder(
										padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
										itemCount: vm.filteredCitations.length,
										itemBuilder: (context, index) {
											final item = vm.filteredCitations[index];
											return Padding(
												padding: const EdgeInsets.only(bottom: 8),
												child: CitationCard(
													item: item,
													isSelected: false, // 추후 상태에 맞게 연결
													onToggle: () {},   // 선택 토글 로직 연결 가능
												),
											);
										},
									),
								),
								const PreviewPanel(),
							],
						),
					);
				},
			),
		);
	}
}
