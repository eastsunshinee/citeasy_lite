import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/reference_view_model.dart';

class PreviewPanel extends StatelessWidget {
    const PreviewPanel({super.key});

    @override
    Widget build(BuildContext context) {
        final viewModel = context.watch<ReferenceViewModel>();
        final selected = viewModel.selectedItems;

        final previewText = selected.isNotEmpty
            ? selected.map((e) => e.citationText).join("\n")
            : "선택된 참고문헌이 없습니다.";

        return Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context).dividerColor,
                    ),
                ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const Text(
                        "미리보기",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                        ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        previewText,
                        style: const TextStyle(fontSize: 15),
                    ),
                ],
            ),
        );
    }
}
