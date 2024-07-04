import 'package:flutter/material.dart';

class ProklamatorPage extends StatefulWidget {
  const ProklamatorPage({Key? key}) : super(key: key);

  @override
  _ProklamatorPageState createState() => _ProklamatorPageState();
}

class _ProklamatorPageState extends State<ProklamatorPage> {
  List<Map<String, String>> proklamators = [
    {
      'name': 'Ir. Soekarno',
      'biography':
          'Ir. Soekarno, lahir pada tahun 1901 di Surabaya, adalah salah satu tokoh sentral dalam perjuangan kemerdekaan Indonesia dan pendiri Republik Indonesia pertama. Beliau adalah pemimpin nasionalis yang karismatik dan visioner, yang memainkan peran kunci dalam menyatukan berbagai kelompok dan mengoordinasikan perjuangan untuk kemerdekaan Indonesia dari penjajahan Belanda. Soekarno terpilih sebagai Presiden Indonesia pertama pada tahun 1945 setelah Proklamasi Kemerdekaan, dan meskipun menghadapi berbagai tantangan politik dan ekonomi selama masa kepemimpinannya, beliau tetap dikenang sebagai Bapak Proklamator dan salah satu arsitek utama negara Indonesia modern.',
      'imageName': 'sukarno.jpeg',
    },
    {
      'name': 'Mohammad Hatta',
      'biography':
          'Mohammad Hatta, lahir pada tahun 1902 di Bukittinggi, Sumatra Barat, adalah salah satu tokoh penting dalam perjuangan kemerdekaan Indonesia dan merupakan pendiri Republik Indonesia bersama dengan Soekarno. Hatta dikenal sebagai seorang pemikir ekonomi dan politik yang cemerlang, yang aktif dalam membangun fondasi negara baru setelah Proklamasi Kemerdekaan pada tahun 1945. Beliau menjabat sebagai Wakil Presiden pertama Indonesia dan berperan penting dalam merumuskan kebijakan ekonomi serta diplomasi negara dalam menghadapi tantangan internal dan eksternal. Hatta juga dikenal karena gagasan-gagasannya tentang demokrasi ekonomi, kesejahteraan sosial, dan perdamaian internasional, yang masih mempengaruhi pandangan politik Indonesia hingga saat ini.',
      'imageName': 'hatta.jpeg',
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

  void _editProklamator(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProklamatorPage(
          proklamator: proklamators[index],
        ),
      ),
    );
    if (result != null) {
      setState(() {
        proklamators[index] = result;
      });
    }
  }

  void _deleteProklamator(int index) {
    setState(() {
      proklamators.removeAt(index);
    });
  }

  void _addProklamator() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProklamatorPage(),
      ),
    );
    if (result != null) {
      setState(() {
        proklamators.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Pahlawan Proklamator',
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
            children: proklamators.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> proklamator = entry.value;

              return InkWell(
                onTap: () {
                  _navigateToBiography(
                    context,
                    proklamator['name']!,
                    proklamator['biography']!,
                    proklamator['imageName']!,
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
                              proklamator['name']!,
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
                                  _editProklamator(index);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.white),
                                onPressed: () {
                                  _deleteProklamator(index);
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
        onPressed: _addProklamator,
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
              errorBuilder: (context, error, stackTrace) {
                return Text('Gambar tidak ditemukan');
              },
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

class EditProklamatorPage extends StatefulWidget {
  final Map<String, String>? proklamator;

  const EditProklamatorPage({Key? key, this.proklamator}) : super(key: key);

  @override
  _EditProklamatorPageState createState() => _EditProklamatorPageState();
}

class _EditProklamatorPageState extends State<EditProklamatorPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _biographyController;
  late TextEditingController _imageNameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.proklamator?['name'] ?? '',
    );
    _biographyController = TextEditingController(
      text: widget.proklamator?['biography'] ?? '',
    );
    _imageNameController = TextEditingController(
      text: widget.proklamator?['imageName'] ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _biographyController.dispose();
    _imageNameController.dispose();
    super.dispose();
  }

  void _saveProklamator() {
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
        title: Text(widget.proklamator == null
            ? 'Tambah Proklamator'
            : 'Edit Proklamator'),
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
                onPressed: _saveProklamator,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
