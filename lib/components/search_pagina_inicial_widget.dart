import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'search_pagina_inicial_model.dart';
export 'search_pagina_inicial_model.dart';

class SearchPaginaInicialWidget extends StatefulWidget {
  const SearchPaginaInicialWidget({super.key});

  @override
  State<SearchPaginaInicialWidget> createState() =>
      _SearchPaginaInicialWidgetState();
}

class _SearchPaginaInicialWidgetState extends State<SearchPaginaInicialWidget> {
  late SearchPaginaInicialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPaginaInicialModel());

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
      height: 44.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
              child: Icon(
                Icons.search_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                onFieldSubmitted: (_) async {
                  await querySearchsRecordOnce()
                      .then(
                        (records) => _model.simpleSearchResults = TextSearch(
                          records
                              .map(
                                (record) => TextSearchItem.fromTerms(record, [
                                  record.nomeDoProduto!,
                                  record.nomeDoLojista!,
                                  record.nomeDoPrestador!
                                ]),
                              )
                              .toList(),
                        )
                            .search(_model.textController.text)
                            .map((r) => r.object)
                            .toList(),
                      )
                      .onError((_, __) => _model.simpleSearchResults = [])
                      .whenComplete(() => safeSetState(() {}));

                  context.pushNamed(
                    'search',
                    queryParameters: {
                      'pesquisa': serializeParam(
                        _model.simpleSearchResults,
                        ParamType.Document,
                        isList: true,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'pesquisa': _model.simpleSearchResults,
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                      ),
                    },
                  );
                },
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Procurar...',
                  hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        font: GoogleFonts.nunito(),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hoverColor: FlutterFlowTheme.of(context).primary,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.nunito(),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
                minLines: 1,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
