import 'dart:developer';

import 'package:e_health/Services/graph_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HistoryDataRow extends StatelessWidget {
  GlucoseTimedData glucoseTimedData;
  HistoryDataRow({
    super.key,
    required this.glucoseTimedData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                DateFormat("dd  MMM  yyyy   -   HH:mm")
                    .format(glucoseTimedData.timeStamp),
                style: TextStyle(
                  color: Color(0x8F0F0F0F),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                glucoseTimedData.value.toString(),
                style: TextStyle(
                  color: Color(0x8F0F0F0F),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryNumericDataField extends StatelessWidget {
  List<GlucoseTimedData> dataList;
  HistoryNumericDataField({super.key, required this.dataList});

  List<Widget> historyNumericDataRows({
    required List<GlucoseTimedData> dataList,
  }) {
    List<Widget> historyNumericRowsList = [];
    for (int i = dataList.length - 1; i >= 0; i--) {
      historyNumericRowsList.add(
        HistoryDataRow(
          glucoseTimedData: dataList[i],
        ),
      );
    }
    return historyNumericRowsList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: historyNumericDataRows(dataList: dataList),
    );
  }
}
