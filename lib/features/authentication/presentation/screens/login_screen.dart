
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingo_learn_assignment/features/authentication/presentation/screens/signup_screen.dart';
import '../../../../custom_shared_widgets/custom_colors.dart';
import '../../../../custom_shared_widgets/custom_textField.dart';
import '../../../../custom_shared_widgets/custom_textStyle.dart';
import '../../../newsfeed/presentation/screens/news_feed_screen.dart';
import '../controllers/login_controller.dart';


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passTextController  = TextEditingController();



  @override
  Widget build(BuildContext context) {

    bool buttonState = ref.watch(loginControllerProvider.select((value) => value.formState.buttonState));

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
                  return  CustomTextField(hintText: 'Email', textController: _emailTextController,
                    textInputType: TextInputType.name, textInputAction: TextInputAction.next, maxLength: 40,
                    onChanged: (name) => ref.read(loginControllerProvider.notifier).setEmail(name),
                    error: ref.watch(loginControllerProvider.select((value) => value.formState.email.errorMessage)),
                    readOnly: buttonState,
                  );
                }),
                SizedBox(height: 6.h),
                Consumer(builder: (context, ref, child){
                  return  CustomTextField(hintText: 'Password', textController: _passTextController,
                    textInputType: TextInputType.name, textInputAction: TextInputAction.next, maxLength: 40,
                    onChanged: (name) => ref.read(loginControllerProvider.notifier).setPassword(name),
                    error: ref.watch(loginControllerProvider.select((value) => value.formState.password.errorMessage)),
                    readOnly: buttonState,
                  );
                }),
                const Spacer(),
                _buildSubmitButton(context,buttonState),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.only(bottom: 60.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('New here? ',style: statementStyle,),
                      InkWell(
                        child: Text('Signup',style: signInUp,),
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
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

  ///here [isLoading] indicates to button state whether
  ///to show text or loading_indicator inside it.
  Widget _buildSubmitButton(BuildContext context,bool isLoading) {

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
              child: !isLoading ? Text('Login', style: buttonText) :  SizedBox(
                height: 24.h,
                width: 26.w,
                child: const CircularProgressIndicator(color: Colors.white,),
              )),
        ),
        onTap: () async {


          if(!isLoading){
            bool isValid = ref.watch(loginControllerProvider.select((value) => value.formState.isValid));
            if(isValid){
              bool result = await ref.read(loginControllerProvider.notifier).loginUser(email: _emailTextController.text.trim(), password: _passTextController.text.trim());
              if(result){
                if(!mounted) return;
                await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NewsFeedView()));
              }
            }else{
              ref.read(loginControllerProvider.notifier).setEmail(_emailTextController.text);
              ref.read(loginControllerProvider.notifier).setPassword(_passTextController.text);
            }
          }
       },
      ),
    );

  }


}
