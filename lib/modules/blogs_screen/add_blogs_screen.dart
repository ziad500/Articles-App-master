import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance/shared/components/components.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../styles/colors.dart';

// ignore: must_be_immutable
class AddBlogsScreen extends StatefulWidget {
  AddBlogsScreen({Key? key}) : super(key: key);

  @override
  State<AddBlogsScreen> createState() => _AddBlogsScreenState();
}

class _AddBlogsScreenState extends State<AddBlogsScreen> {
  String _currText = '';

  bool _value = false;

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  var formKey = GlobalKey<FormState>();

  bool? checked = false, check2 = true, check3 = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessAddArticleState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Add Article'),
            ),
            body: bodyWidget(context, state));
      },
    );
  }

  Widget bodyWidget(context, state) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Article',
                  style: TextStyle(
                      color: const Color(0xff000000),
                      fontSize: MediaQuery.of(context).size.height / 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                defaultFormField(context,
                    controller: AppCubit.get(context).titleController,
                    hint: 'Title of the Article',
                    type: TextInputType.text, validate: (value) {
                  if (value!.isEmpty) {
                    return "title must not be Empty";
                  }
                  return null;
                }),
                const SizedBox(
                  height: 15,
                ),
                dropDownWidget(context),
                const SizedBox(
                  height: 15,
                ),
                dropDow(context),
                const SizedBox(
                  height: 15,
                ),
                defaultFormField(context,
                    controller: AppCubit.get(context).locationController,
                    hint: 'Location',
                    type: TextInputType.text, validate: (value) {
                  if (value!.isEmpty) {
                    return "content must not be Empty";
                  }
                  return null;
                }),
                const SizedBox(
                  height: 15,
                ),
                defaultFormField(context,
                    controller: AppCubit.get(context).contentController,
                    hint: 'Article Content',
                    maxlines: 5,
                    height: 7,
                    type: TextInputType.text, validate: (value) {
                  if (value!.isEmpty) {
                    return "content must not be Empty";
                  }
                  return null;
                }),
                const SizedBox(
                  height: 15,
                ),
                pickImageWidget(context),
                SizedBox(
                  width: 420,
                  height: 55,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //BoxDecoration

                        /** CheckboxListTile Widget **/
                        child: CheckboxListTile(
                          title: const Text('Hazardous Waste Contract'),
                          secondary: const Icon(Icons.code),
                          autofocus: false,
                          activeColor: defaultColor,
                          checkColor: Colors.white,
                          selected: _value,
                          value: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                              if (_value == true) {
                                AppCubit.get(context)
                                    .details1
                                    .add('Hazardous Waste Contract');
                              } else {
                                AppCubit.get(context)
                                    .details1
                                    .remove('Hazardous Waste Contract');
                              }
                            });
                          },
                        ), //CheckboxListTile
                      ), //Container
                    ), //Padding
                  ), //Center
                ),
                SizedBox(
                  width: 420,
                  height: 55,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        /** CheckboxListTile Widget **/
                        child: CheckboxListTile(
                          title: const Text('Environment Contract'),
                          secondary: const Icon(Icons.code),
                          autofocus: false,
                          activeColor: defaultColor,
                          checkColor: Colors.white,
                          selected: _value1,
                          value: _value1,
                          onChanged: (value) {
                            setState(() {
                              _value1 = value!;
                              if (_value1 == true) {
                                AppCubit.get(context)
                                    .details1
                                    .add('Environment Contract');
                              } else {
                                AppCubit.get(context)
                                    .details1
                                    .remove('Environment Contract');
                              }
                            });
                          },
                        ), //CheckboxListTile
                      ), //Container
                    ), //Padding
                  ), //Center
                ),
                SizedBox(
                  width: 420,
                  height: 55,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        /** CheckboxListTile Widget **/
                        child: CheckboxListTile(
                          title: const Text('Civil Protection Contract'),
                          secondary: const Icon(Icons.code),
                          autofocus: false,
                          activeColor: defaultColor,
                          checkColor: Colors.white,
                          selected: _value2,
                          value: _value2,
                          onChanged: (value) {
                            setState(() {
                              _value2 = value!;
                              if (_value2 == true) {
                                AppCubit.get(context)
                                    .details1
                                    .add('Civil Protection Contract');
                              } else {
                                AppCubit.get(context)
                                    .details1
                                    .remove('Civil Protection Contract');
                                print(
                                    AppCubit.get(context).details1.toString());
                              }
                            });
                          },
                        ), //CheckboxListTile
                      ), //Container
                    ), //Padding
                  ), //Center
                ),
                SizedBox(
                  width: 420,
                  height: 80,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        /** CheckboxListTile Widget **/
                        child: CheckboxListTile(
                          title: const Text('Ministry of Health License'),
                          secondary: const Icon(Icons.code),
                          autofocus: false,
                          activeColor: defaultColor,
                          checkColor: Colors.white,
                          selected: _value3,
                          value: _value3,
                          onChanged: (value) {
                            setState(() {
                              _value3 = value!;
                              if (_value3 == true) {
                                AppCubit.get(context)
                                    .details1
                                    .add('Ministry of Health License');
                              } else {
                                AppCubit.get(context)
                                    .details1
                                    .remove('Ministry of Health License');
                              }
                            });
                          },
                        ), //CheckboxListTile
                      ), //Container
                    ), //Padding
                  ), //Center
                ),
                const SizedBox(
                  height: 15,
                ),
                button(context, state),
              ],
            ),
          ),
        ),
      );

  Widget dropDownWidget(context) => InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE8E8EE),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: [
                      buildRadioBig('Hospitals', context),
                      buildRadioBig('Clinics', context),
                      buildRadioBig('Dental Clinics', context),
                      buildRadioBig('medical labs', context),
                    ],
                  ),
                ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 12,
        decoration: const BoxDecoration(
          color: Color(0xffE8E8EE),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: ListTile(
            title: Text(AppCubit.get(context).categoryArticlevalue),
            trailing: const Icon(
              Icons.arrow_drop_down,
              color: defaultColor,
              size: 40,
            )),
      ));

  Widget dropDow(context) => InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (value) => Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE8E8EE),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: [
                      buildRadioBiggg('abd', value),
                      buildRadioBiggg('mahmoud', value),
                      buildRadioBiggg('esraa', value),
                      buildRadioBiggg(' labs', value),
                    ],
                  ),
                ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 12,
        decoration: const BoxDecoration(
          color: Color(0xffE8E8EE),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: ListTile(
            title: Text(AppCubit.get(context).category2),
            trailing: const Icon(
              Icons.arrow_drop_down,
              color: defaultColor,
              size: 40,
            )),
      ));

  Widget button(context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          state is AppLoadingAddArticleState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : defaultButton(
                  function: () {
                    if (formKey.currentState!.validate() &&
                        AppCubit.get(context).categoryArticlevalue !=
                            'Category' &&
                        AppCubit.get(context).category2 != 'Category2' &&
                        AppCubit.get(context).imagestorage != null) {
                      AppCubit.get(context).uploadFile(
                          title: AppCubit.get(context).titleController.text,
                          content: AppCubit.get(context).contentController.text,
                          category: AppCubit.get(context).categoryArticlevalue,
                          category2: AppCubit.get(context).category2,
                          location:
                              AppCubit.get(context).locationController.text);
                    } else {
                      showToast(
                          text: 'Please Fill All Fields',
                          state: ToastStates.error);
                    }
                  },
                  text: 'submit'),
        ],
      );

  Widget pickImageWidget(context) => InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => bottomSheet(
              text: 'Your',
              camera: () => AppCubit.get(context).getcameraImage(),
              gallery: () => AppCubit.get(context).getGalleryImage(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: AppCubit.get(context).imagestorage!.isEmpty
              ? Container(
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xffE8E8EE),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.image,
                          color: defaultColor,
                          size: 35,
                        ),
                        Text(
                          'Upload Your Photo / Video',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ))
              : Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xffE8E8EE),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GridView.builder(
                      itemCount: AppCubit.get(context).imagestorage!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5),
                      itemBuilder: (context, index) {
                        return Image.file(
                          File(AppCubit.get(context).imagestorage![index].path),
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
        ),
      );

  Widget buildRadioBig(String value, context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: AppCubit.get(context).categoryArticlevalue,
            onChanged: (value) {
              AppCubit.get(context).changeCategoryArticleValue(value);
            }),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }

  Widget buildRadioBiggg(String value, context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: AppCubit.get(context).category2,
            onChanged: (value) {
              AppCubit.get(context).changeCategory2(value);
            }),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
