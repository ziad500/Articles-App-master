import 'package:flutter/material.dart';
/* import 'package:sizer/sizer.dart';
 */
import 'package:fluttertoast/fluttertoast.dart';

import '../../styles/colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

Widget searchForm() => SizedBox(
      height: 31,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: defaultColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: defaultColor)),
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
      ),
    );

Widget defaultFormField(
  context, {
  required TextEditingController controller,
  required TextInputType type,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onChange,
  Function()? onTap,
  double height = 12,
  bool isPassword = false,
  required String? Function(String?)? validate,
  String? label,
  String? hint,
  Color? bodercolor,
  IconData? prefix,
  IconData? suffix,
  int maxlines = 1,
  double hintsize = 2.5 /* 18.0 */,
  double labelsize = 2.5,
  double verticalpadding = 18.0,
  double horizontalpadding = 15.0,
  Color borderEnableColor = defaultColor,
  Color borderColor = Colors.grey,
  int? maxLength,
  FocusNode? focusNode,
  Function()? suffixPressed,
  bool isClickable = true,
  bool review = false,
  Color borderrrrrcolor = const Color(0xffE8E8EE),
}) =>
    SizedBox(
      height: MediaQuery.of(context).size.height / height,
      child: TextFormField(
        maxLength: maxLength,
        textInputAction: TextInputAction.next, // Moves focus to next.
        textAlign: TextAlign.left,
        controller: controller,
        keyboardType: type,
        focusNode: focusNode,
        obscureText: isPassword,
        enabled: isClickable,
        maxLines: maxlines,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,

        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0),
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          floatingLabelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          fillColor: review ? Colors.white : const Color(0xffE8E8EE),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: borderrrrrcolor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: defaultColor)),
          labelText: label,
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                )
              : null,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalpadding, horizontal: horizontalpadding),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                    color: defaultColor,
                  ),
                )
              : null,
        ),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );

Widget defaultButton(
        {double width = 250.0,
        double height = 55,
        bool isUpperCase = true,
        double radius = 50.0,
        IconData? icon,
        Color? textColor = Colors.white,
        Color? color = defaultColor,
        Color borderColor = defaultColor,
        required Function()? function,
        required String text,
        double verticalpadding = 14.0,
        double textsize = 14.0}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(
            radius,
          ),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
              offset: Offset(0, 4),
            )
          ]),
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        padding: EdgeInsets.symmetric(vertical: verticalpadding, horizontal: 5),
        onPressed: function,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      isUpperCase ? text.toUpperCase() : text,
                      style: TextStyle(
                          color: textColor,
                          fontSize: textsize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  isUpperCase ? text.toUpperCase() : text,
                  style: TextStyle(
                      color: textColor,
                      fontSize: textsize,
                      fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );

void showToast(
        {required String? text,
        required ToastStates state,
        Color textColor = Colors.white}) =>
    Fluttertoast.showToast(
        msg: '$text',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state), //chooseToastColor(state)
        textColor: textColor,
        fontSize: 16.0);

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}

Widget bottomSheet(
    {Function()? camera, Function()? gallery, String text = 'Profile'}) {
  return Container(
    height: 100.0,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    child: Column(
      children: [
        Text(
          'choose $text Photo',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(12.0),
              color: defaultColor,
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: camera,
/*                         AppCubit.get(context).getImage(ImageSource.camera);
 */
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Material(
              borderRadius: BorderRadius.circular(12.0),
              color: defaultColor,
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: gallery,
                    /* () {
                        AppCubit.get(context).getImage(ImageSource.gallery);
                      }, */
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
              ),
            )
          ],
        )
      ],
    ),
  );
}
