part of 'imports.dart';

class _Top extends StatelessWidget {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreVM>(
      builder: (context, ExploreVM vm, _) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Hero(
                  tag: "${vm.course.id}avatar",
                  child: SizedBox(
                    height: 350,
                    child: CachedNetworkImage(
                      imageUrl: vm.course.avatar,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                        return Shimmer.fromColors(
                          baseColor: kWhite,
                          highlightColor: kBlack,
                          child: Container(
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 60,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.3),
                              spreadRadius: 4,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                          color: kWhite,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          CupertinoIcons.chevron_left,
                          color: kBlack,
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              child: Container(
                height: 20,
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreVM>(
      builder: (context, ExploreVM vm, _) {
        return Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: const BoxDecoration(
              color: kWhite,
            ),
            child: ListView(
              children: [
                Shimmer.fromColors(
                  highlightColor: kBlack.withOpacity(.3),
                  baseColor: kBlack,
                  child: Text(
                    vm.course.title,
                    style: GoogleFonts.robotoSlab(
                      fontSize: 20,
                      color: kBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const _Info(),
                const SizedBox(height: 20),
                const _About(),
                const SizedBox(height: 20),
                Column(
                  children: vm.course.chapters
                      .map(
                        (e) => _CourseItem(video: e),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/people.png",
          height: 20,
          color: kYellow,
        ),
        const SizedBox(width: 7.5),
        Shimmer.fromColors(
          highlightColor: kBlack.withOpacity(.3),
          baseColor: kBlack,
          child: Text(
            "250 ta O'quvchilar",
            style: GoogleFonts.robotoSlab(
              color: kBlack.withOpacity(.5),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          "assets/icons/star.png",
          height: 20,
          color: kYellow,
        ),
        const SizedBox(width: 5),
        Shimmer.fromColors(
          highlightColor: kBlack.withOpacity(.3),
          baseColor: kBlack,
          child: Text(
            "9.5",
            style: GoogleFonts.robotoSlab(
              color: kBlack.withOpacity(.5),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          "assets/icons/heart.png",
          height: 20,
          color: kYellow,
        ),
        const SizedBox(width: 5),
        Shimmer.fromColors(
          highlightColor: kBlack.withOpacity(.3),
          baseColor: kBlack,
          child: Text(
            "20,000",
            style: GoogleFonts.robotoSlab(
              color: kBlack.withOpacity(.5),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class _About extends StatelessWidget {
  const _About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreVM>(
      builder: (context, ExploreVM vm, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              highlightColor: kBlack.withOpacity(.3),
              baseColor: kBlack,
              child: Text(
                "Kurs Haqida",
                style: GoogleFonts.robotoSlab(
                  color: kBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              vm.course.des,
              style: GoogleFonts.quicksand(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kBlack.withOpacity(.5),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CourseItem extends StatelessWidget {
  final VideoModel video;

  const _CourseItem({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreVM>(
      builder: (context, ExploreVM vm, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 90,
            margin: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(2, 4), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                SizedBox(
                  height: 75,
                  width: 75,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: vm.course.avatar,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          return Shimmer.fromColors(
                            baseColor: kWhite,
                            highlightColor: kBlack,
                            child: Container(
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: kWhite.withOpacity(1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          "assets/icons/play.png",
                          height: 12.5,
                          color: kBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        video.title,
                        style: GoogleFonts.robotoSlab(
                          color: kBlack,
                          fontSize: 16.5,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 7.5,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/cart.png",
                height: 25,
                color: kYellow,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(60),
                backgroundColor: kYellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.5),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    highlightColor: kBlack,
                    baseColor: kWhite,
                    child: Text(
                      "O'qishni boshlash",
                      style: GoogleFonts.robotoSlab(
                        fontSize: 20,
                        color: kWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.chevron_right,
                      color: kWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
