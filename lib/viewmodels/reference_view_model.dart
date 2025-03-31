import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/reference_item.dart';

// class ReferenceItem {
//     final String id;
//     final String title;
//     final String author;
//     final String year;

//     ReferenceItem({
//         required this.id,
//         required this.title,
//         required this.author,
//         required this.year,
//     });

//     String get citationText => "[$author($year)]";
// }

class ReferenceViewModel extends ChangeNotifier {
    final List<ReferenceItem> references = [
        ReferenceItem(title: 'Understanding Flutter', author: 'John Doe', year: '2024'),
        ReferenceItem(title: 'Cross-platform UIs', author: 'Jane Smith', year: '2023'),
    ];

    final Set<String> selectedItemIds = {};

    List<ReferenceItem> get selectedItems =>
        references.where((item) => selectedItemIds.contains(item.id)).toList();

    void toggleSelection(String id) {
        if (selectedItemIds.contains(id)) {
            selectedItemIds.remove(id);
        } else {
            selectedItemIds.add(id);
        }
        notifyListeners();
    }

    Future<void> handleCitation(BuildContext context) async {
        final citations = selectedItems.map((e) => e.citationText).join("\n");
        await Clipboard.setData(ClipboardData(text: citations));

        ScaffoldMessenger.of(context).showSnackBar(
            
            SnackBar(
                content: Text("인용문이 클립보드에 복사되었습니다."),
            ),
        );
    }
}
