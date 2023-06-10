import 'package:flutter/material.dart';

import '../../css/asset.dart';

//=============== bg.image.dart와 비교 ============================.
//둘 중 뭐가 더 나을까 어차피 데이터값을 할당할 일 없으니 이렇게 해도 상관 없을 거 같은데.

class BackgroundImage2 extends StatelessWidget {
  const BackgroundImage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Asset.bgImage),
        ),
      ),
    );
  }
}
