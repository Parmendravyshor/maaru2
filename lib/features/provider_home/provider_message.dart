import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/custom_card.dart';
import 'package:maru/features/chat/domain/entity/mesage.dart';
import 'package:maru/features/chat/presentation/chatt_screen.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/provider_home/presentation/provider_chat.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
    as event;

class   ProviderMessages extends StatefulWidget {
  // const Messages({Key key}) : super(key: key);

  @override
  _ProviderMessagesState createState() => _ProviderMessagesState();
}

class _ProviderMessagesState extends State<ProviderMessages> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    var selectedIndex;
    return Scaffold(
        backgroundColor: Color(0xFFffffff),
        bottomNavigationBar: CreateProviderHome(
            selectedIndex: 3,
            Color2: selectedIndex == 3
                ? Colors.grey[300]
                : MaaruColors.textButtonColor
            //Color:MaaruColors.textButtonColor
            ),
        body: BlocProvider(
          create: (context) => KiwiContainer().resolve<LoginBloc>(),
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoginInitial) {
              BlocProvider.of<LoginBloc>(context).add(event.GetCustomers());

              return Center(child: const CircularProgressIndicator());
            } else if (state is CustomerLoaded) {
              return SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                      child: Column(children: [
                     SizedBox(
                      height: size.height*0.02,
                    ),

                    // Align(
                    //     alignment: Alignment.centerRight,
                    //
                    //         child:
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(

                        alignment: Alignment.centerRight,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/128/CrystalGaskell.png',
                          height: 50    ,
                          // width: 60,
                        ),
                        // )
                      ),
                    ),

                    Padding(
                        padding:
                            const EdgeInsets.only(top: 15, right: 25, left: 25),
                        child: TextFormField(
                          // cursorColor: Colors.black,
                          decoration: InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.7),
                                  borderSide: new BorderSide(
                                      color: Colors.grey[300], width: 1.0)),
                              focusedBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.7),
                                  borderSide: new BorderSide(
                                      color: Colors.grey[300], width: 1.0)),
                              hintText: 'Search',
                              hintStyle: MaaruStyle.text.greyDisable,
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 25.0, 10.0),
                              fillColor: Colors.white,
                              suffixIcon: Image.asset(
                                'assets/icons/icone-setting-19.png',
                                height: 50,
                                // width: 30,
                              )),
                          onChanged: (text){
                            BlocProvider.of<LoginBloc>(context).add(event.GetCustomers());
                          },
                        )),
                    SizedBox(
                      height:size.height*0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '   Customers'.toUpperCase(),
                          style: MaaruStyle.text.tiny,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Container(

                                height: size.height*0.10,width: 400,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: state
                                        .getUserModel.customers.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: size.width*0.18,
                                              child: Image.network(
                                                state
                                                    .getUserModel
                                                .customers[index].firstName,
                                                errorBuilder:
                                                    (BuildContext, Object,
                                                    StackTrace) {
                                                  return Image.asset(
                                                    'assets/128/AlanPost.png',
                                                    fit: BoxFit.fitWidth,
                                                  );
                                                },
                                              ),
                                            ),
                                          ]);
                                    }),
                              ),
                            ),

                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: state
                                  .getUserModel.customers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                            builder: (_) => Chat2(
                                              user: state
                                                  .getUserModel.customers
                                                 [index]
                                                  .id
                                                  .toString(),
                                              name: state.getUserModel.customers[index].firstName,
                                          //    image: state.getUserModel.customers[index].,
                                            )));
                                      },
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25, right: 25,bottom: 10),
                                              child: Container(
                                                  height: size.height*0.12,
                                                  width: 400,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[50],

                                                  ),
                                                  child: Center(
                                                    child: ListTile(
                                                      leading: Image.network('',
                                                        // state
                                                        //     .getUserModel.customers[index].
                                                        //     .providersListing[
                                                        // index]
                                                        //     .img,
                                                        errorBuilder:
                                                            (BuildContext, Object,
                                                            StackTrace) {
                                                          return Image.asset(
                                                            'assets/128/AlanPost.png',
                                                            fit: BoxFit.fitWidth,
                                                          );
                                                        },
                                                      ),
                                                      title: Text(
                                                        state
                                                            .getUserModel.customers
                                                            [
                                                        index]
                                                            .firstName
                                                            .toString(),
                                                        style:
                                                        MaaruStyle.text.tiny,
                                                      ),
                                                      subtitle: ListView.builder(
                                                      //   controller: _controller,
                                                          scrollDirection:
                                                          Axis.vertical,
                                                          shrinkWrap: true,
                                                          reverse: true,
                                                          cacheExtent: 1000,
                                                          itemCount: 0,
                                                          itemBuilder:
                                                              (BuildContext
                                                          context,
                                                              int index) {
                                                            var message =
                                                            MessagesModel
                                                                .messages[0];
                                                            print(message[
                                                            'SenderID']
                                                                .toString() +
                                                                '---------' +
                                                                4.toString());
                                                            return Text(
                                                              '${message['4']}',
                                                              style: const TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  color: Colors
                                                                      .grey),
                                                            );
                                                          }),
                                                      trailing: Text(
                                                        'today'.toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  )))),
                                    ),
                                  ]);
                                }),
                          ],
                        )
                      ]),
                  ));
            } else {
              return const CircularProgressIndicator();
            }
            ;
          }),
        ));
  }
}
