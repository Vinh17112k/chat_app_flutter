import 'package:app_chat/custom_drawer/home_drawer.dart';
import 'package:app_chat/models/chatUserModel.dart';
import 'package:app_chat/screens/chatDetailPage.dart';
import 'package:app_chat/widgets/conversationList.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //avatar user
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "assets/images/userImage1.jpg",
        time: "Now"),
    ChatUsers(name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL: "assets/images/userImage2.jpg",
        time: "Yesterday"),
    ChatUsers(name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "assets/images/userImage3.jpg",
        time: "31 Mar"),
    ChatUsers(name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "assets/images/userImage4.jpg",
        time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "assets/images/userImage5.jpg",
        time: "23 Mar"),
    ChatUsers(name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "assets/images/userImage6.jpeg",
        time: "17 Mar"),
    ChatUsers(name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "assets/images/userImage7.jpg",
        time: "24 Feb"),
    ChatUsers(name: "John Wick",
        messageText: "How are you?",
        imageURL: "assets/images/userImage8.png",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scroll
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  //trong row co 2 thanh phan text, addnew
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) {
                            return const HomeDrawer();
                          }));
                        },
                      child: CircleAvatar(

                        backgroundImage: NetworkImage(
                            "assets/images/userImage2.jpg"),
                        maxRadius: 20,
                      ),
                     ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.pink[50],
                        ),
                        child: Row(
                          children: const <Widget>[
                            Icon(Icons.add, color: Colors.pink, size: 20,),
                            SizedBox(width: 2,),
                            Text("Add New", style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //search
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(
                      Icons.search, color: Colors.grey.shade600, size: 20,),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.grey.shade100
                        )
                    ),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationList(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    imageUrl: chatUsers[index].imageURL,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3) ? true : false,
                  );
                },
              ),
            ],
          )
      ),
    );
  }
}
