import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep_makanan/providers/resep_provider.dart';
import 'package:resep_makanan/screens/detail_resep_screen.dart';

class ResepScreen extends StatefulWidget {
  const ResepScreen({Key? key}) : super(key: key);

  @override
  State<ResepScreen> createState() => _ResepScreenState();
}

class _ResepScreenState extends State<ResepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Makanan'),
      ),
      body: Consumer<ResepProvider>(
        builder: (context, resepProvider, child) {
          return ListView.builder(
            itemCount: resepProvider.resepModel.results?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailResepScreen(
                        title: resepProvider.resepModel.results![index].title,
                        id: resepProvider.resepModel.results![index].key,
                      ),
                    ),
                  );
                  resepProvider.showDetailResep(
                      resepProvider.resepModel.results![index].key);
                },
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            "${resepProvider.resepModel.results![index].thumb}"),
                        Text(
                          "${resepProvider.resepModel.results![index].title}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            "Porsi : ${resepProvider.resepModel.results![index].portion}"),
                        Text(
                            "Lama Pengerjaan : ${resepProvider.resepModel.results![index].times}"),
                        Text(
                            "Level Pengerjaan : ${resepProvider.resepModel.results![index].dificulty}"),
                      ],
                    ),
                  ),
                ),
              );
            },
            padding: const EdgeInsets.all(18),
          );
        },
      ),
    );
  }
}
