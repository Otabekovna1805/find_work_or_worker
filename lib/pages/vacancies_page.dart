import 'package:find_work_or_worker/constants/images.dart';
import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/core/service_locator.dart';
import 'package:find_work_or_worker/model/vacancy/vacancy.dart';
import 'package:find_work_or_worker/service/network_service.dart';
import 'package:find_work_or_worker/views/book_mark.dart';
import 'package:find_work_or_worker/views/element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class VacanciesPage extends StatefulWidget {
  const VacanciesPage({super.key});

  @override
  State<VacanciesPage> createState() => _VacanciesPageState();
}

class _VacanciesPageState extends State<VacanciesPage> {
   bool _isVisible = false;
  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    fetchVacancy();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final item = items[i];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10.sp),
                  child: Column(children: [
                    /// #vacancy
                    Padding(
                        padding: EdgeInsets.only(bottom: 20.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Strings.vacancy,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Saira",
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                    setState(() {});
                                  });
                                },
                                icon: Transform.rotate(
                                    angle: !_isVisible ? 4.7 : 7.9,
                                    child: const Icon(
                                        Icons.arrow_back_ios_new),
                                ),
                            ),
                          ],
                        ),),

                    /// #companyName
                    CustomElement(image: Images.company, text: Strings.companyNamee, elementText: item.company),

                     SizedBox(
                      height: 10.sp,
                    ),

                    /// #title
                    CustomElement(image: Images.title, text: Strings.companyTitle, elementText: item.title),

                     SizedBox(
                      height: 10.sp,
                    ),

                    /// #description
                    CustomElement(image: Images.vacancyDescription, text: Strings.companyDescription, elementText: item.description),


                     SizedBox(
                      height: 10.sp,
                    ),

                    /// #phone
                    CustomElement(image: Images.phoneNumber, text: Strings.phone, elementText: "+998787774747"),

                     SizedBox(
                      height: 10.sp,
                    ),


                    if (_isVisible)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 13.sp,
                          ),

                          /// #experience
                          CustomElement(image: Images.experience, text: Strings.experienceYear, elementText: item.experience),

                           SizedBox(
                            height: 10.sp,
                          ),

                          /// #level
                          CustomElement(image: Images.level, text: Strings.vacancyLevel, elementText: item.level),

                           SizedBox(
                            height: 10.sp,
                          ),

                          // /// #skills
                          // CustomElement(image: Images.skills, text: Strings.skills, elementText: item.toString().toString()),
                          //
                          //  SizedBox(
                          //   height: 10.sp,
                          // ),

                          /// #salary
                          CustomElement(image: Images.salary, text: Strings.vacancySalary, elementText: item.salary.toString()),
                            SizedBox(
                            height: 10.sp,
                          ),
                          /// #overview
                          CustomElement(image: Images.overview, text: Strings.vacancyOverview, elementText: item.jobType!),

                           SizedBox(
                            height: 10.sp,
                          ),

                          /// #offer
                          CustomElement(image: Images.offer, text: Strings.vacancyOffer, elementText: item.offer),

                           SizedBox(
                            height: 10.sp,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              // CustomBookMark(idForVacancy: item.id,),
                              userRepository.readEmail().toString() == item.user.email ? const SizedBox() : IconButton(onPressed: () => delete(item.id), icon: const Icon(Icons.delete))
                            ],
                          ),
                        ],
                      )
                  ]),
                ),
              );
            },
          ),
          if(_isLoading) Center(
            child: Lottie.asset("assets/lotties/loading.json"),
          )
        ],
      ),
    );
  }
   void delete(int id) async {
     await Network.methodDelete(api: Network.apiVacancyRemove, id: id);
     fetchVacancy();
   }
   List<VacancyModel> items = [];
   void fetchVacancy() async {
     setState(() => _isLoading = true);
     final data = await Network.methodGet(api: Network.apiVacancyList);
     items = Network.parseVacancyList(data!);
     setState(() => _isLoading = false);
   }
}
