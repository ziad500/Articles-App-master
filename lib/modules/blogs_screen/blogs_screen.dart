import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance/models/article_model.dart';
import 'package:freelance/modules/blogs_screen/checbox.dart';

import 'package:freelance/modules/search/search_screen.dart';

import 'package:gallery_saver/gallery_saver.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../styles/colors.dart';
import 'add_blogs_screen.dart';
import 'blogs_details_screen.dart';

// ignore: must_be_immutable
class BlogsScreen extends StatefulWidget {
  BlogsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen>
    with SingleTickerProviderStateMixin {
  var imagesController = PageController();
  String albumName = 'Media';
  bool? chekboxed = false;
  late TabController controller;

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _page = 0;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black87,
              ),
              onPressed: () {
                //   , Image.asset('images/app.png',fit: BoxFit.cover)
                navigateTo(context, Pageyy());
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: defaultColor,
            child: const Icon(Icons.add),
            onPressed: () {
              AppCubit.get(context).getCategory("Yoga");
              navigateTo(context, AddBlogsScreen());
            },
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Categories',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        onTap: () => navigateTo(context, const SearchScreen()),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Search you're looking for",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TabBar(
                        controller: controller,
                        indicatorColor: Colors.transparent,
                        labelColor: const Color(0xFFC88D67),
                        isScrollable: true,
                        labelPadding: const EdgeInsets.only(right: 30.0),
                        unselectedLabelColor: const Color(0xFFCDCDCD),
                        tabs: const [
                          Tab(
                            child: Text('All',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 21.0,
                                )),
                          ),
                          Tab(
                            child: Text('Hospitals',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 21.0,
                                )),
                          ),
                          Tab(
                            child: Text('Clinics',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 21.0,
                                )),
                          ),
                          Tab(
                            child: Text('Dental Clinics',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 21.0,
                                )),
                          ),
                          Tab(
                            child: Text('medical labs',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 21.0,
                                )),
                          )
                        ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: TabBarView(controller: controller, children: [
                  list(AppCubit.get(context).allCategory),
                  list(AppCubit.get(context).hospitals),
                  list(AppCubit.get(context).clinics),
                  list(AppCubit.get(context).dentalClinics),
                  list(AppCubit.get(context).medicalLabs)
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget list(List list) => list.isEmpty
      ? const Center(
          child: Text("empty!"),
        )
      : Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 18.0, bottom: 20.0),
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) =>
                  articleItem(list[index], index, context),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10.0,
                  ),
              itemCount: list.length),
        );

  Widget articleItem(ArticlesModel? model, var index, context) => Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: InkWell(
          onTap: () {
            navigateTo(
                context,
                BlogsDetailsScreen(
                  content: model.content.toString(),
                  location: model.location.toString(),
                  type: model.category.toString(),
                  typedd: model.category2.toString(),
                  images: model.images,
                  date: model.time,
                  details: model.details ?? [],
                  title: model.title.toString(),
                ));
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CarouselSlider(
                            items: model!.images!
                                .map((e) => Image(
                                      image: NetworkImage(e),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ))
                                .toList(),
                            options: CarouselOptions(
                                height: 250.0,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                onPageChanged: (index, reason) {
                                  AppCubit.get(context).changeIndex(index);
                                },
                                reverse: false,
                                viewportFraction: 1.0,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(seconds: 1),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                scrollDirection: Axis.horizontal)),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < model.images!.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _getProperCircle(i, model.images,
                                    AppCubit.get(context).currentIndex),
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        model.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: defaultColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  _getProperCircle(int index, List<String>? images, int currentIndex) {
    if (index == currentIndex) {
      return const Icon(
        Icons.circle_outlined,
        color: defaultColor,
        size: 13,
      ) /* SvgPicture.asset(ImageAssets.hollowCircleIcon) */;
    } else {
      return const Icon(
        Icons.circle,
        color: defaultColor,
        size: 10,
      ) /* SvgPicture.asset(ImageAssets.solidCircleIcon) */;
    }
  }
}
