import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance/shared/cubit/states.dart';

import '../../models/article_model.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../styles/colors.dart';
import '../blogs_screen/blogs_details_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      defaultFormField(context,
                          controller: searchController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'enter text to search';
                            }
                            return null;
                          },
                          label: 'Search',
                          prefix: Icons.search,
                          onSubmit: (String? text) {
                            AppCubit.get(context).search(text!);
                            return null;
                          }),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (state is AppLoadingSearchArticleState)
                        const LinearProgressIndicator(),
                      AppCubit.get(context).searchList.isNotEmpty
                          ? ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              reverse: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) => articleItem(
                                  AppCubit.get(context).searchList[index],
                                  index,
                                  context),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                              itemCount:
                                  AppCubit.get(context).searchList.length)
                          : Container()
                    ],
                  ),
                ),
              ),
            ));
      },
      listener: (context, state) {},
    );
  }

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
                  title: model.title.toString(),
                ));
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4.5,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CarouselSlider(
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
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal)),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.4),
                        // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: const Offset(
                          0, // Move to right 10  horizontally
                          0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      model.title.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
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
