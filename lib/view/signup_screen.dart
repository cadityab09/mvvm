import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FocusNode emailFocus=FocusNode();
  FocusNode passwordFocus=FocusNode();

  ValueNotifier<bool> _obseccure = ValueNotifier(false);


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    _obseccure.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authViewModel=Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Singup Screen'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocus,
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'email',
              labelText: 'email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            onFieldSubmitted: (value){
              Utils.feildFocusChange(context, emailFocus, passwordFocus);
            },
          ),
          ValueListenableBuilder(valueListenable: _obseccure,
              builder: (context, value, child){
                return TextFormField(
                  controller: passwordController,
                  obscureText: _obseccure.value,
                  obscuringCharacter: '*',
                  focusNode: passwordFocus,
                  decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      onTap: (){
                        _obseccure.value=!_obseccure.value;
                      },
                      child: Icon((_obseccure.value)?Icons.visibility_off:Icons.visibility),
                    ),
                  ),
                  onFieldSubmitted: (value){
                    passwordFocus.unfocus();
                  },
                );
              }),

          SizedBox(height: height * .1,),
          RoundButton(value: 'signup',loading: _authViewModel.laoding, onPress: (){

            if(emailController.text.isEmpty){
              Utils.showFlushMessage('Email cant be empty', context);
            }
            else if(passwordController.text.isEmpty){
              Utils.showFlushMessage('Password cant be empty', context);
            }
            else if(passwordController.text.length<6){
              Utils.showFlushMessage('password at least 6 digits', context);
            }
            else{
              Map map= {
                'email':emailController.text,
                'password':passwordController.text,
              };
              _authViewModel.signupApi(map, context);
              print('Api hit');
            }
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, RouteNames.login);
              }, child: Text('login'))
            ],
          ),
        ],
      ),
    );
  }
}
