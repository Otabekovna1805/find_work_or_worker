import 'package:find_work_or_worker/core/service_locator.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CustomBookMark extends StatefulWidget {
  final int idForResume;
  final int idForVacancy;
  const CustomBookMark({super.key, this.idForResume = 1, this.idForVacancy = 1});

  @override
  State<CustomBookMark> createState() => _CustomBookMarkState();
}

class _CustomBookMarkState extends State<CustomBookMark> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _isSaved = !_isSaved;
              if(_isSaved) {
                idRepository.saveId(widget.idForResume);
                idRepository.saveId(widget.idForVacancy);
                idForResume.add(widget.idForResume);
                idForVacancy.add(widget.idForVacancy);
              } else {
                idRepository.removeId(widget.idForResume);
                idRepository.removeId(widget.idForVacancy);
                idForResume.remove(widget.idForResume);
                idForVacancy.remove(widget.idForVacancy);              }
              setState(() {});
            });
          },
          icon: Icon(_isSaved
              ? Icons.bookmark_border
              : Icons.bookmark,
          ),
        ),
      ],
    );
  }
}
