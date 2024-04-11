import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:youtube_clone/config.dart';
import 'package:youtube_clone/models/video.dart';

class Api {
  Future<List<Video>> search(String query) async {
    String youtubeApiUri = Config.uris['YOUTUBE_API_URI']!;
    String youtubeChannelId = Config.keys['YOUTUBE_CHANNEL_ID']!;
    String youtubeApiKey = Config.keys['YOUTUBE_API_KEY']!;

    String uri = '$youtubeApiUri/search'
                  '?part=snippet'
                  '&channelId=$youtubeChannelId'
                  '&maxResults=20'
                  '&order=date'
                  '&type=video'
                  '&key=$youtubeApiKey'
                  '&q=$query';

    var response = await http.get(Uri.parse(uri));
    var jsonData = json.decode(response.body);

    List<Video> youtubeVideosList = jsonData['items']
      .map<Video>((youtubeVideo) => Video.fromJSON(youtubeVideo))
      .toList();

    return youtubeVideosList;
  }
}