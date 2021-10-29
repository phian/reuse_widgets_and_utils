import 'package:e_commerce_app_widgets/widgets/base_app_bar.dart';
import 'package:e_commerce_app_widgets/widgets/bottom_sheet_wrapper/config/android_sheet_config.dart';
import 'package:e_commerce_app_widgets/widgets/bottom_sheet_wrapper/config/ios_sheet_config.dart';
import 'package:e_commerce_app_widgets/widgets/bottom_sheet_wrapper/custom_bottom_sheet.dart';
import 'package:e_commerce_app_widgets/widgets/bottom_sheet_wrapper/widgets/bottom_sheet_action.dart';
import 'package:e_commerce_app_widgets/widgets/custom_dropdown/config/dropdown_style.dart';
import 'package:e_commerce_app_widgets/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:e_commerce_app_widgets/widgets/custom_dropdown/widgets/dropdown_item.dart';
import 'package:e_commerce_app_widgets/widgets/simple_container.dart';
import 'package:e_commerce_app_widgets/widgets/suggestion_overlay/custom_suggestion_overlay.dart';
import 'package:e_commerce_app_widgets/widgets/suggestion_overlay/widgets/suggestion_overlay_item.dart';
import 'package:e_commerce_app_widgets/widgets/textfield/configs/textfield_config.dart';
import 'package:e_commerce_app_widgets/widgets/textfield/custom_textfield.dart';
import 'package:e_commerce_app_widgets/widgets/textfield/enums.dart';
import 'package:e_commerce_app_widgets/widgets/unfocus_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final _formKey = GlobalKey<FormState>();
  List<String> temp = const ['1', '2', '3'];
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<EditableTextState> _tfKey = GlobalKey<EditableTextState>();
  String _temp = 'History 1';

  @override
  Widget build(BuildContext context) {
    return UnFocusWidget(
      child: Scaffold(
        appBar: const BaseAppBar(
          title: Text('App Bar'),
        ),
        body: Form(
          // key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
            child: Column(
              children: [
                const Text('Name'),
                const SizedBox(height: 16.0),
                TextFieldSuggestionOverlay(
                  textFieldKey: _tfKey,
                  items: [
                    SuggestionOverlayItem(
                      title: Text(_temp),
                    ),
                    const SuggestionOverlayItem(
                      title: Text('History 2'),
                    ),
                    const SuggestionOverlayItem(
                      title: Text('History 3'),
                    ),
                  ],
                  textFieldFocusNode: _focusNode,
                  textFieldController: _controller,
                  child: CustomTextField(
                    key: _tfKey,
                    onChanged: (value) {
                      setState(() {
                        _temp = value;
                      });
                    },
                    textFieldType: TextFieldType.name,
                    textFieldConfig: TextFieldConfig(
                      controller: _controller,
                      focusNode: _focusNode,
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                const Text('Text'),
                const SizedBox(height: 16.0),
                const CustomTextField(textFieldType: TextFieldType.text),
                const SizedBox(height: 16.0),
                const Text('Email'),
                const SizedBox(height: 32.0),
                const CustomTextField(textFieldType: TextFieldType.email),
                const SizedBox(height: 32.0),
                const Text('Multiline'),
                const SizedBox(height: 16.0),
                const CustomTextField(textFieldType: TextFieldType.multiline),
                const SizedBox(height: 32.0),
                const Text('Password'),
                const SizedBox(height: 16.0),
                const CustomTextField(textFieldType: TextFieldType.password),
                const SizedBox(height: 32.0),
                const Text('Phone number'),
                const SizedBox(height: 16.0),
                const CustomTextField(textFieldType: TextFieldType.phoneNumber),
                const SizedBox(height: 32.0),
                const Text('New Custom Dropdown'),
                const SizedBox(height: 16.0),
                CustomDropdown(
                  placeHolderChild: const Text('Selected value'),
                  onChanged: (value, index) {
                    print(value);
                  },
                  validateSelectedData: true,
                  dropdownStyle: DropdownStyle(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  dropdownButtonStyle: DropdownButtonStyle(
                    buttonWidth: 200.0,
                    buttonHeight: 50.0,
                    buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  items: const [
                    DropdownItem(
                      value: 'One',
                      child: Text('One'),
                    ),
                    DropdownItem(
                      value: 'Two',
                      child: Text('Two'),
                    ),
                    DropdownItem(
                      value: 'Three',
                      child: Text('Three'),
                    ),
                    DropdownItem(
                      value: 'Four',
                      child: Text('Four'),
                    ),
                    DropdownItem(
                      value: 'Five',
                      child: Text('Five'),
                    ),
                  ],
                ),
                const SizedBox(height: 32.0),
                const Text('Simple container'),
                const SizedBox(height: 16.0),
                SimpleContainer(
                  padding: const EdgeInsets.all(32.0),
                  child: const Icon(Icons.add),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.grey.shade300,
                  shadowBlurRadius: 5,
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState?.validate() == true) {}
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    showAdaptiveBottomSheet(
                      context: context,
                      height: MediaQuery.of(context).size.height * 0.5,
                      actions: [
                        BottomSheetAction(
                          onPressed: () {},
                          title: const Text('One'),
                          backgroundColor: Colors.red,
                          leading: const Icon(Icons.add),
                          trailing: const Icon(Icons.remove),
                        ),
                        BottomSheetAction(
                          onPressed: () {},
                          title: const Text('Two'),
                          backgroundColor: Colors.yellow,
                        ),
                        BottomSheetAction(
                          onPressed: () {},
                          title: const Text('Three'),
                          backgroundColor: Colors.green,
                        ),
                      ],
                      androidSheetConfig: const AndroidSheetConfig(),
                      iosSheetConfig: const IOSSheetConfig(),
                    );
                  },
                  child: const Text('Show adaptive bottom sheet'),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
