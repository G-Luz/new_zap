import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ContactItemSkeletonLoading extends StatelessWidget {
  const ContactItemSkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 40,
            width: 40,
            child: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonLine(
                style: SkeletonLineStyle(
                  alignment: Alignment.center,
                  height: 25,
                  width: deviceSize.width * .6,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(height: 5),
              SkeletonLine(
                style: SkeletonLineStyle(
                  alignment: Alignment.center,
                  height: 20,
                  width: deviceSize.width * .3,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppListSkeletonLoading extends StatelessWidget {
  const AppListSkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: deviceHeight * .7,
      width: deviceWidth,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              const SkeletonLine(
                style: SkeletonLineStyle(
                  width: 70,
                  height: 70,
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: deviceWidth * .5,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 40,
                      ),
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 20,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 40,
                    width: deviceWidth * .1,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
