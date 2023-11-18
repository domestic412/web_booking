import 'package:flutter/material.dart';
import 'package:web_booking/constants/style.dart';

class PolicyCheckContainer extends StatelessWidget {
  const PolicyCheckContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text:
                    '+ Thông tin số lần kết hợp, tình trạng container của vòng đời gần nhất  ',
                style: style_text_small_12,
                children: [
                  TextSpan(
                      text:
                          '( Không check kết hợp đối với container đang là hàng chờ xuất hoặc vỏ )',
                      style: style_text_small_12_red)
                ]),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '+ Yêu cầu trả vỏ đối với container đã xuất tàu ngoài.',
            style: style_text_small_12,
          ),
          const SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(
                text: '+ Đối với những container đã check kết hợp trước, ',
                style: style_text_small_12,
                children: [
                  TextSpan(
                      text:
                          'sau khi giao hàng vẫn phải check lại updated hoặc nếu có tình trạng rõ ràng phát sinh, yêu cầu trả vỏ.',
                      style: style_text_small_12_red)
                ]),
          ),
          const SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(text: '+ ', style: style_text_small_12, children: [
              TextSpan(
                  text:
                      'Yêu cầu xem kỹ loại mặt hàng được đóng có đúng với chủng loại container hay không trước khi cho khách hàng kết hợp',
                  style: style_text_small_12_red)
            ]),
          ),
        ],
      ),
    );
  }
}
