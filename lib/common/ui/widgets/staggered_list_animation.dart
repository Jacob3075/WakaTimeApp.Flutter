import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";

class StaggeredListAnimation extends StatelessWidget {
  const StaggeredListAnimation({
    Key? key,
    required this.itemCount,
    required this.getChild,
  }) : super(key: key);

  final int itemCount;
  final Widget Function(int index) getChild;

  @override
  Widget build(BuildContext context) => AnimationLimiter(
        child: ListView.builder(
          itemCount: itemCount,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
            duration: const Duration(milliseconds: 800),
            position: index,
            child: SlideAnimation(
              verticalOffset: ScreenUtil().screenHeight,
              child: getChild(index),
            ),
          ),
        ),
      );
}
