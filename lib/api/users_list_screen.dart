import 'package:flutter/material.dart';
import 'package:master_go_replication/api/api_service.dart';
import 'package:master_go_replication/api/model.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  late Future<List<UserModel>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = ApiService().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: FutureBuilder(
            future: futureUsers,
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: snapshots.data!.length,
                  itemBuilder: (context, index) {
                    UserModel user = snapshots.data![index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Text(user.id.toString()),
                    );
                  });
            }));
  }
}
