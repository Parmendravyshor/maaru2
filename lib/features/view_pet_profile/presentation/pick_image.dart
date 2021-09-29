// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:maaru/features/pet_profile/presentation/bloc/pet_profile_bloc.dart';

// import 'bloc/pet_profile_bloc.dart';





// class _ImageForm extends StatelessWidget {
//   final ImagePicker _picker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return BlocBuilder<PetProfileBloc, PetProfileState>(
//       // buildWhen: (previous, current) => previous.status != current.status,
//       builder: (context, state) {
//         return state.PetPofileEvent == PetPofileEvent.uploadingImage
//             ? CircularProgressIndicator()
//             // : _addImage(context);
//             : state.registrationStatus == RegistrationStatus.uploadedImage
//                 ? _viewImage(state.data['image'][0])
//                 : _addImage(context);
//       },
//     );
//   }

//   _addImage(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         _pickImage(context);
//       },
//       child: Container(
//         alignment: Alignment.center,
//         height: 40,
//         width: 40,
//         decoration:
//             BoxDecoration(
//             //  color: MyTheme.primaryColor, 
//             shape: BoxShape.circle),
//         child: Icon(
//           Icons.camera_alt,
//         //  color: MyTheme.secondryColor,
//         ),
//       ),
//     );
//   }

//   _viewImage(String image) {
//     return Container(
//       alignment: Alignment.center,
//       height: 40,
//       width: 40,
//       decoration: BoxDecoration(
//           //color: MyTheme.primaryColor,
//           shape: BoxShape.circle,
//           image:
//               DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
//     );
//   }

//   _pickImage(BuildContext context) async {
//     final PickedFile pickedFile =
//         await _picker.getImage(source: ImageSource.gallery);
//     context.read<PetProfileBloc>().add(UploadImage(pickedFile.path));
//   }
// }