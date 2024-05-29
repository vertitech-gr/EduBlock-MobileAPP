import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/widgets/custum_tab_bar/custum_tabbar.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/requests/candidates.dart';
import 'package:edublock/core/widgets/requests/employer_procees/employer_details_screen.dart';
import 'package:edublock/core/widgets/requests/employers.dart';
import 'package:edublock/core/widgets/requests/institutional.dart';
import 'package:edublock/core/widgets/student_chat_screen/student_chat_screen.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RequestWidgetScreen extends StatefulWidget {
  @override
  State<RequestWidgetScreen> createState() => _RequestWidgetScreenState();
}

class _RequestWidgetScreenState extends State<RequestWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }
  ScrollController _scrollController = ScrollController();


  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();
  final UserStore _userStore = getIt<UserStore>();

  @override
  void initState() {
    super.initState();
    if (_certificateRequestStore.envelopesList.isEmpty) {

      fetchData();
    }
    _scrollController.addListener(_scrollListener);

  }
  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _certificateRequestStore.changePageNumber();
      fetchData();
    }
  }
  void fetchData() async {
    try {
      if (_userStore.currentUser != null) {
        List results = await Future.wait([
          _certificateRequestStore
              .getAllRequestLists(_userStore.currentUser!.existingUser.id,),
          _certificateRequestStore.getStudentRequest(_userStore.currentUser!.existingUser.id)
        ]);
      }
    } catch (error) {
      print('check all certificate list are here $error');
      // Handle errors
    }
  }

  List<String> tabList = ['Incoming', 'Out Going'];

  Widget _buildBody(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          _buildRightSide(context),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _certificateRequestStore.isAllRequestListsLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget _buildRightSide(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      color: Theme.of(context).colorScheme.secondaryContainer,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        fetchData();
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Requests',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  /*CustumTextButton(
                      buttonName: 'Filter',
                      isWhite: true,
                      isFilter: true,
                      callback: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => RequestWidgetScreen(),
                        //   ),
                        // );
                      })*/
                ],
              ),
            ),
            CustomTabbarScreen(
              tabLists: tabList,
              tabWidgets: [myWalletCertificate(), cyWalletEnvelope()],
            ),
            // CustumTabbarScreen()
          ],
        ),
      ),
    );
  }

  Widget myWalletCertificate() {
    return Observer(builder: (context) {
      return _certificateRequestStore.allRecievedRequestLists.length > 0
          ? ListView.separated(
              padding: EdgeInsets.only(bottom: 16.0),
              physics: const BouncingScrollPhysics(),
              itemCount:
                  _certificateRequestStore.allRecievedRequestLists.length,
              // Set the itemCount to 1 since there's only one item
              itemBuilder: (BuildContext context, int index) {
                return EmployerScreen(
                  recievedRequest:
                      _certificateRequestStore.allRecievedRequestLists[index],
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmployerDetailScreen(
                              recievedRequest: _certificateRequestStore
                                  .allRecievedRequestLists[index])),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(padding: EdgeInsets.symmetric(vertical: 12.0));
              },
            )
          : Container(
              child: Text(
                'No Request here ',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
              ),
            );
    });
  }

  Widget myWalletEnvelope() {
    return ListView.separated(
      itemCount: 20, // Set the itemCount to 1 since there's only one item
      itemBuilder: (BuildContext context, int index) {
        return InstitutionalScreen(
          institutionalName: 'California Institute of Technology (Caltech)',
          date: 'Dated - 13/12/2023',
          callback: () {
            Navigator.of(context).pushNamed(Routes.multipleFormStepperScreen);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(padding: EdgeInsets.symmetric(vertical: 8.0));
      },
    );
  }

  Widget cyWalletEnvelope() {
    return Observer(builder: (context) {
      return _certificateRequestStore.studentRequestLists.length > 0
          ? ListView.separated(
              padding: EdgeInsets.only(bottom: 16.0),
              physics: const BouncingScrollPhysics(),
              itemCount: _certificateRequestStore.studentRequestLists.length,
              // Set the itemCount to 1 since there's only one item
              itemBuilder: (BuildContext context, int index) {
                return StudentOutGoingRequest(
                  status: _certificateRequestStore
                      .studentRequestLists[index].status,
                  department: _certificateRequestStore
                      .studentRequestLists[index].department,
                  graduationYear: _certificateRequestStore
                      .studentRequestLists[index].graduationYear,
                  lastUpdateDate: _certificateRequestStore
                      .studentRequestLists[index].lastUpdateDate,
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentChatScreen(
                          studentRequest: _certificateRequestStore
                              .studentRequestLists[index],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(padding: EdgeInsets.symmetric(vertical: 12.0));
              },
            )
          : Container(
              child: Text(
                'No OutGoing Request here ',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
              ),
            );
    });
  }
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}

// callback: () {
// Navigator.of(context).pushNamed(Routes.candidateDetailScreen);
// },
