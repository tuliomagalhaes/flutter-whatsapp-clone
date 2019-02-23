import 'package:flutter/material.dart';
import 'package:whatsup/data/model/ChatEntity.dart';
import 'package:whatsup/features/chat/chat_page.dart';
import 'package:whatsup/features/home/tabs/calls_tabs.dart';
import 'package:whatsup/features/home/tabs/camera_tab.dart';
import 'package:whatsup/features/home/tabs/chat_tab.dart';
import 'package:whatsup/features/home/tabs/status_tab.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

    TabController _tabController;

    @override
    void initState() {
        super.initState();

        _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("WhatsUp"),
                actions: _buildActions(),
                elevation: 0.7,
                bottom: _buildTabBar(),
            ),
            body: _buildTabBarView(),
            floatingActionButton: _buildFloatingActionButton(),
        );
    }

    List<Widget> _buildActions() {
        return <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                    print("Do Search");
                },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
            IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                    print("Menu actions");
                },
            ),
        ];
    }

    Widget _buildTabBar() {
        return TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
                Tab(
                    icon: Icon(Icons.camera_alt),
                ),
                Tab(
                    text: "CHATS",
                ),
                Tab(
                    text: "STATUS",
                ),
                Tab(
                    text: "CALLS",
                )
            ],
        );
    }

    Widget _buildTabBarView() {
        return TabBarView(
            controller: _tabController,
            children: <Widget>[
                CameraTab(),
                ChatTab(
                    onChatPressed: _onChatPressed,
                ),
                StatusTab(),
                CallsTab()
            ]
        );
    }

    Widget _buildFloatingActionButton() {
        return FloatingActionButton(
            backgroundColor: Theme.of(context).accentColor,
            onPressed: () => print("Pressed new chat"),
            child: Icon(
                Icons.message,
                color: Colors.white,
            ),
        );
    }

    void _onChatPressed(ChatEntity chatEntity) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage(chatEntity: chatEntity)),
        );
    }
}