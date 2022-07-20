import 'package:flutter/material.dart';
import 'package:konkuk_student_app/profile/profilemain.dart';
import 'package:konkuk_student_app/profile/user.dart';
import 'package:konkuk_student_app/profile/user_preferences.dart';
import 'package:konkuk_student_app/profile/widget/appbar_widget.dart';
import 'package:konkuk_student_app/profile/widget/profilepicture_widget.dart';
import 'package:konkuk_student_app/profile/widget/save_confirmation.dart';
import 'package:konkuk_student_app/profile/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  TextEditingController _textEditingController = TextEditingController();
  bool tappedYes = false;

  @override
  Widget build(BuildContext context) => Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            ProfilePictureWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {
                name = user.name;
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Weight',
              text: user.weight,
              onChanged: (weight) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Age',
              text: user.age,
              onChanged: (weight) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Gender',
              text: user.gender,
              onChanged: (gender) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Fitbit Token',
              text: user.fitbitToken,
              onChanged: (fitbitToken) {},
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: ()async {
                final action = await SaveConfirmation.yesCancelDialog(context, 'Save Changes', 'Do you want to proceed with saving changes?');
                if(action == DialogsAction.yes) {
                  setState(() => tappedYes = true);
                } else {
                  setState(() => tappedYes = false);
                }
              },
              child: Center(
                child: Text('Save',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),

            /*MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 4),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileMain()),
                );
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Text('Save',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
              ),*/
            const SizedBox(height: 50),
          ],
        ),
      ),
  );

}