import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int SignupTab = 1;
  int selectedCurrentTab = loginTab;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32, top: 32),
              child: Assets.img.icons.logo.image(width: 120),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: themeData.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedCurrentTab = loginTab;
                              });
                            },
                            child: Text(
                              'Login'.toUpperCase(),
                              style: themeData.textTheme.bodyLarge!.apply(
                                  color: selectedCurrentTab == loginTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () => setState(() {
                              selectedCurrentTab = SignupTab;
                            }),
                            child: Text('Sing up'.toUpperCase(),
                                style: themeData.textTheme.bodyLarge!.apply(
                                    color: selectedCurrentTab == SignupTab
                                        ? Colors.white
                                        : Colors.white54)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                          color: themeData.colorScheme.surface),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                          child: selectedCurrentTab == loginTab
                              ? _login(themeData: themeData)
                              : _SingUp(themeData: themeData),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _login extends StatelessWidget {
  const _login({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'wellcome back',
          style: themeData.textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sing in with your account',
          style: themeData.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const PasswordTextFields(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              backgroundColor:
                  WidgetStateProperty.all(themeData.colorScheme.primary),
            ),
            child: Text(
              'login'.toUpperCase(),
              style: themeData.textTheme.bodyLarge!.apply(color: Colors.white),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgat your password ?'),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Reset here'),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            'OR SING IN WITH',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.google.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _SingUp extends StatelessWidget {
  const _SingUp({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'wellcome to blog club',
          style: themeData.textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Please enter your information',
          style: themeData.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Full name')),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const PasswordTextFields(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              backgroundColor:
                  WidgetStateProperty.all(themeData.colorScheme.primary),
            ),
            child: Text(
              'Sing Up'.toUpperCase(),
              style: themeData.textTheme.bodyLarge!.apply(color: Colors.white),
            )),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            'OR SING Up WITH',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.google.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextFields extends StatefulWidget {
  const PasswordTextFields({
    super.key,
  });

  @override
  State<PasswordTextFields> createState() => _PasswordTextFieldsState();
}

class _PasswordTextFieldsState extends State<PasswordTextFields> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: const Text('Password'),
          suffix: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Text(
                obscureText ? 'show' : "hide",
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).colorScheme.primary),
              ))),
    );
  }
}
