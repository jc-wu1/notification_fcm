import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_module/notification_module.dart';

import 'bloc/notification_bloc.dart';
import 'injector.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => NotificationBloc(
        notificationModule: sl<NotificationModule>(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: BlocListener<NotificationBloc, NotificationState>(
            listenWhen: (previous, current) {
              return previous != current;
            },
            listener: (context, state) {
              final notification = state.notification!;

              if (state.appState!.isForeground) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 20),
                    backgroundColor: Colors.white,
                    content: ListTile(
                      title: Text(notification.title),
                      subtitle: Text(notification.body),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        child: const Text('GO'),
                      ),
                    ),
                  ),
                );
              }
            },
            child: const Center(
              child: Text('Push Notifications!'),
            ),
          ),
        ),
      ),
    );
  }
}
