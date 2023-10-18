import 'package:chatapp/Model/MessageModel.dart';
import 'package:chatapp/widgets/ChatMessage.dart';
import 'package:chatapp/widgets/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  static const id = 'ChatScreen';
  TextEditingController controller = TextEditingController();
  CollectionReference FireMessages =
      FirebaseFirestore.instance.collection(Kmessages);
  List<Map<String, String>> messages = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FireMessages.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(MessageModel.fromjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logo,
                    height: 40,
                    width: 40,
                  ),
                  const Text('Chat App'),
                ],
              ),
            ),
            body: Padding(
              padding:  EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return ChatMessage(
                            message: messageList[index],
                          );
                        }),
                  ),
                  TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      FireMessages.add({
                        'Message': data,
                      });
                      controller.clear();
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          // _submitMessage(controller.text);
                        },
                        color: Colors.green,
                      ),
                      hintText: 'Enter message',
                      hintStyle: GoogleFonts.inriaSans(
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else{
          return Text('Yoyusef');
        }
      }
    );
  }
}
