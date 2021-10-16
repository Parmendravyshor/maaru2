// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// //
// //
// // import 'bloc/pet_profile_bloc.dart';
// //
// //
// //
// //
// //
// // class _ImageForm extends StatelessWidget {
// //   final ImagePicker _picker = ImagePicker();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;
// //     return BlocBuilder<PetProfileBloc, PetProfileState>(
// //       // buildWhen: (previous, current) => previous.status != current.status,
// //       builder: (context, state) {
// //         return state.PetPofileEvent == PetPofileEvent.uploadingImage
// //             ? CircularProgressIndicator()
// //             // : _addImage(context);
// //             : state.registrationStatus == RegistrationStatus.uploadedImage
// //                 ? _viewImage(state.data['image'][0])
// //                 : _addImage(context);
// //       },
// //     );
// //   }
// //
// //   _addImage(BuildContext context) {
// //     return InkWell(
// //       onTap: () {
// //         _pickImage(context);
// //       },
// //       child: Container(
// //         alignment: Alignment.center,
// //         height: 40,
// //         width: 40,
// //         decoration:
// //             BoxDecoration(
// //             //  color: MyTheme.primaryColor,
// //             shape: BoxShape.circle),
// //         child: Icon(
// //           Icons.camera_alt,
// //         //  color: MyTheme.secondryColor,
// //         ),
// //       ),
// //     );
// //   }
// //
// //   _viewImage(String image) {
// //     return Container(
// //       alignment: Alignment.center,
// //       height: 40,
// //       width: 40,
// //       decoration: BoxDecoration(
// //           //color: MyTheme.primaryColor,
// //           shape: BoxShape.circle,
// //           image:
// //               DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
// //     );
// //   }
// //
// //   _pickImage(BuildContext context) async {
// //     final PickedFile pickedFile =
// //         await _picker.getImage(source: ImageSource.gallery);
// //    // context.read<PetProfileBloc>().add(UploadImage(pickedFile.path));
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_file_manager/flutter_file_manager.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
// import 'package:path_provider_ex/path_provider_ex.dart';
// class MyPDFList extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return _MyPDFList(); //create state
//   }
// }
// class _MyPDFList extends State<MyPDFList>{
//   var files;
//
//   void getFiles() async { //asyn function to get list of files
//     List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
//     var root = storageInfo[0].rootDir; //storageInfo[1] for SD card, geting the root directory
//     var fm = FileManager(root: Directory(root)); //
//     files = await fm.filesTree(
//         excludedPaths: ["/storage/emulated/0/Android"],
//         extensions: ["pdf"] //optional, to filter files, list only pdf files
//     );
//     setState(() {}); //update the UI
//   }
//
//   @override
//   void initState() {
//     getFiles(); //call getFiles() function on initial state.
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title:Text("PDF File list from SD Card"),
//             backgroundColor: Colors.redAccent
//         ),
//         body:files == null? Text("Searching Files"):
//         ListView.builder(  //if file/folder list is grabbed, then show here
//           itemCount: files?.length ?? 0,
//           itemBuilder: (context, index) {
//             return Card(
//                 child:ListTile(
//                   title: Text(files[index].path.split('/').last),
//                   leading: Icon(Icons.picture_as_pdf),
//                   trailing: Icon(Icons.arrow_forward, color: Colors.redAccent,),
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context){
//                       return ViewPDF(pathPDF:files[index].path.toString());
//                       //open viewPDF page on click
//                     }));
//                   },
//                 )
//             );
//           },
//         )
//     );
//   }
// }
//
// class ViewPDF extends StatelessWidget {
//   String pathPDF = "";
//   ViewPDF({this.pathPDF});
//
//   @override
//   Widget build(BuildContext context) {
//     return PDFViewerScaffold( //view PDF
//         appBar: AppBar(
//           title: Text("Document"),
//           backgroundColor: Colors.deepOrangeAccent,
//         ),
//         path: pathPDF
//     );
//   }
// }