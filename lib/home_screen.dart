import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_generator_restapi/IMAGEMODEL.DART';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ImageModel? imageModel;
  bool isLoading = false;

  Future<void> generateDogImage() async {

    setState(() {
      isLoading = true;
    });

    Uri uri = Uri.parse('https://dog.ceo/api/breeds/image/random');
    Response response = await get(uri);

    if(response.statusCode == 200){
      dynamic data = jsonDecode(response.body);

      setState(() {
        imageModel = ImageModel.fromJson(data);
      });
    }
    else{
      debugPrint('Response is ${response.statusCode}');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    generateDogImage(); // load first image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Random Dog Image Generator",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Image
                  if (imageModel != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageModel!.message, // from API
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover,

                        // error handling
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error, size: 50);
                        },
                      ),
                    ),

                  const SizedBox(height: 20),

                  // Button
                  ElevatedButton(
                    onPressed: generateDogImage,
                    child: const Text("Generate Dog Image"),
                  ),
                ],
              ),
      ),
    );
  }
}