import 'package:flutter/material.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/layoutApp/Search_Screen/CustomSearchDelegate.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                color: const Color(0xFFFFC226),
              ),
              const Positioned(
                  top: -100,
                  right: -200,
                  child: CircleAvatar(
                    radius: 200,
                    backgroundColor: Color(0xFFFFCF54),
                  )),
              Positioned(
                top: 160,
                left: 20,
                right: 20,
                child: TextFormField(
                  onTap: () {
                    showSearch(context: context, delegate: CustomSearchDelegate());
                  },
                  cursorHeight: 22.0,
                  cursorColor: const Color(0xFFFFC226),
                  decoration:  InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "${getLang(context, "Try, Easy ways write a novel")}",
                      contentPadding: EdgeInsets.only(top: 12, left: 16),
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Padding(
                        child: const Icon(
                          Icons.search,
                          color: Color(0xFF2C3051),
                        ),
                        padding: EdgeInsetsDirectional.only(start: 30,end: 10),

                      )),
                ),
              )
            ],
          ),
          const SizedBox(height: 30,),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              child:  Text(
                "${getLang(context, "Popular Tags")}",
                style: TextStyle(fontSize: 19, color: Color(0xFF2C3051)),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 28),
            child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (ctx, index) {
                  return  Text(
                    "${getLang(context, "Business & Management")}",
                    style: TextStyle(fontSize: 14, color: Color(0xFF53588A)),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                      child: Divider(
                    color: Color(0xFFD8DCFF),
                    height: 30,
                  ));
                },
                itemCount: 20),
          ),
        ],
      ),
    );
  }
}
