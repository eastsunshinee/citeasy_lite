import 'package:flutter/material.dart';
import '../models/reference_item.dart';

class CitationCard extends StatelessWidget {
    final ReferenceItem item;
    final bool isSelected;
    final VoidCallback onToggle;

    const CitationCard({
        super.key,
        required this.item,
        required this.isSelected,
        required this.onToggle,
    });

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onToggle,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                        : Theme.of(context).colorScheme.surface,
                    border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                            item.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                            ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                            "${item.author} · ${item.year}",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
