import 'package:flutter/material.dart';
import '../models/data_tempat_makan.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  final Function(TempatMakan) onSubmit;
  final TempatMakan? tempatMakan;

  const FormPage({
    super.key,
    required this.onSubmit,
    this.tempatMakan,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late TextEditingController namaController;
  late TextEditingController alamatController;
  late TextEditingController kategoriController;
  late TextEditingController ratingController;
  final _formKey = GlobalKey<FormState>();
  final List<String> kategoriList = [
    "Bakso",
    "Ayam",
    "Seafood",
    "Coffee",
    "Mie",
    "Sate",
    "Fast Food",
  ];

String? selectedKategori;
  @override
  void initState() {
    super.initState();

    namaController =
      TextEditingController(text: widget.tempatMakan?.nama ?? "");
    alamatController =
      TextEditingController(text: widget.tempatMakan?.alamat ?? "");
    ratingController =
      TextEditingController(text: widget.tempatMakan?.rating ?? "");

    selectedKategori = widget.tempatMakan?.kategori;
  } 

  InputDecoration customInput(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.orange),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.tempatMakan == null
            ? "Tambah Tempat Makan"
            : "Edit Tempat Makan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(
                controller: namaController,
                decoration: customInput("Nama Tempat", Icons.restaurant),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: alamatController,
                decoration: customInput("Alamat", Icons.location_on),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                initialValue: selectedKategori,
                decoration: customInput("Kategori", Icons.fastfood),
                items: kategoriList.map((kategori) {
                  return DropdownMenuItem(
                    value: kategori,
                      child: Text(kategori),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedKategori = value;
                  });
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: ratingController,
                decoration: customInput("Rating (1-5)", Icons.star),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "Rating Wajib di Isi";
                  }
                  int? rating = int.tryParse(value);

                  if (rating == null || rating < 1 || rating > 5) {
                    return "Rating hanya boleh antara 1-5 saja";
                  }
                  return null;
                }
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      TempatMakan data = TempatMakan(
                        nama: namaController.text,
                        alamat: alamatController.text,
                        kategori: selectedKategori ?? "Lainnya",
                        rating: ratingController.text,
                      );
                      widget.onSubmit(data);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
    ) );
  }
}