import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:droid_hole/widgets/option_box.dart';

class DisableModal extends StatefulWidget {
  final void Function(int) onDisable;

  const DisableModal({
    Key? key,
    required this.onDisable
  }) : super(key: key);

  @override
  State<DisableModal> createState() => _DisableModalState();
}

class _DisableModalState extends State<DisableModal> {
  int? selectedOption;
  TextEditingController customTimeController = TextEditingController();
  bool showCustomDurationInput = false;
  bool customTimeIsValid = false;

  void _updateRadioValue(value) {
    setState(() {
      selectedOption = value;
      if (selectedOption != 5) {
        customTimeController.text = "";
        showCustomDurationInput = false;
      }
      else {
        Timer(const Duration(milliseconds: 250), () {
          setState(() {
            showCustomDurationInput = true;
          });
        });
      }
    });
  }

  void _validateCustomMinutes(value) {
    if (int.tryParse(value) != null) {
      setState(() {
        customTimeIsValid = true;
      });
    }
    else {
      setState(() {
        customTimeIsValid = false;
      });
    }
  }

  bool _selectionIsValid() {
    if (selectedOption != null && selectedOption != 5) {
      return true;
    }
    else if (selectedOption == 5 && customTimeIsValid == true) {
      return true;
    }
    else {
      return false;
    }
  }

  int _getTime() {
    switch (selectedOption) {
      case 0:
        return 30;

      case 1:
        return 60;

      case 2:
        return 120;

      case 3:
        return 300;

      case 4:
        return 0;

      case 5:
        return int.parse(customTimeController.text)*60;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);   

    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: Platform.isIOS ? 20 : 0
        ),
        child: SingleChildScrollView(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            height: selectedOption == 5 ? 450 : 340,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 17
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.disable,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: (mediaQueryData.size.width-70)/2,
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                    right: 5,
                                    bottom: 5
                                  ),
                                  child: OptionBox(
                                    optionsValue: selectedOption,
                                    itemValue: 0,
                                    onTap: _updateRadioValue,
                                    child: Center(
                                      child: AnimatedDefaultTextStyle(
                                        duration: const Duration(milliseconds: 250),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: selectedOption == 0
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).textTheme.bodyText1!.color
                                        ),
                                        child: Text(
                                          AppLocalizations.of(context)!.seconds30,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (mediaQueryData.size.width-70)/2,
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                    left: 5,
                                    bottom: 5
                                  ),
                                  child: OptionBox(
                                    optionsValue: selectedOption,
                                    itemValue: 1,
                                    onTap: _updateRadioValue,
                                    child: Center(
                                      child: AnimatedDefaultTextStyle(
                                        duration: const Duration(milliseconds: 250),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: selectedOption == 1
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).textTheme.bodyText1!.color
                                        ),
                                        child: Text(
                                          AppLocalizations.of(context)!.minute1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: (mediaQueryData.size.width-70)/2,
                                  margin: const EdgeInsets.only(
                                    top: 5,
                                    right: 5,
                                    bottom: 5
                                  ),
                                  child: OptionBox(
                                    optionsValue: selectedOption,
                                    itemValue: 2,
                                    onTap: _updateRadioValue,
                                    child: Center(
                                      child: AnimatedDefaultTextStyle(
                                        duration: const Duration(milliseconds: 250),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: selectedOption == 2
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).textTheme.bodyText1!.color
                                        ),
                                        child: Text(
                                          AppLocalizations.of(context)!.minutes2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (mediaQueryData.size.width-70)/2,
                                  margin: const EdgeInsets.only(
                                    top: 5,
                                    left: 5,
                                    bottom: 5
                                  ),
                                  child: OptionBox(
                                    optionsValue: selectedOption,
                                    itemValue: 3,
                                    onTap: _updateRadioValue,
                                    child: Center(
                                      child: AnimatedDefaultTextStyle(
                                        duration: const Duration(milliseconds: 250),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: selectedOption == 3
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).textTheme.bodyText1!.color
                                        ),
                                        child: Text(
                                          AppLocalizations.of(context)!.minutes5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: (mediaQueryData.size.width-70)/2,
                                  margin: const EdgeInsets.only(
                                    top: 5,
                                    right: 5,
                                    bottom: 10
                                  ),
                                  child: OptionBox(
                                    optionsValue: selectedOption,
                                    itemValue: 4,
                                    onTap: _updateRadioValue,
                                    child: Center(
                                      child: AnimatedDefaultTextStyle(
                                        duration: const Duration(milliseconds: 250),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: selectedOption == 4
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).textTheme.bodyText1!.color
                                        ),
                                        child: Text(
                                          AppLocalizations.of(context)!.indefinitely,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (mediaQueryData.size.width-70)/2,
                                  margin: const EdgeInsets.only(
                                    top: 5,
                                    left: 5,
                                    bottom: 10
                                  ),
                                  child: OptionBox(
                                    optionsValue: selectedOption,
                                    itemValue: 5,
                                    onTap: _updateRadioValue,
                                    child: Center(
                                      child: AnimatedDefaultTextStyle(
                                        duration: const Duration(milliseconds: 250),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: selectedOption == 5
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).textTheme.bodyText1!.color
                                        ),
                                        child: Text(
                                          AppLocalizations.of(context)!.custom,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (showCustomDurationInput == true) 
                              Column(
                                children: [
                                  const SizedBox(height: 25),
                                  TextField(
                                    onChanged: _validateCustomMinutes,
                                    controller: customTimeController,
                                    keyboardType: const TextInputType.numberWithOptions(
                                      decimal: false
                                    ),
                                    decoration: InputDecoration(
                                      errorText: !customTimeIsValid && customTimeController.text != ''
                                        ? AppLocalizations.of(context)!.valueNotValid 
                                        : null,
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10)
                                        )
                                      ),
                                      labelText: AppLocalizations.of(context)!.customMinutes,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context), 
                            child: Row(
                              children: [
                                const Icon(Icons.cancel),
                                const SizedBox(width: 10),
                                Text(AppLocalizations.of(context)!.cancel)
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: _selectionIsValid() == true 
                              ? () {
                                Navigator.pop(context);
                                widget.onDisable(_getTime());
                              }
                              : null,
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                Colors.red.withOpacity(0.1)
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                _selectionIsValid() == true 
                                  ? Colors.red
                                  : Colors.grey,
                              ),
                            ), 
                            child: Row(
                              children: [
                                const Icon(Icons.gpp_bad_rounded),
                                const SizedBox(width: 10),
                                Text(AppLocalizations.of(context)!.disable)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}