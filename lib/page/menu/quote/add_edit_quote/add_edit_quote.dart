import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/eqc_quote/model_add_quote.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';
import 'package:web_booking/widgets/footer.dart';
import 'widget/info_cont_quote.dart/add_info_cont_quote.dart';
import 'widget/port_quote/port_quote.dart';
import 'widget/table_input_quote.dart';

class AEQuotePage extends StatefulWidget {
  const AEQuotePage({super.key});

  @override
  State<AEQuotePage> createState() => _AEQuotePageState();
}

class _AEQuotePageState extends State<AEQuotePage> {
  @override
  void initState() {
    super.initState();
    quoteController.currentDate_send.value =
        changeDatetoSend(date: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    // var FHeight = deviceHeight(context);
    // var FWidth = deviceWidth(context);

    return Scaffold(
      // appBar: WidgetAppBar(),
      backgroundColor: backgroundColor,
      bottomSheet: Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // AppbarWidget(),
              appbar(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  decoration: BoxDecoration(
                      color: contentColor,
                      borderRadius: BorderRadius.circular(10)),
                  // width: 1004,
                  constraints:
                      const BoxConstraints(minWidth: 1004, maxWidth: 1400),
                  // width: FWidth,
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Create Quote',
                          style: style20_blue,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(
                                  color: blue.withOpacity(.4), width: .5),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 6),
                                    color: blue.withOpacity(.1),
                                    blurRadius: 12)
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: PortQuote()),
                        Container(
                            // margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(
                                  color: blue.withOpacity(.4), width: .5),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 6),
                                    color: blue.withOpacity(.1),
                                    blurRadius: 12)
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InfoContQuote()),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(
                                  color: blue.withOpacity(.4), width: .5),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 6),
                                    color: blue.withOpacity(.1),
                                    blurRadius: 12)
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TableInputQuote()),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if ((quoteController.currency.value != '') &&
                                  (quoteController.exRate.value.text != '')) {
                                PostNewQuote(
                                  eqcQuoteId: quoteController.eqcQuoteId.value,
                                  portDepotId:
                                      inforUserController.shipperId.value,
                                  quoteNo: quoteController.quoteNo.value,
                                  quoteStatus: 'C',
                                  quoteCcy: quoteController.currency.value,
                                  exRate: quoteController.exRate.value.text,
                                  quoteUser:
                                      inforUserController.shipperName.value,
                                  edit: 'I',
                                );
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(haian),
                                minimumSize:
                                    MaterialStateProperty.all(Size(100, 40))),
                            child: Text('Send Quote'),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
