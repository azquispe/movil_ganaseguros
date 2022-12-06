import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movil_ganaseguros/avisos/models/aviso_model.dart';
import 'package:movil_ganaseguros/avisos/providers/aviso_provider.dart';
import 'package:movil_ganaseguros/informacion/widgets/custom_bottom_navigator_widget.dart';
import 'package:provider/provider.dart';
import 'package:movil_ganaseguros/utils/colores.dart' as colores;

class AvisoPage extends StatefulWidget {
  @override
  State<AvisoPage> createState() => _AvisoPageState();
}

class _AvisoPageState extends State<AvisoPage> {
  @override
  void initState() {
    // TODO: implement initState
    obtieneListaAviso(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final avisoProvider = Provider.of<AvisoProvider>(context);
    return Scaffold(
      backgroundColor: colores.pri_blanco,
      appBar: AppBar(
        title: Image(
            width: 200,
            height: 50,
            image: AssetImage('assets/img/logo_ganaseguros_400.png')),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: colores.pri_verde_claro),
        elevation: 0,
      ),
      body: avisoProvider.lstAvisoModel.length > 0
          ? _crearListaAviso(avisoProvider.lstAvisoModel)
          : Center(
              child: CircularProgressIndicator(
              backgroundColor: colores.sec_negro_claro4,
              valueColor: AlwaysStoppedAnimation(colores.pri_verde_claro),
              strokeWidth: 5,
            )),
      bottomNavigationBar: CustomBottomNavigatorWidget(),
    );
  }

  Widget _crearListaAviso(List<AvisoModel> lstAviso) {
    return ListView.builder(
        itemCount: lstAviso.length,
        itemBuilder: (BuildContext context, int index) {
          return _crearItemAviso(pAvisoModel: lstAviso[index]);
        });
  }

  Widget _crearItemAviso({required AvisoModel pAvisoModel}) {
    return Card(
        color: colores.pri_blanco,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: colores.sec_verde_oscuro,
          ),
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              _tituloAviso(pAvisoModel),
              _contenidoAviso(pAvisoModel),
              _imagenAviso(pAvisoModel),
              Divider(
                color: Colors.indigo,
              ),
              _fechaAviso(pAvisoModel)
            ],
          ),
        ),
    );

    /*return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(width: 1, color: colores.sec_verde_oscuro)),
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              _tituloAviso(pAvisoModel),
              _contenidoAviso(pAvisoModel),
              _imagenAviso(pAvisoModel),
              Divider(
                color: Colors.indigo,
              ),
              _fechaAviso(pAvisoModel)
            ],
          ),
        ));*/
  }

  Widget _tituloAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.titulo != null &&
        pAvisoModel.titulo!.trim() != "") // titulo obligatorio
      return Column(
        children: [
          Text(
            pAvisoModel.titulo!.trim().toString(),
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ],
      );
    else
      return Row();
  }

  Widget _imagenAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.enlace != null && pAvisoModel.enlace!.trim() != "") {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          child: Container(
            //width: MediaQuery.of(context).size.width * 0.98,
            child: FadeInImage(
              placeholder: AssetImage('assets/gif/loading.gif'),
              image: NetworkImage(pAvisoModel.enlace!.trim()),
            ),
          ),
        ),
      );
    } else {
      return Column();
    }
  }

  Column _contenidoAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.contenido != null && pAvisoModel.contenido!.trim() != "")
      return Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          child: Text(
            pAvisoModel.contenido.toString(),
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.left,
          ),
        ),
      ]);
    else {
      return Column();
    }
  }

  Widget _fechaAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.fechaAviso != null && pAvisoModel.fechaAviso!.trim() != "")
      return Container(
        //width: MediaQuery.of(context).size.width * 0.95,
        child: Row(children: [
          Text(
            "fecha publicación: ",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Container(
            child: Text(
              pAvisoModel.fechaAviso.toString(),
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.right,
            ),
          ),
        ]),
      );
    else {
      return Row();
    }
  }

  obtieneListaAviso(BuildContext context) async {
    final avisoProvider = Provider.of<AvisoProvider>(context, listen: false);
    await avisoProvider.obtenerAvisos();
  }
}
