import 'dart:async';
import 'dart:io';
import 'package:find_work_or_worker/constants/images.dart';
import 'package:find_work_or_worker/cubit/theme_cubit.dart';
import 'package:find_work_or_worker/data/local_data_source.dart'; 
import 'package:find_work_or_worker/pages/intro_page.dart';
 import 'package:find_work_or_worker/pages/resumes_page.dart';
import 'package:find_work_or_worker/pages/save_page.dart';
import 'package:find_work_or_worker/pages/sign_in.dart';
import 'package:find_work_or_worker/pages/vacancies_page.dart';
import 'package:find_work_or_worker/pages/vacancy_or_resume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../constants/strings.dart';
import '../core/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ImagePicker picker = ImagePicker();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  File? file;
  File? image;
  final String email = userRepository.readEmail() ?? "null";
  final String lastName = userRepository.readLastName() ?? "null";


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        bottomNavigationBar:  const TabBar(
          tabs: <Widget>[
            Tab(
              text: "Resume",
            ),
            Tab(
              text: "Vacancy",
            ),
          ],
        ),
        key: _key,
        appBar: AppBar(
          actions: [
            userRepository.readEmail() != null ?  IconButton(onPressed: () => logOut(context), icon: const Icon(Icons.logout)) : IconButton(onPressed: () => ThemeCubit().changeTheme()
            , icon: ValueListenableBuilder<ThemeMode>(
                valueListenable: mode,
                builder: (_, mode, child) {
                  return mode != ThemeMode.light
                      ? Image.asset(
                    Images.sun,
                    height: 25,
                  )
                      : Image.asset(
                    Images.moon,
                    height: 25,
                  );
                }),)
          ],
          leading: userRepository.readEmail() != null ? IconButton(onPressed: () => _key.currentState!.openDrawer(), icon: const Icon(Icons.menu),) : const SizedBox(),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        drawer: userRepository.readEmail() != null ? Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Fotima", style: TextStyle(fontSize: 16.sp),),
                accountEmail: Text(email,
                  style: TextStyle(fontSize: 12.sp),
                ),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(150.sp),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 80.sp,
                        width: 80.sp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(150.sp),
                          child:
                          (imageRepository.readImage(StorageKey.image.name) ==
                              null
                              ? Transform.scale(
                            scale: 1.3.sp,
                            child: Image.asset(
                              Images.profile,
                            ),
                          )
                              : Image.file(
                            File(imageRepository
                                .readImage(StorageKey.image.name) ??
                                ""),
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.7.sp, 1.sp),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () => getImage(context),
                              child: Container(
                                alignment: Alignment.center,
                                height: 22.sp,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2.sp)),
                                child: Icon(
                                  CupertinoIcons.camera_fill,
                                  size: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// #log_out
              ListTile(
                onTap: () => logOut(context),
                title: const Text(
                  Strings.logOut,
                  style: TextStyle(fontSize: 18),
                ),
                leading: Image.asset(
                  Images.logOut,
                  height: 25,
                ),
              ),

              /// #add_announcement
              ListTile(
                onTap: check,
                title: const Text(
                  Strings.addAnnouncement,
                  style: TextStyle(fontSize: 18),
                ),
                leading: Image.asset(
                  Images.add,
                  height: 25,
                ),
              ),

              /// #save
              // ListTile(
              //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ccontext) => SavePage())),
              //   title: const Text(
              //     Strings.savedAnnouncement,
              //     style: TextStyle(fontSize: 18),
              //   ),
              //   leading: Image.asset(
              //     Images.save,
              //     height: 25,
              //   ),
              // ),

              /// #mode
              ListTile(
                onTap: () {
                  ThemeCubit().changeTheme();
                },
                title: const Text(
                  Strings.mode,
                  style: TextStyle(fontSize: 18),
                ),
                leading: ValueListenableBuilder<ThemeMode>(
                    valueListenable: mode,
                    builder: (_, mode, child) {
                      return mode != ThemeMode.light
                          ? Image.asset(
                        Images.sun,
                        height: 25,
                      )
                          : Image.asset(
                        Images.moon,
                        height: 25,
                      );
                    }),
              )
            ],
          ),
        ) : const SizedBox(),
        body: const TabBarView(
          children: <Widget>[
            ResumesPage(),
            VacanciesPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: check,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<String?> saveFileAppDocumentFromGallery(File image, [String filename = "profile"]) async {
    Completer<File> completer = Completer();
    try {
      final dir = await getApplicationDocumentsDirectory();
      final format = image.path.substring(image.path.lastIndexOf("."));
      final imagePath = "${dir.path}/$filename$format";
      File file = File(imagePath);
      final bytes = await image.readAsBytes();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      return imagePath;
    } catch (e) {
      throw Exception('Error!');
    }
  }

  void pickImage(ImageSource source, BuildContext context) async {
    // Navigator.pop(context);
    try {
      final result = await picker.pickImage(source: source);
      image = File(result!.path);
      await imageRepository.saveImage(image);
      setState(() {});
    } on PlatformException {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid image format")));
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("This device doesn't support camera")));
    }
  }

  void getImage(BuildContext context) async {
    showModalBottomSheet(
      clipBehavior: Clip.antiAlias,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Take a photo"),
                onTap: () => pickImage(ImageSource.camera, context),
              ),
              ListTile(
                title: const Text("Photo gallery"),
                onTap: () => pickImage(ImageSource.gallery, context),
              ),
            ],
          ),
        );
      }, context: context,
    );
  }

  void logOut(BuildContext context) async {
    await userRepository.removeEmail();
    if(mounted) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const IntroPage()), (route) => false);
    }
  }


  void check() {
    if(email == "null" ) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInPage()));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VacancyOrResume()));
    }
  }
}


