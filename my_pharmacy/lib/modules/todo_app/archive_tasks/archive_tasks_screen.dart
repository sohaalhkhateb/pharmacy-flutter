import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/shared/components/components.dart';

import '../../../shared/cubit2/cubit.dart';
import '../../../shared/cubit2/states.dart';



class ArchiveTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var tasks = AppCubit.get(context).archivetasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
