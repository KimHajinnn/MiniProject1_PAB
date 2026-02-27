import 'package:flutter/material.dart';
import '../models/data_tempat_makan.dart';
import 'formpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TempatMakan> daftarTempat = [
    TempatMakan(
      nama: "Bakso President Samarinda",
      alamat: "Jl. Pahlawan No. 12",
      kategori: "Bakso",
      rating: "4.5",
    ),
    TempatMakan(
      nama: "Warung Ayam Geprek Sambal Gila",
      alamat: "Jl. Juanda",
      kategori: "Ayam",
      rating: "4.3",
    ),
    TempatMakan(
      nama: "Ocean Seafood Samarinda",
      alamat: "Jl. Ahmad Yani",
      kategori: "Seafood",
      rating: "4.7",
    ),
    TempatMakan(
      nama: "Coffee Story Samarinda",
      alamat: "Jl. DI Panjaitan",
      kategori: "Coffee",
      rating: "4.6",
    ),
  ];

  List<TempatMakan> filteredList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredList = daftarTempat;
  }

  void searchData(String keyword) {
    setState(() {
      filteredList = daftarTempat
          .where((data) =>
              data.nama.toLowerCase().contains(keyword.toLowerCase()) ||
              data.kategori.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  void tambahData(TempatMakan data) {
    setState(() {
      daftarTempat.add(data);
      filteredList = daftarTempat;
    });
  }

  void updateData(int index, TempatMakan dataBaru) {
    setState(() {
      daftarTempat[index] = dataBaru;
      filteredList = daftarTempat;
    });
  }

  void hapusData(int index) {
    setState(() {
      daftarTempat.removeAt(index);
      filteredList = daftarTempat;
    });
  }

  IconData getKategoriIcon(String kategori) {
    switch (kategori.toLowerCase()) {
      case "bakso":
        return Icons.ramen_dining;
      case "coffee":
        return Icons.local_cafe;
      case "seafood":
        return Icons.set_meal;
      case "ayam":
        return Icons.lunch_dining;
      case "mie":
        return Icons.ramen_dining;
      case "sate":
        return Icons.outdoor_grill;
      case "fast food":
        return Icons.fastfood;
      default:
        return Icons.restaurant;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "🍽 Samarinda Food List",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 🔎 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: searchData,
              decoration: InputDecoration(
                hintText: "Cari tempat makan...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 📋 LIST DATA
          Expanded(
            child: filteredList.isEmpty
                ? const Center(
                    child: Text(
                      "Data tidak ditemukan 😢",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final data = filteredList[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              backgroundColor: Colors.orange.shade100,
                              child: Icon(
                                getKategoriIcon(data.kategori),
                                color: Colors.deepOrange,
                              ),
                            ),
                            title: Text(
                              data.nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.alamat),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    const SizedBox(width: 4),
                                    Text("Rating: ${data.rating}")
                                  ],
                                )
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.blueGrey),
                              onPressed: () {
                                int originalIndex =
                                    daftarTempat.indexOf(data);
                                hapusData(originalIndex);
                              },
                            ),
                            onTap: () {
                              int originalIndex =
                                  daftarTempat.indexOf(data);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormPage(
                                    onSubmit: (dataBaru) =>
                                        updateData(originalIndex, dataBaru),
                                    tempatMakan: data,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(
                onSubmit: tambahData,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}