import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/reference_view_model.dart';

class TopToolbar extends StatelessWidget {
    const TopToolbar({super.key});

    @override
    Widget build(BuildContext context) {
        final vm = context.watch<ReferenceViewModel>();

        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
                children: [
                    const Text(
                        "정렬 기준:",
                        style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                        value: "최신순", // 실제 옵션 없음
                        items: const [
                            DropdownMenuItem(value: "최신순", child: Text("최신순")),
                            DropdownMenuItem(value: "오래된순", child: Text("오래된순")),
                        ],
                        onChanged: (value) {
                            // 정렬 기능 미구현이므로 비워둠
                        },
                    ),
                    const Spacer(),
                    const Text("사용 중인 양식:"),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: () {
                            // 향후 스타일 변경 처리
                        },
                        child: const Text("APA 7th"),
                    ),
                    const SizedBox(width: 12),
                    ToggleButtons(
                        isSelected: const [true, false],
                        onPressed: (index) {
                            // 언어 토글 (국문/영문) 기능 미구현
                        },
                        children: const [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text("국문"),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text("영문"),
                            ),
                        ],
                    )
                ],
            ),
        );
    }
}
