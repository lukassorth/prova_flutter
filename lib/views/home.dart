import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/models/item.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../stores/homeStore.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = HomeStore();

  final FocusNode _focusNode = FocusNode();
  int edittingId = -1;
  bool isValid = false;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    homeController.getListItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text(
                'Política de Privacidade',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                const url = 'https://google.com.br/';
                launchUrlString(url);
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.9],
              colors: [
                Color.fromARGB(255, 33, 77, 92),
                Color.fromARGB(255, 52, 146, 130),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Observer(builder: (_) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        child: homeController.list.isEmpty
                            ? const Center(
                                child: Text('Nenhum item encontrado'))
                            : ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: homeController.list.length,
                                itemBuilder: (context, index) => ListTile(
                                  title: Text(
                                    homeController.list[index].text!,
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                  ),
                                  trailing: SizedBox(
                                    width: 64,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                            child: IconButton(
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _textController.text =
                                                  homeController
                                                      .list[index].text!;
                                              edittingId = homeController
                                                  .list[index].id!;
                                            });
                                          },
                                        )),
                                        Expanded(
                                          child: IconButton(
                                            icon: const Icon(
                                              CupertinoIcons.xmark_circle_fill,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Confirmar Exclusão'),
                                                    content: const Text(
                                                        'Tem certeza de que deseja excluir este item?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            'Cancelar'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          homeController
                                                              .removeItem(
                                                                  index);

                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            'Excluir'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      );
                    }),
                  ),
                  TextField(
                    controller: _textController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      suffixIcon: isValid
                          ? const Icon(Icons.check_circle,
                              color: Color.fromARGB(255, 68, 189, 110))
                          : null,
                      hintText: 'Digite seu Texto',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                    ),
                    autofocus: true,
                    onChanged: (value) {
                      if (value != '') {
                        setState(() {
                          isValid = true;
                        });
                      } else {
                        setState(() {
                          isValid = false;
                        });
                      }
                    },
                    canRequestFocus: true,
                    onSubmitted: (value) {
                      if (value != '') {
                        homeController.add(
                            item: Item(
                                text: _textController.text, id: edittingId));
                        _textController.clear();
                      }
                      edittingId = -1;
                      _focusNode.requestFocus();
                      setState(() {
                        isValid = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
