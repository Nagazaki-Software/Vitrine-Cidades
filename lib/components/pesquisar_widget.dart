import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'pesquisar_model.dart';
export 'pesquisar_model.dart';

class PesquisarWidget extends StatefulWidget {
  const PesquisarWidget({super.key});

  @override
  State<PesquisarWidget> createState() => _PesquisarWidgetState();
}

class _PesquisarWidgetState extends State<PesquisarWidget> {
  late PesquisarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PesquisarModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 8.0),
        child: StreamBuilder<List<SeusprodutosRecord>>(
          stream: querySeusprodutosRecord(),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitRipple(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 50.0,
                  ),
                ),
              );
            }
            List<SeusprodutosRecord> textFieldSeusprodutosRecordList =
                snapshot.data!;

            return TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onFieldSubmitted: (_) async {
                safeSetState(() {
                  _model.simpleSearchResults = TextSearch(
                    textFieldSeusprodutosRecordList
                        .map(
                          (record) =>
                              TextSearchItem.fromTerms(record, [record.name!]),
                        )
                        .toList(),
                  )
                      .search(_model.textController.text)
                      .map((r) => r.object)
                      .toList();
                  ;
                });

                context.pushNamed(
                  'pesquisa',
                  queryParameters: {
                    'pesquisa': serializeParam(
                      _model.simpleSearchResults,
                      ParamType.Document,
                      isList: true,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'pesquisa': _model.simpleSearchResults,
                  },
                );
              },
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Buscar produtos...',
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.rubik(),
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.rubik(),
                    letterSpacing: 0.0,
                  ),
              minLines: 1,
              validator: _model.textControllerValidator.asValidator(context),
            );
          },
        ),
      ),
    );
  }
}
