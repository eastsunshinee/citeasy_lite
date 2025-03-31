import 'package:flutter/material.dart';
import '../models/reference_item.dart';

class CitationViewModel extends ChangeNotifier {
	String sorting = '최신순';
	final TextEditingController searchController = TextEditingController();

	List<ReferenceItem> allCitations = [
        ReferenceItem(
            title: "딥러닝을 활용한 이미지 분류 모델 성능 분석",
            author: "홍길동",
            year: "2021",
        ),
        ReferenceItem(
            title: "SwiftUI 기반의 멀티 플랫폼 애플리케이션 개발",
            author: "김철수",
            year: "2022",
        ),
        ReferenceItem(
            title: "iOS 앱에서의 비동기 처리와 메모리 관리 전략",
            author: "박지민",
            year: "2023",
        ),
        ReferenceItem(
            title: "사용자 경험을 고려한 인터페이스 디자인 연구",
            author: "이영희",
            year: "2020",
        ),
        ReferenceItem(
            title: "모바일 환경에서의 Flutter 성능 최적화 기법",
            author: "정우성",
            year: "2024",
        ),
        ReferenceItem(
            title: "데이터 시각화 도구의 비교 분석",
            author: "최유리",
            year: "2019",
        ),
    ];

	List<ReferenceItem> get filteredCitations => allCitations; // 필터링 로직 나중에 추가

	void updateSorting(String value) {
		sorting = value;
		notifyListeners();
	}

	void updateSearch(String value) {
		// 검색어 기반 필터링 로직 필요
		notifyListeners();
	}

	void generateCitation() {
		// 향후 기능 구현
		debugPrint("📚 인용하기 기능 실행");
	}
}
