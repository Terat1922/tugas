import 'package:flutter/material.dart';

class KemerdekaanPage extends StatefulWidget {
  const KemerdekaanPage({Key? key}) : super(key: key);

  @override
  _KemerdekaanPageState createState() => _KemerdekaanPageState();
}

class _KemerdekaanPageState extends State<KemerdekaanPage> {
  List<Map<String, String>> kemerdekaan = [
    {
      'name': 'Pangeran Diponegoro',
      'biography':
          'Pangeran Diponegoro adalah salah satu tokoh sentral dalam sejarah perjuangan kemerdekaan Indonesia pada abad ke-19. Beliau lahir pada tahun 1785 di Keraton Yogyakarta dan dikenal sebagai pangeran yang gigih dalam melawan kolonialisme Belanda. Pada tahun 1825, Diponegoro memimpin perang gerilya melawan Belanda dalam peristiwa yang dikenal sebagai Perang Diponegoro. Konflik ini berlangsung selama lima tahun dan menimbulkan penderitaan besar bagi rakyat Jawa. Meskipun akhirnya beliau ditangkap oleh Belanda pada tahun 1830 dan diasingkan ke Manado, perlawanan Diponegoro telah meninggalkan jejak penting dalam sejarah perjuangan bangsa Indonesia untuk meraih kemerdekaan.',
      'imageName': 'diponegoro.jpeg',
    },
    {
      'name': 'Sultan Maulana Hasanuddin',
      'biography':
          'Sultan Maulana Hasanuddin adalah sosok yang dikenal sebagai pahlawan nasional Indonesia yang berasal dari Sulawesi Selatan. Beliau lahir pada tahun 1631 dan memimpin perlawanan sengit melawan penjajah Belanda pada abad ke-17. Sultan Hasanuddin menjadi simbol perlawanan yang gigih dan strategis terhadap upaya kolonialisasi Belanda di wilayah Makassar. Meskipun akhirnya Belanda berhasil menaklukkan kerajaannya pada tahun 1669, perlawanan Sultan Hasanuddin menginspirasi semangat perjuangan bangsa Indonesia dalam meraih kemerdekaan dari penjajahan.',
      'imageName': 'hasanudin.jpeg',
    },
    {
      'name': 'Tuanku Imam Bonjol',
      'biography':
          'Tuanku Imam Bonjol adalah salah satu pemimpin perang antikolonial di Sumatra Barat pada abad ke-19. Beliau lahir pada tahun 1772 di Tanjung Gadang, Pasaman, dan dikenal atas peranannya dalam memimpin perlawanan terhadap penjajah Belanda dalam perang Padri (1821-1837). Imam Bonjol mengoordinasikan gerakan perlawanan dari benteng-benteng di daerah Minangkabau dan berhasil menahan serangan Belanda selama beberapa tahun. Meskipun akhirnya ditangkap pada tahun 1837 dan diasingkan ke Jawa hingga wafatnya pada tahun 1864, perjuangan beliau telah diabadikan sebagai bagian penting dari sejarah perlawanan Indonesia terhadap penjajahan kolonial.',
      'imageName': 'imam.jpeg',
    },
    {
      'name': 'Kapitan Pattimura',
      'biography':
          'Kapitan Pattimura, atau nama aslinya Thomas Matulessy, adalah salah satu tokoh pahlawan nasional Indonesia yang berasal dari Maluku. Beliau lahir pada tahun 1783 di Saparua dan memimpin perlawanan heroik terhadap penjajah Belanda pada awal abad ke-19. Pattimura memimpin serangan terhadap benteng Belanda di Fort Duurstede, Ambon, pada tahun 1817, dalam upaya membebaskan Maluku dari dominasi kolonial. Meskipun akhirnya ditangkap dan dihukum mati oleh Belanda pada tahun yang sama, perjuangan Pattimura menjadi simbol ketahanan dan semangat perlawanan dalam sejarah perjuangan kemerdekaan Indonesia.',
      'imageName': 'patimura.jpeg',
    },
    {
      'name': 'Cut Nyak Dien',
      'biography':
          'Cut Nyak Dien, atau dikenal juga sebagai Teuku Umars Cut Nyak Dien adalah salah satu pahlawan nasional Indonesia yang lahir di Aceh pada tahun 1848. Beliau dikenal karena peranannya yang sangat signifikan dalam perlawanan terhadap kolonialis Belanda selama Perang Aceh. Cut Nyak Dien adalah istri dari Teuku Umar, seorang panglima perang Aceh terkemuka, dan setelah kematian suaminya, beliau melanjutkan perjuangan dengan memimpin pasukan Aceh melawan Belanda. Meskipun ditangkap oleh Belanda pada tahun 1901 dan diasingkan ke Sumedang, Jawa Barat, Cut Nyak Dien tetap dihormati sebagai simbol perlawanan dan kegigihan dalam mempertahankan kemerdekaan bangsa Aceh.',
      'imageName': 'cut.jpeg',
    },
  ];

  void _navigateToBiography(
      BuildContext context, String name, String biography, String imageName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BiographyPage(
            name: name, biography: biography, imageName: imageName),
      ),
    );
  }

  void _editKemerdekaan(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditKemerdekaanPage(
          kemerdekaan: kemerdekaan[index],
        ),
      ),
    );
    if (result != null) {
      setState(() {
        kemerdekaan[index] = result;
      });
    }
  }

  void _deleteKemerdekaan(int index) {
    setState(() {
      kemerdekaan.removeAt(index);
    });
  }

  void _addKemerdekaan() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditKemerdekaanPage(),
      ),
    );
    if (result != null) {
      setState(() {
        kemerdekaan.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Pahlawan Kemerdekaan Nasional',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: kemerdekaan.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> kemerdekaanData = entry.value;

              return InkWell(
                onTap: () {
                  _navigateToBiography(
                    context,
                    kemerdekaanData['name']!,
                    kemerdekaanData['biography']!,
                    kemerdekaanData['imageName']!,
                  );
                },
                child: Container(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.all(10),
                    color: Colors.blue,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              kemerdekaanData['name']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.white),
                                onPressed: () {
                                  _editKemerdekaan(index);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.white),
                                onPressed: () {
                                  _deleteKemerdekaan(index);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addKemerdekaan,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class BiographyPage extends StatelessWidget {
  final String name;
  final String biography;
  final String imageName;

  const BiographyPage(
      {Key? key,
      required this.name,
      required this.biography,
      required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'gambar/$imageName',
              width: 200,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              biography,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class EditKemerdekaanPage extends StatefulWidget {
  final Map<String, String>? kemerdekaan;

  const EditKemerdekaanPage({Key? key, this.kemerdekaan}) : super(key: key);

  @override
  _EditKemerdekaanPageState createState() => _EditKemerdekaanPageState();
}

class _EditKemerdekaanPageState extends State<EditKemerdekaanPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _biographyController;
  late TextEditingController _imageNameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.kemerdekaan?['name'] ?? '',
    );
    _biographyController = TextEditingController(
      text: widget.kemerdekaan?['biography'] ?? '',
    );
    _imageNameController = TextEditingController(
      text: widget.kemerdekaan?['imageName'] ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _biographyController.dispose();
    _imageNameController.dispose();
    super.dispose();
  }

  void _saveKemerdekaan() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, {
        'name': _nameController.text,
        'biography': _biographyController.text,
        'imageName': _imageNameController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kemerdekaan == null
            ? 'Tambah Kemerdekaan'
            : 'Edit Kemerdekaan'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _biographyController,
                decoration: InputDecoration(labelText: 'Biografi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Biografi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageNameController,
                decoration: InputDecoration(labelText: 'Nama Gambar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama gambar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveKemerdekaan,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
