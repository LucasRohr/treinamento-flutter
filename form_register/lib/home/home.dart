import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_register/components/form-field/form-field.component.dart';

class Home extends State {

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  List<String> countries = ['South Korea', 'Brazil', 'Canada'];
  String selectedCountry;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.renderHomeBody(),
    );
  }

  String validateFullName(String fullName) {
    if(fullName.isEmpty) {
      return 'Full name is required';
    }

    if(fullName.length < 6) {
      return 'Name must have at least 6 letters';
    }
  
    return null;
  }

  String validateEmail(String email) {
    bool isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

    if(email.isEmpty) {
      return 'Email is required';
    }

    if(!isEmailValid) {
      return 'Email inválido';
    }
  
    return null;
  }

  String validateMobileNumber(String number) {
    if(number.isEmpty) {
      return 'Number is required';
    }
    return null;
  }

  String validateCountry(String country) {
    if(this.selectedCountry == null || country.isEmpty) {
      return 'A Country must be selected';
    }
    return null;
  }

  String validatePassword(String password) {
    if(password.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  String validateConfirmPassword(String confirmPassword) {
    if(confirmPassword.isEmpty) {
      return 'Password must be confirmed';
    }

    if(confirmPassword != this.password) {
      return 'Senhas não batem';
    }
    return null;
  }

  Widget renderForm() {
    return (

      Form(
        key: this.formKey,
        child: Column(
          children: <Widget>[
          
            FormFieldInput(
              label: 'Full name',
              type: TextInputType.text,
              validator: this.validateFullName,
              maxInputLength: 40
            ),

            FormFieldInput(
              label: 'Email Adress',
              type: TextInputType.emailAddress,
              validator: this.validateEmail,
              maxInputLength: 50
            ),

            FormFieldInput(
              label: 'Mobile Number',
              type: TextInputType.phone,
              validator: this.validateMobileNumber,
              maxInputLength: 11
            ),

            Container(
              margin: EdgeInsets.only(bottom: 20),

              child: DropdownButtonFormField(
                validator: this.validateCountry,

                items: this.countries.map((country) => (
                  DropdownMenuItem(
                    value: country,

                    child: Text(country),
                  )
                )).toList(),

                onChanged: (selectedValue) {
                  setState(() {
                    this.selectedCountry = selectedValue;
                  });
                },
                
                value: this.selectedCountry,

                decoration: InputDecoration(

                  labelText: 'Countries',

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0
                      ),
                  )

                ),
              ),
            ),

            FormFieldInput(
              label: 'Password',
              type: TextInputType.visiblePassword,
              validator: this.validatePassword,
              maxInputLength: 30,
              onChange: (password) {
                setState(() {
                  this.password = password;
                });
              },
            ),

            FormFieldInput(
              label: 'Confirm Password',
              type: TextInputType.visiblePassword,
              maxInputLength: 30,
              validator: this.validateConfirmPassword,
            ),

            FormFieldInput(
              label: 'Referal Code (optional)',
              maxInputLength: 8,
              type: TextInputType.number
            )

          ],
        ),
      )

    );
  }

  void register() {
    print('registered');
  }

  void validateForm() {
    if(this.formKey.currentState.validate()) {
      this.register();
    }
  }

  Widget renderHomeBody() {
    return Container(

      padding: EdgeInsets.only(left: 30, right: 30),

      child: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[

            Container(

              padding: EdgeInsets.only(top: 50),

              alignment: Alignment.centerLeft,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[

                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 35,
                  )

                ],
              ),
            ),

            Container(

              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 30),

              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              )
            ),

            Container(
              margin: EdgeInsets.only(top: 20),

              child: this.renderForm(),
            ),

            Container(
              margin: EdgeInsets.only(top: 25, bottom: 60),

              child: RaisedButton(
                onPressed: this.validateForm,

                padding: EdgeInsets.only(top: 20, bottom: 20),

                color: Colors.red,

                
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              )
            )

          ],
        ),
      )
    );
  }

}
