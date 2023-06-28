import 'package:flutter/material.dart';

void navigateToPage(BuildContext context, Widget page) {
  //Future.delayed를 안 하면 페이지 이동할 때 위젯 빌드 중 setState() 또는 markNeedsBuild()가 호출 되면서 에러가 뜨게 됨.
  //이 방법을 사용하면 스케줄러에 빈 가상 이벤트를 발송하고 navigateToPage 함수 호출을 다음 프레임까지 지연시킴.
  Future.delayed(
    Duration.zero,
    () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ),
      );
    },
  );
}

//================================
//이러한 방법들은 페이지가 이동됨에 있어서 문제가 발생할 때 적용하면 됨.
//또다른 방법
//================================

// WidgetsBinding.instance?.addPostFrameCallback() 사용한 해결책: 
//이 방법을 사용하면 프레임 빌드 직후 콜백을 등록하여 다음 프레임이 시작되기 전에 navigateToPage 함수를 호출.

// void navigateToPage(BuildContext context, Widget page) {
//   WidgetsBinding.instance?.addPostFrameCallback((_) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) {
//           return page;
//         },
//       ),
//     );
//   });
// }