import 'package:flutter/material.dart';
import 'package:whatsup/data/model/ChatEntity.dart';

class ChatPage extends StatefulWidget {

    final ChatEntity chatEntity;

    const ChatPage({Key key,
        @required this.chatEntity
    }) : super(key: key);

    @override
    State<StatefulWidget> createState() => _ChatPageState();

}

class _ChatPageState extends State<ChatPage> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: _buildAppBarTitle(),
                actions: _buildAppBarActionButtons(),
                titleSpacing: 0,
                elevation: 0.7,
                automaticallyImplyLeading: false,
            ),
            body: _buildBuildBody(),
        );
    }

    // primeiro cria uma app bar contendo somente o title e os actions, depois altera para poder adicionar a foto
    Widget _buildAppBarTitle() {
        return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                        Navigator.pop(context);
                    },
                ),
                CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(widget.chatEntity.avatarUrl),
                ),
                SizedBox(width: 10),
                Flexible(
                    child: Text(
                        widget.chatEntity.name,
                        style: TextStyle(
                            fontSize: 19
                        ),
                    ),
                ),
            ],
        );
    }

    List<Widget> _buildAppBarActionButtons() {
        return [
            IconButton(
                icon: Icon(Icons.videocam),
                padding: EdgeInsets.all(0),
                onPressed: () => print("Pressed view call"),
            ),
            IconButton(
                icon: Icon(Icons.call),
                onPressed: () => print("Pressed phone call"),
            ),
            IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () => print("Pressed menu"),
            )
        ];
    }

    Widget _buildBuildBody() {
        return Stack(
            fit: StackFit.expand,
            children: <Widget>[
                Image.asset(
                    "assets/images/chat_background.png",
                    fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            _buildChat(),
                            _buildTextFieldAndSendButton()
                        ],
                    ),
                  ),
                )
            ],
        );
    }

    Widget _buildChat() {
        /*return Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                    return
                }
            ),
        );*/
        return Container();
    }

    Widget _buildTextFieldAndSendButton() {
        return Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 4, 8),
            child: Row(
                children: <Widget>[
                    Flexible(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: _buildTextField(),
                      ),
                    ),
                    SizedBox(width: 4),
                    ButtonTheme(
                        minWidth: 50.0,
                        height: 50.0,
                        buttonColor: Theme.of(context).primaryColor,
                        child: RaisedButton(
                            shape: CircleBorder(),
                            onPressed: () {},
                            child: Icon(
                                Icons.send,
                                color: Colors.white,
                            ),
                        ),
                    )
                ],
            ),
        );
    }

    Widget _buildTextField() {
        return Row(
            children: <Widget>[
                Flexible(
                    child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Digite aqui...",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                                Icons.tag_faces,
                                color: Colors.grey,
                            ),
                        ),
                    ),
                ),
                Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        IconButton(
                            icon: Icon(
                                Icons.attach_file,
                                color: Colors.grey,
                            ),
                            onPressed: () => print("Pressed Attach File"),
                        ),
                        IconButton(
                            icon: Icon(
                                Icons.photo_camera,
                                color: Colors.grey,
                            ),
                            onPressed: () => print("Pressed Camera"),
                        ),
                    ],
                )
            ],
        );
    }
}