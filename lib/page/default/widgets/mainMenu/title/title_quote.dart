// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

class QuoteMenu extends StatefulWidget {
  const QuoteMenu({super.key});

  @override
  State<QuoteMenu> createState() => _QuoteMenuState();
}

class _QuoteMenuState extends State<QuoteMenu> {
  // handle mouse quote
  bool isHovered_quote = false;
  bool isHovered_quoteList = false;
  bool isHovered_addQuote = false;
  Color quote_color = Colors.black54;
  Color quoteList_color = black;
  Color addQuote_color = black;

  void handleMouseEnter_quote(PointerEnterEvent event) {
    setState(() {
      isHovered_quote = true;
      quote_color = haian;
    });
  }

  void handleMouseExit_quote(PointerExitEvent event) {
    setState(() {
      isHovered_quote = false;
      quote_color = Colors.black54;
    });
  }

  void handleMouseEnter_quoteList(PointerEnterEvent event) {
    setState(() {
      isHovered_quoteList = true;
      quoteList_color = haian;
    });
  }

  void handleMouseExit_quoteList(PointerExitEvent event) {
    setState(() {
      isHovered_quoteList = false;
      quoteList_color = black;
    });
  }

  void handleMouseEnter_addQuote(PointerEnterEvent event) {
    setState(() {
      isHovered_addQuote = true;
      addQuote_color = haian;
    });
  }

  void handleMouseExit_addQuote(PointerExitEvent event) {
    setState(() {
      isHovered_addQuote = false;
      addQuote_color = black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: handleMouseEnter_quote,
      onExit: handleMouseExit_quote,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 35),
            width: 200,
            child: Text(
              // 'quote'.tr,
              'Quote',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: quote_color),
            ),
          ),
          if (isHovered_quote)
            Container(
                margin: EdgeInsets.only(top: 20),
                height: 150,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: 7,
                      width: 80,
                      decoration: BoxDecoration(
                          color: haian,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // MouseRegion(
                    //   onEnter: handleMouseEnter_addQuote,
                    //   onExit: handleMouseExit_addQuote,
                    //   child: InkWell(
                    //     onTap: () {
                    //       switch (inforUserController.shipperName.value) {
                    //         case '':
                    //           Get.toNamed(GetRoutes.SignIn);
                    //           break;
                    //         default:
                    //           {
                    //             switch (inforUserController.isStaff.value) {
                    //               case 0:
                    //                 break;
                    //               case 1:
                    //                 Get.toNamed(GetRoutes.AddQuote);
                    //               case 2:
                    //                 Get.toNamed(GetRoutes.AddQuote);
                    //               default:
                    //                 break;
                    //             }
                    //           }
                    //       }
                    //     },
                    //     child: Text(
                    //       'Add Quote',
                    //       style: TextStyle(fontSize: 16, color: addQuote_color),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    MouseRegion(
                      onEnter: handleMouseEnter_quoteList,
                      onExit: handleMouseExit_quoteList,
                      child: InkWell(
                        onTap: () {
                          switch (inforUserController.shipperName.value) {
                            case '':
                              Get.toNamed(GetRoutes.SignIn);
                              break;
                            default:
                              {
                                switch (inforUserController.isStaff.value) {
                                  case 0:
                                    break;
                                  case 1:
                                    Get.toNamed(GetRoutes.QuoteList);
                                  case 2:
                                    Get.toNamed(GetRoutes.QuoteList);
                                  default:
                                    break;
                                }
                              }
                          }
                        },
                        child: Text(
                          'Quote List',
                          style:
                              TextStyle(fontSize: 16, color: quoteList_color),
                        ),
                      ),
                    ),
                  ],
                )),
        ],
      ),
    );
  }
}
