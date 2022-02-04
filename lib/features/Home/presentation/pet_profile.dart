import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Account_setting/presentation/bloc/account_setting.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
    as event;
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'create_home_screen.dart';

class PetProfile1 extends StatefulWidget {
  @override
  _PetProfile1State createState() => _PetProfile1State();
}

class _PetProfile1State extends State<PetProfile1> {
  String text = '';
  TextEditingController _textEditingController;
////
  @override
  void initState() {
    _textEditingController = TextEditingController();

    super.initState();
  }

  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MaaruColors.darkGrey2,
        bottomNavigationBar: CreateHomeScreen(
          selectedIndex: 2,
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => CreateregisterPetProfile1()));
          },
          child: Row(children: [
            Padding(
                padding: EdgeInsets.only(left: 70),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CreateregisterPetProfile1()));
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        radius: 30,
                        child: Icon(
                          Icons.add,
                          color: MaaruColors.buttonColor,
                          size: 35,
                        ),
                      )),
                )),
            SizedBox(
              width: 20,
            ),
            Text(
              'Add New Pet',
              style: MaaruStyle.text.mediumGreen,
            ),
          ]),
        ),
        body: BlocProvider(
            create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
            child: BlocBuilder<PetProfileBloc, PetProfileState>(
                builder: (context, state) {
              if (state is PetProfileInitial) {
                BlocProvider.of<PetProfileBloc>(context)
                    .add(GetCovidList(text));

                return const Center(child: CircularProgressIndicator());
              } else if (state is CovidLoaded3) {
                print(
                    '+-+****rhedhhhhhhhhhhhhhhhhhhhhhhhhh ${state.covidModel.petProfiles}');
                return SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 30, bottom: 15),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AccountSettingScreen()));
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: ProfileAvatar(
                                  imageUrl: _prefHelper.getStringByKey(
                                      MaruConstant.img, ''),
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                            'assets/128/CrystalGaskell.png'));
                                  },
                                  avatarRadius: 60,
                                  width: 40,
                                  Color: Colors.white,
                                  child: null,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 10, left: 20),
                          child: TextFormField(
                            // cursorColor: Colors.black,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.7),
                                    borderSide: BorderSide(
                                        color: Colors.grey[300], width: 1.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                         BorderRadius.circular(10.7),
                                    borderSide:  BorderSide(
                                        color: Colors.grey[300], width: 1.0)),
                                hintText: 'Search',
                                hintStyle: MaaruStyle.text.greyDisable,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 25.0, 10.0),
                                fillColor: Colors.white,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        BlocProvider.of<PetProfileBloc>(context)
                                            .add(GetCovidList(
                                                _textEditingController.text));
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/icons/icone-setting-19.png',
                                      height: 52,
                                      // width: 30,
                                    ))),
                            // onFieldSubmitted: (text) {
                            //   BlocProvider.of<PetProfileBloc>(context)
                            //       .add(GetCovidList(text));
                            // },
                            onChanged: (text) {
                              BlocProvider.of<PetProfileBloc>(context).add(
                                  GetCovidList(_textEditingController.text));
                            },
                            controller: _textEditingController,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          // alignment: Alignment.center,
                          height: 470,
                          width: 250,
                          child: ListView.builder(
                            itemCount: state.covidModel.petProfiles.length,
                            scrollDirection: Axis.vertical,
                            reverse: true,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return
                                  // padding: index == _hotels.length - 1

                                  InkWell(
                                onTap: () {
                                  _prefHelper.saveInt('id',
                                      state.covidModel.petProfiles[index].id);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => ViewPetProfile(
                                            id1: state.covidModel
                                                .petProfiles[index].id,
                                          )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 250,
                                    alignment: FractionalOffset.topLeft,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey[300], width: 1.0),
                                    ),

                                    child: Column(children: [
                                      Container(
                                          //width: 300,
                                          alignment: Alignment.center,
                                          child: Image.network(
                                            state.covidModel.petProfiles[index]
                                                .img
                                                .toString(),
                                            height: 150,
                                            width: 232,
                                            fit: BoxFit.fitWidth,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Image.asset(
                                                      'assets/128/CrystalGaskell.png'));
                                            },
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  state
                                                      .covidModel
                                                      .petProfiles[index]
                                                      .petName,
                                                  style: MaaruStyle.text.large,
                                                ),
                                                Image.asset(
                                                  'assets/icons/icone-setting-31.png',
                                                  width: 25,
                                                )
                                              ],
                                            ),
                                            Text(
                                              state.covidModel
                                                  .petProfiles[index].breedType,
                                              style: MaaruStyle.text.tiny,
                                            ),
                                            SizedBox(height: 10)
                                          ],
                                        ),
                                      ),
                                    ]),

                                    // alignment: Alignment.center,
                                  ),
                                ),
                              );
                            },
                          )),
                    ]),
                  )),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })));
  }
}
