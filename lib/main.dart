import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recuperar el valor d''un camp de text',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final textToShow = TextEditingController();

  @override
  void dispose() {
    textToShow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: textToShow,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return SimpleDialog(
                title: const Text("Escull   un tipus de Diàleg"),
                children:[
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop();
                      showDialog(context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return SimpleDialog(
                            title: const Text("Simple Dialog"),
                            children: [
                              SimpleDialogOption(
                                child: Text(textToShow.text),
                              )
                            ],
                          );
                        });
                    },
                    child: Text("Simple Dialog"),
                  ),

                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Alert Dialog"),
                              content: Text(textToShow.text),
                              actions: [
                                ElevatedButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text("OK")
                                )
                              ],
                            );
                          });
                    },
                    child: Text("Alert Dialog"),
                  ),

                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(textToShow.text),
                          duration: Duration(seconds: 1),
                        )
                      );
                    },
                    child: Text("Snack Bar"),
                  ),

                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop();
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)
                                )
                              ),
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(textToShow.text),
                                    ElevatedButton(
                                        onPressed: () => Navigator.of(context).pop(),
                                        child: const Text("Tancar BottomSheet")
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                      );
                    },
                    child: Text("ModalBottomSheet"),
                  ),
                ],

              );
            }
          );
        },
        tooltip: 'Mostra el valor!',
        backgroundColor: Colors.purple,
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
