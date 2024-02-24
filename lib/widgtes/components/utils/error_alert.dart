import 'package:flutter/material.dart';

class ErrorAlert {
  ErrorAlert(BuildContext context, {String? title, String? errorMessage}) {
    AlertDialog alert = AlertDialog(
      title: title != null ? Text(title) : const Text("Erro"),
      content: errorMessage != null
          ? Text(errorMessage)
          : const Text("Ocorreu um erro"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Fechar'),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
