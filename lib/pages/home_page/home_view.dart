import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/common/components/background_img.dart';
import 'package:flutter_application_todo_scream/common/components/best_todo_list_item.dart';
import 'package:flutter_application_todo_scream/common/components/ice_cream_image_item.dart';
import 'package:flutter_application_todo_scream/constants/assets.dart';
import 'package:flutter_application_todo_scream/constants/best_todo_sort.dart';
import 'package:flutter_application_todo_scream/constants/custom_colors.dart';
import 'package:flutter_application_todo_scream/constants/ice_cream_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  onBottomIconTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.homeTextImage),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Best todo",
                        style: TextStyle(
                          color: CustomColors.defaultColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomColors.lightPinkColor,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ...sortedTodoList
                                    .take(3)
                                    .map((todo) => BestTodoListItem(todo: todo))
                              ],
                            )),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Today's Ice cream",
                            style: TextStyle(
                              color: CustomColors.defaultColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 160,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: iceCream.length,
                              itemBuilder: (context, index) =>
                                  IceCreamImagesItem(iceCream: iceCream[index]),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Container(
                            width: 360,
                            height: 160,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Assets.homeBannerImage),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.navigationBarColor,
        elevation: 0,
        unselectedItemColor: CustomColors.textDefaultColor,
        selectedItemColor: CustomColors.textDefaultColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: selectedIndex,
        onTap: onBottomIconTap,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.homeIconImage,
              width: 24,
              height: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.communityIconImage,
              width: 24,
              height: 24,
            ),
            label: "community",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.profileIconImage,
              width: 24,
              height: 24,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
