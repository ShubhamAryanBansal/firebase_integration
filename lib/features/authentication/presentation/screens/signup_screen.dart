
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingo_learn_assignment/features/newsfeed/presentation/screens/news_feed_screen.dart';
import '../../../../custom_shared_widgets/custom_colors.dart';
import '../../../../custom_shared_widgets/custom_textField.dart';
import '../../../../custom_shared_widgets/custom_textStyle.dart';
import '../controllers/sign_up_controller.dart';
import 'login_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  final TextEditingController _nameTextController  = TextEditingController();
  final TextEditingController _passTextController  = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    bool buttonState = ref.watch(signupControllerProvider.select((value) => value.formState.buttonState));

    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: backgroundColor,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.h),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('MyNews', style: heading)),
                SizedBox(height: 110.h),
                Consumer(builder: (context, ref, child){
                  return  CustomTextField(hintText: 'Name', textController: _nameTextController,
                    textInputType: TextInputType.name, textInputAction: TextInputAction.next, maxLength: 30,
                    onChanged: (name) => ref.read(signupControllerProvider.notifier).setName(name),
                    error: ref.watch(signupControllerProvider.select((value) => value.formState.name.errorMessage)),
                    readOnly: buttonState,
                  );
                }),
                SizedBox(height: 6.h),
              Consumer(builder: (context, ref, child){
                  return  CustomTextField(hintText: 'Email', textController: _emailTextController,
                    textInputType: TextInputType.name, textInputAction: TextInputAction.next, maxLength: 40,
                    onChanged: (email) => ref.read(signupControllerProvider.notifier).setEmail(email),
                    error: ref.watch(signupControllerProvider.select((value) => value.formState.email.errorMessage)),
                    readOnly: buttonState,
                  );
                }),
                SizedBox(height: 6.h),
              Consumer(builder: (context, ref, child){
                  return  CustomTextField(hintText: 'Password', textController: _passTextController,
                    textInputType: TextInputType.name, textInputAction: TextInputAction.next, maxLength: 40,
                    onChanged: (password) => ref.read(signupControllerProvider.notifier).setPassword(password),
                    error: ref.watch(signupControllerProvider.select((value) => value.formState.password.errorMessage)),
                    readOnly: buttonState,
                  );
                }),
                const Spacer(),
                _buildSubmitButton(context,buttonState),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Already have an account? ',style: statementStyle,),
                      InkWell(
                        child: Text('Login',style: signInUp,),
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, bool isLoading) {

    return Align(
      alignment: Alignment.center,
      child: InkWell(
        child: Container(
          width: 210.w,
          height: 37.h,
          decoration: BoxDecoration(
              color: headingColor,
              borderRadius: BorderRadius.circular(10),
             ),
          child: Center(
              child: !isLoading ? Text('Signup', style: buttonText) :  SizedBox(
                height: 24.h,
                width: 26.w,
                child: const CircularProgressIndicator(color: Colors.white,),
              )),
        ),
        onTap: () async {

        if(!isLoading){
          bool isValid = ref.watch(signupControllerProvider.select((value) => value.formState.isValid));
          if(isValid){
            bool result = await ref.read(signupControllerProvider.notifier).signupUser(name: _nameTextController.text.trim(), email: _emailTextController.text.trim(), password: _passTextController.text.trim());
            if(result && mounted){
              await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NewsFeedView()));
            }
          }else{
            ref.read(signupControllerProvider.notifier).setName(_nameTextController.text);
            ref.read(signupControllerProvider.notifier).setEmail(_emailTextController.text.trim());
            ref.read(signupControllerProvider.notifier).setPassword(_passTextController.text);
          }
        }

        },
      ),
    );

  }


}
