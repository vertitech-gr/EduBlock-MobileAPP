import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/widgets/rounded_button_widget.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// void successBottomSheet(BuildContext context, VoidCallback redirect) {
void envelopesSortingBottomSheet(BuildContext context) {

  final CreateEnvelopesStore _createEnvelopesStore =
  getIt<CreateEnvelopesStore>();
  showModalBottomSheet<void>(
    context: context,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height*0.5,
        decoration: const BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Envelopes Sorts",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  )),
            ),
            Observer(
              builder: (_) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        _createEnvelopesStore.setSelectedSortBy('name');

                      },
                      child: Row(
                        children: [
                          Radio<String>(
                            activeColor: Colors.red,
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<
                                MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context).colorScheme.primaryContainer;
                              }
                              return Theme.of(context).colorScheme.primaryContainer;
                            }),
                            hoverColor: Colors.amberAccent,
                            value: 'name',
                            groupValue: _createEnvelopesStore.selectedSortBy,
                            onChanged: (value) {
                              _createEnvelopesStore.setSelectedSortBy(value!);

                            },
                          ),
                          Text('Sort By Name'),

                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _createEnvelopesStore.setSelectedSortBy('createdat');

                      },
                      child: Row(
                        children: [
                          Radio<String>(
                            activeColor: Colors.red,
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<
                                MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context).colorScheme.primaryContainer;
                              }
                              return Theme.of(context).colorScheme.primaryContainer;
                            }),
                            hoverColor: Colors.amberAccent,

                            value: 'createdat',
                            groupValue: _createEnvelopesStore.selectedSortBy,
                            onChanged: (value) {
                              _createEnvelopesStore.setSelectedSortBy(value!);
                            },
                          ),
                          Text('Sort By Date'),

                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _createEnvelopesStore.setSortByOrder('1');

                      },
                      child: Row(
                        children: [
                          Radio<String>(
                            activeColor: Colors.red,
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<
                                MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context).colorScheme.primaryContainer;
                              }
                              return Theme.of(context).colorScheme.primaryContainer;
                            }),
                            hoverColor: Colors.amberAccent,

                            value: '1',
                            groupValue: _createEnvelopesStore.sortByOrder,
                            onChanged: (value) {
                              _createEnvelopesStore.setSortByOrder(value!);
                            },
                          ),
                          Text('Sort By Descending '),

                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _createEnvelopesStore.setSortByOrder('0');

                      },
                      child: Row(
                        children: [
                          Radio<String>(
                            activeColor: Colors.red,
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<
                                MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context).colorScheme.primaryContainer;
                              }
                              return Theme.of(context).colorScheme.primaryContainer;
                            }),
                            hoverColor: Colors.amberAccent,

                            value: '0',
                            groupValue: _createEnvelopesStore.sortByOrder,
                            onChanged: (value) {
                              _createEnvelopesStore.setSelectedSortBy(value!);
                            },
                          ),
                          Text('Sort By Ascending '),

                        ],
                      ),
                    ),
                  ],
                );
              }
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0,vertical: 24.0),
              child: RoundedButtonWidget(
                buttonText: "Sort",
                buttonColor: const Color.fromRGBO(31, 41, 56, 1),
                textColor: Colors.white,
                onPressed: (){
                  _createEnvelopesStore.getEnvelopeLists();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      );
    },
  );
}
