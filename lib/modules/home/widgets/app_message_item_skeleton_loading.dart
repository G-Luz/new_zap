import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class AppMessageItemSkeletonLoading extends StatelessWidget {
  const AppMessageItemSkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabBarSkeletonLoading(),
              TabBarSkeletonLoading(),
              TabBarSkeletonLoading(),
            ],
          ),
        ),
        const AppListSkeletonLoading(),
      ],
    );
  }
}

class TabBarSkeletonLoading extends StatelessWidget {
  const TabBarSkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SkeletonLine(
            style: SkeletonLineStyle(
              width: deviceSize.width * .25,
              height: deviceSize.height * .03,
              borderRadius: BorderRadius.circular(10),
            ),
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
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ChatItemSkeletonLoading();
        },
      ),
    );
  }
}

class ChatItemSkeletonLoading extends StatelessWidget {
  const ChatItemSkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                height: 45,
                width: 45,
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
                      height: 20,
                      width: deviceSize.width * .45,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      alignment: Alignment.center,
                      height: 20,
                      width: deviceSize.width * .25,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              SkeletonLine(
                style: SkeletonLineStyle(
                  alignment: Alignment.center,
                  height: 20,
                  width: deviceSize.width * .05,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(
                height: 20,
                width: 20,
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
