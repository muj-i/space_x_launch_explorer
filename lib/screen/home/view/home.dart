// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:space_x_launch_explorer/screen/home/model/launch_data_res.dart';
import 'package:space_x_launch_explorer/screen/home/repo/home_repo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    fetchLaunches();
    super.initState();
  }

  List<LaunchesResModel> launchesResModel = [];
  bool isLoading = false;
  Future<void> fetchLaunches() async {
    isLoading = true;
    setState(() {});
    final res = await HomeRepo.getLaunches();
    log('Launches fetched: ${res.length}');
    if (res.isEmpty) {
      launchesResModel = [];
      return;
    }
    launchesResModel = res;
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('SpaceX Launch Explorer'),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await fetchLaunches();
          },
          child: Visibility(
            visible: isLoading,
            replacement: ListView.builder(
                itemCount: launchesResModel.length,
                itemBuilder: (context, index) {
                  final String title =
                      launchesResModel[index].name ?? 'No Name';
                  final String date = launchesResModel[index].dateUtc != null
                      ? DateFormat('MMM dd, yyyy - HH:mm')
                          .format(launchesResModel[index].dateUtc!.toLocal())
                      : 'No Date';
                  final bool success = launchesResModel[index].success ?? false;
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            launchesResModel[index].links?.patch?.small ??
                                'https://via.placeholder.com/150',
                          ),
                        ),
                        title: Text(title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date: $date',
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                margin: const EdgeInsets.only(top: 4.0),
                                decoration: BoxDecoration(
                                  color: success
                                      ? Colors.green.withOpacity(.3)
                                      : Colors.red.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Text('Success: $success')),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Success: ${launchesResModel[index].success == true ? 'Yes' : 'No'}"),
                                const SizedBox(height: 4),
                                Text(
                                    "Details: ${launchesResModel[index].details ?? 'No details available.'}"),
                                const SizedBox(height: 4),
                                if (launchesResModel[index].links?.wikipedia !=
                                    null)
                                  Text(
                                      "Wikipedia: ${launchesResModel[index].links!.wikipedia}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
