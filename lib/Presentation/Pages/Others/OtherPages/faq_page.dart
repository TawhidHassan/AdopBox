import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Componenet/faq_card.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            FAQCard(title: "1. How do I adopt a pet through your app?",discription: "Lorem ipsum dolor sit amet consectetur. Massa imperdiet id mi eros dignissim sit arcu orci. Habitant hac a lorem duis elementum praesent hendrerit fames maecenas. Tellus egestas dui dui massa. Sit netus est vitae urna nisi et dictum sem. Fermentum sed eu tincidunt eu pellentesque.",),
            FAQCard(title: "2. What information do I need to provide to adopt a pet?",discription: "Lorem ipsum dolor sit amet consectetur. Massa imperdiet id mi eros dignissim sit arcu orci. Habitant hac a lorem duis elementum praesent hendrerit fames maecenas. Tellus egestas dui dui massa. Sit netus est vitae urna nisi et dictum sem. Fermentum sed eu tincidunt eu pellentesque.",),
            FAQCard(title: "3. What information do I need to provide to adopt a pet?",discription: "Lorem ipsum dolor sit amet consectetur. Massa imperdiet id mi eros dignissim sit arcu orci. Habitant hac a lorem duis elementum praesent hendrerit fames maecenas. Tellus egestas dui dui massa. Sit netus est vitae urna nisi et dictum sem. Fermentum sed eu tincidunt eu pellentesque.",)
          ],
        ),
      ),
    );
  }
}
