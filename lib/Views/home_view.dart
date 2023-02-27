import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_and_icon/Views/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isChecked = false;
  var _secondMessage =
      'I would prefer to receive marketing messages from Bitely';
  var _thirdMessage =
      "Share my registration data with Bitely's content poviders for marketing purposes.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create an Account"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: PaddingItems().allPadding,
        child: Column(
          children: [
            NoClickableRichTextWidget(),
            Padding(
              padding: PaddingItems().verticalPadding,
              child: Row(
                children: [
                  Expanded(
                    child: ClickableTextWidget(secondMessage: _secondMessage),
                  ),
                  BlueCheckbox()
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ClickableTextWidget(secondMessage: _thirdMessage),
                ),
                BlueCheckbox()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Checkbox BlueCheckbox() {
    return Checkbox(
      shape: CircleBorder(),
      checkColor: Colors.white,
      activeColor: Colors.blue,
      value: this.isChecked,
      onChanged: (bool? value) {
        setState(() {
          this.isChecked = value!;
        });
      },
    );
  }
}

class ClickableTextWidget extends StatelessWidget with ColorItems {
  ClickableTextWidget({
    Key? key,
    required String secondMessage,
  })  : _secondMessage = secondMessage,
        super(key: key);

  final String _secondMessage;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: _secondMessage,
          style: TextStyle(
              color: ColorItems().clickableText,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // open desired screen
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const DetailView(),
                ),
              );
            }),
    );
  }
}

class NoClickableRichTextWidget extends StatelessWidget {
  const NoClickableRichTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'By clicking  on "Create account" you agree to our',
          style: const TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
                text: ' Term of Use',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // open desired screen
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const DetailView(),
                      ),
                    );
                  }),
            const TextSpan(
                text: ' and ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Privacy Policy,',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // open desired screen
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const DetailView(),
                      ),
                    );
                  }),
          ]),
    );
  }
}

class PaddingItems {
  final EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 20);
  final EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 20);
  final EdgeInsets allPadding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 20);
}

class ColorItems {
  final Color clickableText = Colors.white;
}
