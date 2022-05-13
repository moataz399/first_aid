import 'package:first_aid/constants/colors.dart';
import 'package:first_aid/presentation/widgets/big_text.dart';
import 'package:first_aid/presentation/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BigText(

              text: " First Aid",
              color: Colors.black,
              size: 35,
            ),
            SizedBox(height: 5,),
            Divider(
                height: 1,
                color: AppColors.mainColor,
                endIndent: 230,
                indent: 140),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 40.0),
              child: SmallText(
                text: 'Be a Hero save lives',
                size: 18,

              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/regimage.png'))),
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'signUpPage');
                    },
                    child: Container(
                      child: const Center(
                          child: Text('Create Account',

                              style: TextStyle(

                                color: Colors.white,
                                fontSize: 15,
                              ))),
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'loginPage');
                  },
                  child: Container(
                  //  padding: EdgeInsets.only(right: 10),
                    child: Text('Log In',style: TextStyle(fontSize: 25,fontFamily: 'Europa' ),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
