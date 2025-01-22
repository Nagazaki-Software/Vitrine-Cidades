import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/contade_comerciante_criado_com_sucesso_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'criar_perfil_de_prestador_widget.dart'
    show CriarPerfilDePrestadorWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CriarPerfilDePrestadorModel
    extends FlutterFlowModel<CriarPerfilDePrestadorWidget> {
  ///  Local state fields for this page.

  bool categoria = false;

  bool politicaDePrivacidade = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in CriarPerfilDePrestador widget.
  LojistasRecord? querry;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameTextController1;
  String? Function(BuildContext, String?)? yourNameTextController1Validator;
  String? _yourNameTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameTextController2;
  final yourNameMask2 = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? yourNameTextController2Validator;
  String? _yourNameTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode1;
  TextEditingController? cityTextController1;
  String? Function(BuildContext, String?)? cityTextController1Validator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode2;
  TextEditingController? cityTextController2;
  final cityMask2 = MaskTextInputFormatter(mask: '(##) # ####-####');
  String? Function(BuildContext, String?)? cityTextController2Validator;
  String? _cityTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  // State field(s) for area widget.
  String? areaValue1;
  FormFieldController<String>? areaValueController1;
  // State field(s) for area widget.
  String? areaValue2;
  FormFieldController<String>? areaValueController2;
  // State field(s) for CheckboxLojista widget.
  bool? checkboxLojistaValue;
  // State field(s) for CheckboxPrestador widget.
  bool? checkboxPrestadorValue;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PrestadoresDeServicosRecord? prestador;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LojistasRecord? lojista;

  @override
  void initState(BuildContext context) {
    yourNameTextController1Validator = _yourNameTextController1Validator;
    yourNameTextController2Validator = _yourNameTextController2Validator;
    cityTextController2Validator = _cityTextController2Validator;
  }

  @override
  void dispose() {
    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    cityFocusNode1?.dispose();
    cityTextController1?.dispose();

    cityFocusNode2?.dispose();
    cityTextController2?.dispose();
  }
}
