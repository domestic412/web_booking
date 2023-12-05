import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_user/model_getcode.dart';
// import 'package:easy_localization/easy_localization.dart';

class CodeList extends StatefulWidget {
  const CodeList({super.key});

  @override
  State<CodeList> createState() => _CodeListState();
}

class _CodeListState extends State<CodeList> {
  TextEditingController _code_select = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return buildCode();
  }

  @override
  void initState() {
    super.initState();
    _code_select.text = codeValue ?? '';
  }

  FutureBuilder<List<GetCode>> buildCode() {
    return FutureBuilder<List<GetCode>>(
        future: GetCode().fetchCode(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List CodeLists = snapshot.data!;
            final List<DropdownMenuEntry<GetCode>> ListEntries =
                <DropdownMenuEntry<GetCode>>[];
            for (final Code in CodeLists) {
              ListEntries.add(
                DropdownMenuEntry<GetCode>(
                  value: Code,
                  label: Code.code,
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownMenu<GetCode>(
                  menuHeight: 500,
                  controller: _code_select,
                  enableFilter: true,
                  label: Text('code'.tr),
                  dropdownMenuEntries: ListEntries,
                  onSelected: (GetCode? Code) {
                    setState(() {
                      selectCode = Code;
                      codeValue = selectCode?.code;
                    });
                  },
                ),
              ],
            );
          }
          return Text('Error');
        });
  }
}
