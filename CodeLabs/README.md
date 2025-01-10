# CodeLab Projects

### 1) Random Words
    * 상태 관리:
        - Provider로 앱 상태(MyAppState) 관리
        - 랜덤 단어쌍 생성 및 즐겨찾기 추가/제거 기능
    
    * UI 구성:
        - 홈 화면:
            - 단어쌍 생성, 'Like' 버튼으로 즐겨찾기 추가
        - 즐겨찾기 화면:
            - 저장된 단어쌍 리스트로 표시
    
    * 화면 전환:
        - NavigationRail로 홈 ↔ 즐겨찾기 화면 전환
    
    * 디자인:
        - BigCard로 단어쌍 출력
        - 반응형 레이아웃 적용

### 2) MDC-101 (Login View)
    * 로그인 화면 구현
        * Username / Password 입력 필드 추가
        * CANCEL 버튼: 입력 초기화
        * NEXT 버튼: 새 화면으로 이동
    
    * 화면 전환(Navigation) 구현
        * Navigator.push 로 NewPage 전환
        * Builder 사용 → Navigator 오류 해결
        
    * 오류 해결
        * Navigator context 에러 수정 → MaterialApp 구조 개선 및 Builder 적용
        
    * 최종 흐름
        * 앱 실행 → 로그인 화면
        * 입력 → NEXT 클릭 → NewPage 이동
        * CANCEL 클릭 → 입력 초기화

### 3) MDC-102 (리스트 뷰 생성)
      * 상단 AppBar 추가
         * Menu, Search, Filter
         * AppBar Title 추가

      * Grid View + List
         * 그리드 위젯 사용하여 제품 목록 표시
         * 각 제품 카드 형태로 표시

      * 카드 위젯 사용
         * 제품 정보: 가격, 제품명, 이미지(Shrine_Image 패키지 현재 사용 불가 상태)

      * Shrine_Image 패키지 사용 하려 하였으나, 패키지 사용 불가로 텍스트로 대체하여 출력
