import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/ViewModel/Controller/get_categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategories extends StatefulWidget {
  final dynamic categoryId;
  final dynamic categoryName;
  const SubCategories({super.key, this.categoryId, this.categoryName});

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  CategoriesController categorie = Get.put(CategoriesController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      categorie.fetchSubCategories(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(widget.categoryName,style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: white,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:Icon(Icons.arrow_back_ios)),
      ),
      body: Obx(() {
        if (categorie.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (categorie.subcategoriesList.isEmpty) {
          return const Center(child: Text("No Subcategories Found"));
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemCount: categorie.subcategoriesList.length,
            itemBuilder: (context, index) {
              final sub = categorie.subcategoriesList[index];
              return GestureDetector(
                onTap: () {

                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      sub.image != null
                          ? Image.network(
                        sub.image!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ) : Image.asset(
                        'assets/images/near.jpg',
                        width: double.infinity,
                        filterQuality: FilterQuality.high,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 8,
                        left: 8,
                        right: 8,
                        child: Text(
                          sub.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    offset: Offset(1, 1),
                                    blurRadius: 2)
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
