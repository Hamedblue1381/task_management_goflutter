import 'package:get/get.dart';
import 'package:task_management_goflutter/screens/add_task.dart';
import 'package:task_management_goflutter/screens/all_tasks.dart';
import 'package:task_management_goflutter/screens/edit_task.dart';
import 'package:task_management_goflutter/screens/home_screen.dart';
import 'package:task_management_goflutter/screens/view_task.dart';

class RoutesClass {
  static String home = "/";
  static String allTask = "/allTask";
  static String addTask = "/addTask";
  static String editTask = "/editTask";
  static String viewTask = "/viewTask";

  static String getHomeRoute() => home;
  static String getAllTaskRoute() => allTask;
  static String getViewTaskRoute(String id) => '$viewTask?id=$id';
  static String getAddTaskRoute() => addTask;
  static String getEditTaskRoute(String id) => '$editTask?id=$id';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(
        name: allTask,
        page: () => const AllTask(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: viewTask,
        page: (() {
          var id = Get.parameters['id'];
          return ViewTask(id: int.parse(id!));
        }),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: addTask,
        page: (() => const AddTask()),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: editTask,
        page: (() {
          var id = Get.parameters['id'];
          return EditTask(id: int.parse(id!));
        }),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500))
  ];
}
