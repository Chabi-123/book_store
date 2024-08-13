import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/model/address_class.dart';
import 'package:untitled1/goggle_fornts.dart';
import 'package:untitled1/data/address_list.dart';
import 'package:untitled1/class/class.dart';
import 'package:untitled1/pages/payment.dart';
class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9d0208),
        title: Text(
          "Delivery Information",
          style: myStyle(27,Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white,size: 27
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ManageState>(
          builder: (context,ms,_){
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Enter your Name",
                            //border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Name";
                            }
                            return null;
                          },
                        ),
                        Gap(10),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            hintText: "Enter your Location",
                            //border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Address";
                            }
                            return null;
                          },
                        ),
                        Gap(10),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter your Email",
                            suffixIcon: Icon(Icons.email_outlined,),
                            //border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Email";
                            }
                            if (!value.contains("@gmail.com")) {
                              return "Email should contain gmail.com";
                            }
                            return null;
                          },
                        ),
                        Gap(10),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Enter your Number",
                            //border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Phone Number";
                            }
                            if (value.length > 8) {
                              return "Password must be at least 8 characters";
                            }
                            return null;
                          },
                        ),
                        Gap(20),
                        Text("Total Price: \$ ${ms.calculate()}", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Gap(20),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.8,
                          color: Color(0xff9d0208),  height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),  onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            customer.add(
                              AddressClass(
                                name: _nameController.text.toString(),
                                address: _addressController.text.toString(),
                                email: _emailController.text.toString(),
                                phoneNo: _phoneController.text.toString(),
                              ),
                            );      Navigator.of(context).push(
                              MaterialPageRoute(builder: (builder) => PaymentPage()),      );
                          }
                        },
                          child: Text(
                            "Make Payment",
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
