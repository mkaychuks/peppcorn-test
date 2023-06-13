// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pep_test/services/api_service.dart';
import 'package:pep_test/widgets/card.dart';

class NFTScreen extends StatelessWidget {
  const NFTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: const Text(
          "10 Awesome NFT Projects",
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          child: FutureBuilder(
            future: ApiService().getTop10Nft(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final nft = data[index];
                    return ReUseableListTile(
                      coinName: nft.name,
                      imagePath: "",
                      abr: nft.name,
                      marketCap: nft.contractAddress,
                      initialText: "Address",
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("Error fetching data"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

