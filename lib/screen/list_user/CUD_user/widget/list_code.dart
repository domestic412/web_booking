import 'package:flutter/material.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_user/model_getcode.dart';

class ListCode extends StatefulWidget {
  const ListCode({super.key});

  @override
  State<ListCode> createState() => _ListCodeState();
}

class _ListCodeState extends State<ListCode> {
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
            List listCodes = snapshot.data!;
            final List<DropdownMenuEntry<GetCode>> ListEntries =
                <DropdownMenuEntry<GetCode>>[];
            for (final Code in listCodes) {
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
                  label: const Text('Code'),
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
