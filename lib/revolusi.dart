import 'package:flutter/material.dart';

class RevolusiPage extends StatefulWidget {
  const RevolusiPage({Key? key}) : super(key: key);

  @override
  _RevolusiPageState createState() => _RevolusiPageState();
}

class _RevolusiPageState extends State<RevolusiPage> {
  List<Map<String, String>> revolusioners = [
    {
      'name': 'Jenderal Ahmad Yani',
      'biography':
          'Jenderal Ahmad Yani adalah salah satu tokoh militer terkemuka Indonesia yang lahir pada tahun 1922 di Purworejo, Jawa Tengah. Beliau dikenal sebagai salah satu arsitek utama dalam pembentukan dan modernisasi Tentara Nasional Indonesia (TNI) setelah kemerdekaan. Yani memiliki karier militer yang cemerlang, mulai dari terlibat dalam perjuangan kemerdekaan Indonesia hingga menjadi Kepala Staf Angkatan Darat (KSAD) pada tahun 1962. Selama masa jabatannya, Yani terlibat dalam berbagai operasi militer dan juga berperan dalam membangun kekuatan pertahanan Indonesia. Namun, perjalanan kariernya yang gemilang terhenti tragis pada tahun 1965 ketika beliau menjadi salah satu korban dalam peristiwa Gerakan 30 September. Meskipun telah tiada, jasa-jasa Jenderal Ahmad Yani dalam membangun dan mempertahankan kedaulatan Indonesia tetap dihargai dan diingat hingga saat ini.',
      'imageName': 'yani.jpeg',
    },
    {
      'name': 'Letjen Suprapto',
      'biography':
          'Letjen Suprapto adalah seorang tokoh militer Indonesia yang lahir pada tahun 1894 di Yogyakarta. Beliau memainkan peran penting dalam sejarah perjuangan kemerdekaan Indonesia, terutama selama masa Revolusi Nasional Indonesia melawan penjajah Belanda. Suprapto aktif dalam berbagai operasi militer dan memimpin pasukan dengan keberanian selama pertempuran melawan Belanda, termasuk dalam pertempuran di Ambarawa. Setelah kemerdekaan, Suprapto terus berkarier di militer dan menjabat sebagai Panglima Besar Tentara Nasional Indonesia Angkatan Darat (TNI-AD). Dedikasi dan kontribusinya dalam mempertahankan kemerdekaan Indonesia menjadikan Suprapto sebagai salah satu tokoh militer yang dihormati dalam sejarah bangsa Indonesia.',
      'imageName': 'suprapto.jpeg',
    },
    {
      'name': 'Letjen M.T. Haryono',
      'biography':
          'Letjen M.T. Haryono adalah seorang tokoh militer Indonesia yang lahir pada tahun 1923 di Yogyakarta. Beliau dikenal sebagai salah satu panglima perang terkemuka dalam perjuangan kemerdekaan Indonesia dan merupakan tokoh penting dalam Tentara Nasional Indonesia (TNI). Haryono aktif dalam berbagai operasi militer selama masa Revolusi Nasional Indonesia melawan penjajah Belanda, termasuk dalam pertempuran sengit di Yogyakarta dan sekitarnya. Setelah kemerdekaan, Haryono terus berkarier di TNI dan menjabat dalam berbagai posisi strategis, termasuk sebagai Kepala Staf Angkatan Darat (KSAD). Dedikasi dan keberaniannya dalam mempertahankan kedaulatan negara menjadikan Letjen M.T. Haryono sebagai salah satu tokoh militer yang dihormati dan diabadikan dalam sejarah perjuangan bangsa Indonesia.',
      'imageName': 'haryono.jpeg',
    },
    {
      'name': 'Mayjen D.I. Panjaitan',
      'biography':
          'Letjen Mayjen D.I. Panjaitan adalah seorang tokoh militer Indonesia yang lahir pada tahun 1925 di Sumedang, Jawa Barat. Beliau dikenal sebagai salah satu tokoh strategis dalam perjuangan kemerdekaan dan pembangunan negara Indonesia pasca-kemerdekaan. Panjaitan aktif dalam perang kemerdekaan melawan penjajah Belanda, dan kemudian memainkan peran penting dalam membangun struktur pertahanan dan keamanan nasional. Karier militernya meliputi berbagai posisi kunci, seperti Kepala Staf Angkatan Darat (KSAD) dan Panglima Tentara Nasional Indonesia (TNI). Selain itu, Panjaitan juga dikenal sebagai seorang pemikir strategis yang berpengaruh dalam pembentukan kebijakan pertahanan Indonesia. Dedikasinya terhadap keamanan dan kedaulatan negara menjadikan Letjen Mayjen D.I. Panjaitan sebagai salah satu tokoh militer yang dihormati dalam sejarah modern Indonesia.',
      'imageName': 'panjaitan.jpeg',
    },
    {
      'name': 'Mayjen Sutoyo Siswomiharjo',
      'biography':
          'Mayjen Sutoyo Siswomiharjo adalah seorang pahlawan revolusi Indonesia yang lahir pada tahun 1925 di Boyolali, Jawa Tengah. Beliau aktif dalam perjuangan kemerdekaan Indonesia melawan penjajah Belanda dan kemudian terlibat dalam mempertahankan kemerdekaan negara dari ancaman agresi militer Belanda dan revolusi DI/TII. Sutoyo Siswomiharjo memainkan peran penting dalam berbagai operasi militer strategis, termasuk dalam Pertempuran Surabaya dan dalam membela kemerdekaan Indonesia di berbagai front. Setelah kemerdekaan, Sutoyo Siswomiharjo terus berkarier dalam militer Indonesia dan mengabdi dalam berbagai posisi penting, memperkuat struktur pertahanan nasional. Dedikasi dan pengorbanannya dalam melindungi kedaulatan negara menjadikan Mayjen Sutoyo Siswomiharjo sebagai salah satu pahlawan revolusi yang dihormati dalam sejarah perjuangan bangsa Indonesia.',
      'imageName': 'sutoyo.jpeg',
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

  void _editRevolusioner(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditRevolusionerPage(
          revolusioner: revolusioners[index],
        ),
      ),
    );
    if (result != null) {
      setState(() {
        revolusioners[index] = result;
      });
    }
  }

  void _deleteRevolusioner(int index) {
    setState(() {
      revolusioners.removeAt(index);
    });
  }

  void _addRevolusioner() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditRevolusionerPage(),
      ),
    );
    if (result != null) {
      setState(() {
        revolusioners.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Pahlawan Revolusi',
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
            children: revolusioners.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> revolusioner = entry.value;

              return InkWell(
                onTap: () {
                  _navigateToBiography(
                    context,
                    revolusioner['name']!,
                    revolusioner['biography']!,
                    revolusioner['imageName']!,
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
                              revolusioner['name']!,
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
                                  _editRevolusioner(index);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.white),
                                onPressed: () {
                                  _deleteRevolusioner(index);
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
        onPressed: _addRevolusioner,
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

class EditRevolusionerPage extends StatefulWidget {
  final Map<String, String>? revolusioner;

  const EditRevolusionerPage({Key? key, this.revolusioner}) : super(key: key);

  @override
  _EditRevolusionerPageState createState() => _EditRevolusionerPageState();
}

class _EditRevolusionerPageState extends State<EditRevolusionerPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _biographyController;
  late TextEditingController _imageNameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.revolusioner?['name'] ?? '',
    );
    _biographyController = TextEditingController(
      text: widget.revolusioner?['biography'] ?? '',
    );
    _imageNameController = TextEditingController(
      text: widget.revolusioner?['imageName'] ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _biographyController.dispose();
    _imageNameController.dispose();
    super.dispose();
  }

  void _saveRevolusioner() {
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
        title: Text(widget.revolusioner == null
            ? 'Tambah Revolusioner'
            : 'Edit Revolusioner'),
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
                onPressed: _saveRevolusioner,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
