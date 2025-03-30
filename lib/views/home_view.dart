import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/reference_view_model.dart';
import '../widgets/top_toolbar.dart';
import '../widgets/citation_card.dart';
import '../widgets/preview_panel.dart';

class HomeView extends StatelessWidget {
    const HomeView({super.key});

    @override
    Widget build(BuildContext context) {
        return ChangeNotifierProvider(
            create: (_) => ReferenceViewModel(),
            child: Scaffold(
                appBar: AppBar(
                    title: const Text("Citeasy"),
                ),
                body: Column(
                    children: [
                        const TopToolbar(),

                        Expanded(
                            child: Consumer<ReferenceViewModel>(
                                builder: (context, viewModel, _) {
                                    return ListView.builder(
                                        itemCount: viewModel.references.length,
                                        itemBuilder: (context, index) {
                                            final item = viewModel.references[index];
                                            final isSelected = viewModel.selectedItemIds.contains(item.id);
                                            return CitationCard(
                                                item: item,
                                                isSelected: isSelected,
                                                onToggle: () => viewModel.toggleSelection(item.id),
                                            );
                                        },
                                    );
                                },
                            ),
                        ),

                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Consumer<ReferenceViewModel>(
                                builder: (context, viewModel, _) {
                                    return SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                            onPressed: viewModel.selectedItems.isEmpty
                                                ? null
                                                : () => viewModel.handleCitation(context),
                                            icon: const Icon(Icons.copy),
                                            label: const Text("참고문헌 생성"),
                                        ),
                                    );
                                },
                            ),
                        ),

                        const PreviewPanel(),
                    ],
                ),
            ),
        );
    }
}
