import 'package:uuid/uuid.dart';

class ReferenceItem {
	final String id;
	final String title;
	final String author;
	final String year;
	bool isSelected;

	ReferenceItem({
		String? id,
		required this.title,
		required this.author,
		required this.year,
		this.isSelected = false,
	}) : id = id ?? const Uuid().v4();

	String get citationText => "$author. ($year). $title.";
}
