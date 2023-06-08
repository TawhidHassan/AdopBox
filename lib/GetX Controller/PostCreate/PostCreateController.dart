import 'dart:io';
import 'dart:math';

import 'package:AdopBox/Constants/Strings/app_strings.dart';
import 'package:AdopBox/Data/Model/Breed/Breed.dart';
import 'package:AdopBox/Data/Model/Origin/Origin.dart';
import 'package:AdopBox/Data/Model/PostCreate/PostCreate.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:image/image.dart' as Img;
import '../../Config/text_style.dart';
import '../../Data/Model/Category/Category.dart';
import '../../Repository/PostRepository/PostRepository.dart';
import '../../Repository/SliderRepository/slider_repository.dart';
import '../../Service/LocalDataBase/localdata.dart';

class PostCreateController extends GetxController implements GetxService{
  final PostRepository? postRepository;
  final LocalDataGet? localDataGet;
  PostCreateController({this.localDataGet, this.postRepository});

  final currentIndex = 0.obs;
  PageController controller=PageController(initialPage: 0, keepPage: false);


  RxList<PostCreate>? postDraftList=RxList<PostCreate>();
  RxList<Category>? categoryList=RxList<Category>();
  RxList<Breed>? breedList=RxList<Breed>();
  RxList<Origin>? originList=RxList<Origin>();
  PostCreate?  darftPostModel;
  final postdataCirculler = false.obs;
  final selectCategory = "".obs;
  final selectCategoryId = "".obs;
  final selectBreed = "".obs;
  final selectBreedId= "".obs;
  final selectOrigin = "".obs;
  final selectOriginId = "".obs;



  Future<void> onSystemInit() async {
    darftPostModel=null;
    imageUploding.value=false;
    selectCategory.value="";
    selectCategoryId.value="";
    selectBreed.value="";
    selectBreedId.value="";
    selectOrigin.value="";
    selectOriginId.value="";
    localDataGet?.getItem().then((value) {
      postDraftList!.value=value;
    });

    darftPostModel=PostCreate(uniqueId: DateTime.now().millisecondsSinceEpoch);

    Logger().e(darftPostModel!.uniqueId);


  }


  Future<void> saveDraft() async{
    Logger().e(darftPostModel!.postUserName);
    localDataGet!.addItem(darftPostModel!).then((value){
     onInit();
     Get.snackbar("", "",
         backgroundColor: Color(0XFF0EA01D),
         borderRadius: 4,
         titleText: Text("Your Post Added To Draft",style: mediumText(14,color: Colors.white),),
         messageText: Text("successfully.",style: mediumText(14,color: Colors.white),),
         icon: Image.asset("assets/icons/done2.png"),
         colorText: Colors.white,
         padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
         duration: Duration(seconds: 2)
     );
     update();
    });
  }


  void patTypeUpdate(String?type){
    darftPostModel!.petType=type;

    update();
  }
  void patVacinatedUpdate(bool vacinate){
    darftPostModel!.vaccinated=vacinate;

    print(darftPostModel!.vaccinated);
    update();
  }
  void patGenderUpdate(num gender){
    darftPostModel!.gender=gender;

    update();
  }
  void postTypeUpdate(num type){
    darftPostModel!.postType=type;

    update();
  }
  void patDisesesUpdate(bool dieseas){
    darftPostModel!.dieseas=dieseas;

    update();
  }
  void patAgeUpdate(int year,mont){
    var yearToDay=year*365;
    var montToDay=mont*30;
    darftPostModel!.age=yearToDay+montToDay;
    update();
  }
  void patWeightUpdate(int kg,grm){
    var kgToGm=kg*1000;
    var grmTo=grm*100;
    darftPostModel!.weight=kgToGm+grmTo;
    update();
  }
  void patTermUpdate(String text){
    if(darftPostModel!.termsAndConditions==null){
      darftPostModel!.termsAndConditions=[];
    }
    darftPostModel!.termsAndConditions!.add(text);
    update();
  }
  void patCatergoryUpdate(Category category){
    selectCategory.value=category.categoryName!;
    selectCategoryId.value=category.id!;

    update();
  }
  void patBreedUpdate(Breed breed){
    selectBreed.value=breed.breedName!;
    selectBreedId.value=breed.id!;
    update();
  }
  void patOriginUpdate(Origin origin){
    selectOrigin.value=origin.originName!;
    selectOriginId.value=origin.id!;
    update();
  }




  final filePath="".obs;
  final imageUploding=false.obs;
  File? file;

  filepic()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      filePath.value="";
      File filer = File(result.files.single.path!);
      filePath.value=result.files.single.path!;
      file=filer;
      reduceImageSize(file!);

    } else {
      // User canceled the picker
    }
  }
  Future<File> reduceImageSize(File imageFile) async {
    Img.Image? image = Img.decodeImage(imageFile.readAsBytesSync());
    int width = image!.width;
    int height = image.height;
    if (width > 800 || height > 800) {
      double aspectRatio = width / height;
      if (width > height) {
        width = 800;
        height = (width / aspectRatio).round();
      } else {
        height = 800;
        width = (height * aspectRatio).round();
      }
      image = Img.copyResize(image, width: width, height: height);
    }
    File reducedFile = File(imageFile.path.replaceAll('.jpg', '_reduced.jpg'));
    reducedFile.writeAsBytesSync(Img.encodeJpg(image, quality: 75));
    file=reducedFile;
    imageUploding.value=true;
    postRepository!.ImageUpload(file).then((value) {

      if(darftPostModel!.photos==null){
        darftPostModel!.photos=[];
      }

      if(value.status=="success"){
        imageUploding.value=false;
        darftPostModel!.photos!.add(value.photo!);
        print(darftPostModel!.photos!);
        Get.snackbar("", "",
            backgroundColor: Color(0XFF0EA01D),
            borderRadius: 4,
            titleText: Text("Imaged added",style: mediumText(14,color: Colors.white),),
            messageText: Text("successfully.",style: mediumText(14,color: Colors.white),),
            icon: Image.asset("assets/icons/done2.png"),
            colorText: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            duration: Duration(seconds: 2)
        );
      }else{
        imageUploding.value=false;
        Get.snackbar("", "",
            backgroundColor: Colors.red,
            borderRadius: 4,
            titleText: Text("Imaged added",style: mediumText(14,color: Colors.white),),
            messageText: Text("Filed.",style: mediumText(14,color: Colors.white),),
            icon: SvgPicture.asset("assets/icons/close.svg"),
            colorText: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            duration: Duration(seconds: 2)
        );
      }


    });
    return reducedFile;
  }

  Future submitPost(BuildContext context) async{
    postdataCirculler.value=true;
    update();
   await postRepository!.submitPost(darftPostModel).then((value) {
      if(value['status']=="success"){
        postdataCirculler.value=false;
        Navigator.pushReplacementNamed(context, MAIN_PAGE);
      }
   });

  }

}