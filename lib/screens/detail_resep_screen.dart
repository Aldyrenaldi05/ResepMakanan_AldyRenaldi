import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep_makanan/providers/resep_provider.dart';

class DetailResepScreen extends StatefulWidget {
  final String? title;
  final String? id;
  const DetailResepScreen({this.title, this.id, Key? key}) : super(key: key);

  @override
  State<DetailResepScreen> createState() => _DetailResepScreenState();
}

class _DetailResepScreenState extends State<DetailResepScreen> {
//  final ResepDetailProvider _detailprovider = ResepDetailProvider();
  @override
  void initState() {
    // _detailprovider.setId(widget.id);
    // _provider.id = widget.id;
    // print(_provider.id);
    // _provider.ShowDetailResep(widget.id);
    // print(widget.id);
    // Provider.of<ResepDetailProvider>(context,listen: false).showDetailResep();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  final res = Provider.of<ResepDetailProvider>(context,listen: false).showDetailResep(widget.id);
    //  print(res);

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Consumer<ResepProvider>(
        builder: (context, resepProvider, child) {
          return SingleChildScrollView(
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        "${resepProvider.detailResepModel.results!.thumb}"),
                    Text(
                      "${resepProvider.detailResepModel.results!.title}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Porsi : ${resepProvider.detailResepModel.results!.servings}",
                      // style: GoogleFonts.montserrat(
                      // textStyle: TextStyle(
                      // fontSize: 20,
                    ),
                    // ),
                    // ),
                    SizedBox(height: 10.0),
                    Text(
                        "Lama Pengerjaan : ${resepProvider.detailResepModel.results!.times}"),
                    SizedBox(height: 10.0),
                    Text(
                        "Level Pengerjaan : ${resepProvider.detailResepModel.results!.dificulty}"),
                    SizedBox(height: 10.0),
                    Text(
                        "Penulis : ${resepProvider.detailResepModel.results!.author!.user}"),
                    SizedBox(height: 10.0),
                    Text(
                        "Penulis : ${resepProvider.detailResepModel.results!.author!.datePublished}"),
                    SizedBox(height: 10.0),

                    Text(
                        "Deskripsi : ${resepProvider.detailResepModel.results!.desc}"),
                    SizedBox(height: 10.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: resepProvider
                          .detailResepModel.results!.needItem!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(
                                "${resepProvider.detailResepModel.results!.needItem![index].itemName!}"),
                            Image.network(
                                "${resepProvider.detailResepModel.results!.needItem![index].thumbItem!}"),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 10.0),
                    Text(
                        "Bahan-Bahan : ${resepProvider.detailResepModel.results!.ingredient}"),

                    SizedBox(height: 10.0),
                    Text("STEP : "),
                    Text("${resepProvider.detailResepModel.results!.step}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
