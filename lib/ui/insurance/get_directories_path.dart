import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class GetDirectoriesPath extends StatefulWidget {
  const GetDirectoriesPath({super.key, required this.title});
  final String title;

  @override
  State<GetDirectoriesPath> createState() => _GetDirectoriesPathState();
}

class _GetDirectoriesPathState extends State<GetDirectoriesPath> {
  Future<Directory?>? _externalDocumentsDirectory;
  Future<List<Directory>?>? _externalStorageDirectories;
  Future<List<Directory>?>? _externalCacheDirectories;
  Future<Directory?>? _downloadsDirectory;

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        text = Text('path: ${snapshot.data!.path}');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  Widget _buildDirectories(
      BuildContext context, AsyncSnapshot<List<Directory>?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final String combined =
            snapshot.data!.map((Directory d) => d.path).join(', ');
        text = Text('paths: $combined');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  void _requestExternalStorageDirectory() {
    setState(() {
      _externalDocumentsDirectory = getExternalStorageDirectory();
    });
  }

  void _requestExternalStorageDirectories(StorageDirectory type) {
    setState(() {
      _externalStorageDirectories = getExternalStorageDirectories(type: type);
    });
  }

  void _requestExternalCacheDirectories() {
    setState(() {
      _externalCacheDirectories = getExternalCacheDirectories();
    });
  }

  void _requestDownloadsDirectory() {
    setState(() {
      _downloadsDirectory = getDownloadsDirectory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: !Platform.isAndroid
                        ? null
                        : _requestExternalStorageDirectory,
                    child: Text(
                      !Platform.isAndroid
                          ? 'External storage is unavailable'
                          : 'Get External Storage Directory',
                    ),
                  ),
                ),
                FutureBuilder<Directory?>(
                  future: _externalDocumentsDirectory,
                  builder: _buildDirectory,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: !Platform.isAndroid
                        ? null
                        : () {
                            _requestExternalStorageDirectories(
                              StorageDirectory.music,
                            );
                          },
                    child: Text(
                      !Platform.isAndroid
                          ? 'External directories are unavailable'
                          : 'Get External Storage Directories',
                    ),
                  ),
                ),
                FutureBuilder<List<Directory>?>(
                  future: _externalStorageDirectories,
                  builder: _buildDirectories,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: !Platform.isAndroid
                        ? null
                        : _requestExternalCacheDirectories,
                    child: Text(
                      !Platform.isAndroid
                          ? 'External directories are unavailable'
                          : 'Get External Cache Directories',
                    ),
                  ),
                ),
                FutureBuilder<List<Directory>?>(
                  future: _externalCacheDirectories,
                  builder: _buildDirectories,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: Platform.isAndroid || Platform.isIOS
                        ? null
                        : _requestDownloadsDirectory,
                    child: Text(
                      Platform.isAndroid || Platform.isIOS
                          ? 'Downloads directory is unavailable'
                          : 'Get Downloads Directory',
                    ),
                  ),
                ),
                FutureBuilder<Directory?>(
                  future: _downloadsDirectory,
                  builder: _buildDirectory,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
