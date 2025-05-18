import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/model/user.dart';

import '../view_model/user_view_model.dart';

//> https://riverpod.dev/docs/concepts/reading#using-reflisten-to-react-to-a-provider-change
class AddUserScreen extends ConsumerStatefulWidget {
  const AddUserScreen({super.key});

  @override
  ConsumerState<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends ConsumerState<AddUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _idController;
  late TextEditingController _usernameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;

  @override
  void initState() {
    _idController = TextEditingController();
    _usernameController = TextEditingController();
    _ageController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  void _addUser() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      final user = User(
        id: int.parse(_idController.text),
        username: _usernameController.text,
        age: int.parse(_ageController.text),
        email: _emailController.text,
      );
      ref.read(usersProvider.notifier).addUser(user);
    }
  }

  // > The listen method should not be called asynchronously, like inside an onPressed of an ElevatedButton. Nor should it be used inside initState and other State life-cycles.
  void _listener() {
    // > https://riverpod.dev/docs/advanced/select#filtering-widgetprovider-rebuild-using-select
    ref.listen(usersProvider.select((state) => state.isAdded), (prev, next) {
      if (next) {
        Navigator.pop(context);
        //Navigator.of(context).pop(); 只是語法一樣，功能跟上一行相同
      }
    });

    ref.listen(usersProvider.select((state) => state.error), (prev, next) {
      log(next.toString());
      if (next != null) {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(next.toString()),
              ),
        ).then((value) {
          ref.read(usersProvider.notifier).clearError();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _listener();

    return Scaffold(
      appBar: AppBar(title: const Text('Add User Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _idController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ID is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _ageController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Age is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _addUser,
                      child: const Text('Add User'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
