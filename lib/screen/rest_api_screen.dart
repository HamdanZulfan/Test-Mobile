import 'package:flutter/material.dart';
import 'package:test_flutter/service/api_service.dart';

class RestApiScreen extends StatefulWidget {
  const RestApiScreen({Key? key}) : super(key: key);

  @override
  State<RestApiScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RestApiScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  RequestData requestData = RequestData();
  String user = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nama',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: 'Masukan nama',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Job',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: jobController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: 'Masukan job',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Job tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final data = await requestData.fetchData();

                      if (data != null) {
                        setState(() {
                          user = data.toString();
                        });
                      }
                    },
                    child: const Text('GET'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final data = await requestData.createData(
                        name: namaController.text,
                        job: jobController.text,
                      );

                      user = data.toString();
                      setState(() {});
                    },
                    child: const Text('POST'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final data = await requestData.updateData(
                        name: namaController.text,
                        job: jobController.text,
                      );

                      user = data.toString();
                      setState(() {});
                    },
                    child: const Text('PUT'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final data = await requestData.deleteData();

                      user = data.toString();
                      namaController.clear();
                      jobController.clear();
                      setState(() {});
                    },
                    child: const Text('DELETE'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Result',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  user.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
