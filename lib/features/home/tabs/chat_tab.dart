import 'package:flutter/material.dart';
import 'package:whatsup/models/chat_entity.dart';

typedef OnChatPressed = Function(ChatEntity);

class ChatTab extends StatelessWidget {

    final OnChatPressed onChatPressed;

    const ChatTab({Key key, this.onChatPressed}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final List<ChatEntity> entities = _buildFakeData();
        return ListView.builder(
            itemCount: entities.length,
            itemBuilder: (context, index) {
                ChatEntity chatEntity = entities[index];
                return GestureDetector(
                    onTap: () {
                        if (onChatPressed != null) {
                            onChatPressed(chatEntity);
                        }
                    },
                    child: Column(
                        children: _buildListContent(context, chatEntity, index),
                    ),
                );
            }
        );
    }

    List<Widget> _buildListContent(BuildContext context, ChatEntity chatEntity, int index) {
        final content = <Widget>[];

        if (index > 0) {
            content.add(
                Divider(
                    indent: 74,
                    height: 10.0,
                )
            );
        }

        content.add(
            ListTile(
                leading: _buildCircleAvatar(context, chatEntity),
                title: _buildChatInfo(chatEntity),
                subtitle: _buildChatLastMessage(chatEntity),
            )
        );

        return content;
    }

    Widget _buildCircleAvatar(BuildContext context, ChatEntity chatEntity) {
        return CircleAvatar(
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(chatEntity.avatarUrl),
        );
    }

    Widget _buildChatInfo(ChatEntity chatEntity) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                Text(
                    chatEntity.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    chatEntity.time,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
            ],
        );
    }

    Widget _buildChatLastMessage(ChatEntity chatEntity) {
        return Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
                chatEntity.message,
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
            ),
        );
    }

    List<ChatEntity> _buildFakeData() {
        return [
            ChatEntity(
                name: "Pawan Kumar",
                message: "Hey Flutter, You are so amazing !",
                time: "15:30",
                avatarUrl: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
            ChatEntity(
                name: "Harvey Spectre",
                message: "Hey I have hacked whatsapp!",
                time: "17:30",
                avatarUrl: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
            ChatEntity(
                name: "Mike Ross",
                message: "Wassup !",
                time: "5:00",
                avatarUrl: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
            ChatEntity(
                name: "Rachel",
                message: "I'm good!",
                time: "10:30",
                avatarUrl: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
            ChatEntity(
                name: "Barry Allen",
                message: "I'm the fastest man alive!",
                time: "12:30",
                avatarUrl: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
            ChatEntity(
                name: "Joe West",
                message: "Hey Flutter, You are so cool !",
                time: "15:30",
                avatarUrl: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
        ];
    }
}