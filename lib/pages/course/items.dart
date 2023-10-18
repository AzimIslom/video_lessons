part of 'imports.dart';

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: kYellow,
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "🧑",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Assalomu alaykum,  ",
          style: GoogleFonts.quicksand(
            fontSize: 15,
          ),
        ),
        Text(
          "Abduazim!",
          style: GoogleFonts.robotoSlab(
            fontSize: 17.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(12.5),
          decoration: BoxDecoration(
            color: kWhite,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Image.asset(
            "assets/icons/notification.png",
            height: 20,
          ),
        ),
      ],
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          "Eng Zo'r",
          style: GoogleFonts.tiltNeon(
            fontSize: 20,
            height: 1,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Kurslar Bizda!",
          style: GoogleFonts.tiltNeon(
            fontSize: 20,
            height: 1,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: kBlack,
                autocorrect: false,
                style: GoogleFonts.robotoSlab(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      "assets/icons/search.png",
                      height: 20,
                      color: kGrey3,
                    ),
                  ),
                  fillColor: kGrey2,
                  hintText: "Kurs nomini kiriting...",
                  hintStyle: GoogleFonts.playfair(
                    color: kGrey3,
                    fontSize: 20,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12.5,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(17.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kGrey2,
              ),
              child: Image.asset(
                "assets/icons/filter.png",
                height: 20,
                color: kGrey3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TopCourses extends StatelessWidget {
  const _TopCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        return SizedBox(
          height: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Kurslar",
                style: GoogleFonts.robotoSlab(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  itemCount: vm.courses.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final course = vm.courses[index];
                    return top.contains(course.id)
                        ? ClipRect(
                            child: Container(
                              width: 300,
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: kGrey2,
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                              top: Radius.circular(12),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                course.avatar,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: kWhite,
                                            borderRadius:
                                                const BorderRadius.vertical(
                                              bottom: Radius.circular(12),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    1), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 50,
                                          ),
                                          child: SizedBox(
                                            width: 300,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 10),
                                                Text(
                                                  course.title,
                                                  style: GoogleFonts.robotoSlab(
                                                    color: kBlack,
                                                    fontSize: 17.5,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: const Alignment(.85, .35),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: kWhite,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/icons/play.png",
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Cat extends StatelessWidget {
  const _Cat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        return Column(
          children: [
            Text(
              "Toifa",
              style: GoogleFonts.robotoSlab(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  itemCount: cats.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final cat = cats[index];
                    return GestureDetector(
                      onTap: () {
                        vm.selectCat(cat);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: cat == vm.selectedCat ? kYellow : kGrey2,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/${cat.toLowerCase()}.png",
                              height: 20,
                              color: cat == vm.selectedCat ? kWhite : kBlack,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              cat,
                              style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: cat == vm.selectedCat ? kWhite : kBlack,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 7.5),
          ],
        );
      },
    );
  }
}

class _Courses extends StatelessWidget {
  const _Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 12,
          ),
          itemCount: vm.catCourses.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final course = vm.catCourses[index];
            return Expanded(
              child: ClipRect(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kGrey2,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    course.avatar,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(12),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 35,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      course.title,
                                      style: GoogleFonts.robotoSlab(
                                        color: kBlack,
                                        height: 1.2,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const Alignment(.95, .35),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kWhite,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "assets/icons/play.png",
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
