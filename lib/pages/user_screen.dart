import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/them/ThemeCubit.dart';
import '../bloc/user_bloc.dart';
import '../model/user.dart';
import '../utils/text_styles.dart';
import '../widget/loading_shimer.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<UserPage> {
  final UserBloc _userBloc = UserBloc(); // Create an instance of UserBloc
  @override
  void initState() {
    super.initState();
    _userBloc.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final textStyles = TextStyles(themeState);
    return Scaffold(

      body: StreamBuilder<List<User>>(
        stream: _userBloc.users, // Listen to the stream of users
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingShimmerList(itemCount: 12); // Show shimmer loading list
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching users'));
          } else {
            final users = snapshot.data!;
            return Container(
              color: themeState.backgroundColor,
              child:  GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 2.0, // Spacing between columns
                  mainAxisSpacing: 2.0, // Spacing between rows
                ),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(15.0,), // Set the border radius
                    ),

                    color: themeState.SecondaryColor,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: ListTile(
                        title: Text(user.name,style: textStyles.titleTextStyle,),
                        subtitle: Text(user.email,style: textStyles.bodyTextStyle,),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _userBloc.dispose(); // Dispose UserBloc when the widget is disposed
    super.dispose();
  }
}