

import 'package:fingodriver/scr/components/components/constant/linker.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: AppColors.orangeColor,)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWith*.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight*.02),
                BlackText(
                  text: "Your privacy is important to us. This Privacy Policy explains how FINGO collects, uses, and protects your personal information when you use our services.",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.start,
                  maxLines: 1000,
                ),
                SizedBox(height: screenHeight*.02),

                _SectionTitle("1. Information We Collect"),
                _Bullet("We collect basic details like name, phone, email, location, and payment info."),

                _SectionTitle("2. How We Use Data"),
                _Bullet("To process orders, provide rides, improve services, and ensure safety."),

                _SectionTitle("3. Sharing of Data"),
                _Bullet("We may share information with delivery partners, drivers, or payment providers, but not with unauthorized third parties"),

                _SectionTitle("4. Data Security"),
                _Bullet("We use encryption and security measures to protect your data."),

                _SectionTitle("5. User Rights"),
                _Bullet("You can request to view, update, or delete your personal data."),

                _SectionTitle("6. Cookies & Tracking"),
                _Bullet("The app may use cookies or similar tools to improve user experience."),

                _SectionTitle("7. Third-Party Services"),
                _Bullet("Links or payments handled by third parties follow their own privacy policies."),

                _SectionTitle("8. Children’s Privacy"),
                _Bullet("The service is not intended for users under 13 (or legal age in your country)"),

                _SectionTitle("9. Changes to Policy"),
                _Bullet("We may update this Privacy Policy; changes will be posted in the app."),

                _SectionTitle("10. Contact Us"),
                _Bullet("For questions, reach us at [support@email.com]"),

                SizedBox(height: screenHeight*.02),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.geologica(
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                    children: [
                      const TextSpan(text: 'By using '),
                      TextSpan(text: 'FINGO', style: TextStyle(color: AppColors.orangeColor, fontWeight: FontWeight.w700)),
                      const TextSpan(text: ', you agree to the collection and use of your information as outlined in this Privacy Policy. If you have any questions or concerns, please contact us at [support@email.com].'),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight*.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.02),
      child: BlackText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.start,
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: screenHeight*.008),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWith*.01,
            height: screenWith*.01,
            margin: EdgeInsets.only(top: screenHeight*.008),
            decoration: BoxDecoration(
              color: AppColors.greyText,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: screenWith*.02),
          Expanded(child: BlackText(
            text: text,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            textColor: AppColors.greyText,
            textAlign: TextAlign.start,
          )),
        ],
      ),
    );
  }
}


