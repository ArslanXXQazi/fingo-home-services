

import 'package:fingodriver/scr/components/components/constant/linker.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});

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
                  text: "Welcome to FINGO! By accessing or using our services, you agree to the following Terms & Conditions that ensure a safe, fair, and reliable experience for all our users.",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.start,
                  maxLines: 1000,
                ),

                _SectionTitle("1. Use of Service"),
                _Bullet("You agree to use this app only for lawful purposes."),
                _Bullet("You must not misuse the service, attempt unauthorized access, or disrupt its operations."),

                _SectionTitle("2. User Content"),
                _Bullet("You are responsible for any content you post, upload, or share in the app."),
                _Bullet("You grant the app a license to use, display, and distribute your content as necessary to provide the service."),
                _Bullet("Offensive, harmful, or illegal content is strictly prohibited."),

                _SectionTitle("3. Intellectual Property"),
                _Bullet("All logos, designs, features, and content of this app are owned by FINGO and protected by law."),
                _Bullet("You may not copy, reproduce, or distribute any part of the app without permission."),

                _SectionTitle("4. Third-Party Links"),
                _Bullet("The app may contain links to third-party websites or services."),
                _Bullet("We are not responsible for the content, privacy practices, or actions of those third parties."),

                _SectionTitle("5. Disclaimer of Warranties"),
                _Bullet("The app is provided ‘as is’ and ‘as available.’"),
                _Bullet("We make no guarantees that the app will always be secure, error-free, or uninterrupted."),

                _SectionTitle("6. Limitation of Liability"),
                _Bullet("We are not liable for any damages, losses, or claims arising from your use of the app."),
                _Bullet("Our liability is limited to the maximum extent permitted by law."),

                _SectionTitle("7. Indemnification"),
                _Bullet("You agree to defend, indemnify, and hold harmless FINGO from any claims or damages resulting from your misuse of the app or violation of these terms."),

                _SectionTitle("8. Changes to Terms"),
                _Bullet("We may update these Terms at any time. Continued use constitutes acceptance of the updated Terms."),

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


