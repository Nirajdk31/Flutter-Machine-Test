import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${FirebaseAuth.instance.currentUser!.displayName!}",style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            showDialog(
                context: context,
                builder: (BuildContext context){
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/logout.jpg',
                            height: 120,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "Comeback Soon !",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Are you sure you want to logout?",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          //SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: TextButton(
                                    onPressed: () async {
                                      await GoogleSignIn().signOut();
                                      FirebaseAuth.instance.signOut();
                                      Navigator.pop(context);
                                    },
                                    child: Text("Yes, logout",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.merge(const TextStyle(
                                            color: Colors.red,
                                            fontSize: 20))),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration:  BoxDecoration(
                                      color: Colors.red.shade400,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("No",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.merge(const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20))),
                                  ),
                                ),
                              ),
                            ],
                          )

                          // SizedBox(
                          //   height: Get.height/2,
                          //   width: Get.width/1.2,
                          //
                          // )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12,width: 1),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.blue.shade50],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Text("Logout",style: TextStyle(fontSize: 16,color: Colors.black),)),
        ),
      ),
    );
  }
}
