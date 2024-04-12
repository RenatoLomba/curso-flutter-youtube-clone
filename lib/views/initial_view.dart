import 'package:flutter/material.dart';
import 'package:youtube_clone/api.dart';
import 'package:youtube_clone/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key, required this.query});

  final String query;

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  final Api api = Api();

  Future<List<Video>> _getVideos(String query) async => api.search(query);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _getVideos(widget.query),
      builder: (_, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(color: Colors.red)
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Text('Erro ao buscar vídeos.');
            } else if (snapshot.data == null) {
              return const Text('Nenhum dado a ser exibido');
            }

            var videos = snapshot.data!;

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: videos.length,
              separatorBuilder: (_, idx) => const Divider(
                height: 2,
                color: Colors.grey,
              ),
              itemBuilder: (_, idx) {
                var video = videos[idx];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (ctx) => YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: video.id,
                          flags: const YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        topActions: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: () => Navigator.pop(ctx),
                          )
                        ],
                      ),
                    ));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(video.thumbnailUrl),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(video.title),
                        subtitle: Text(video.channel),
                      )
                    ],
                  ),
                );
              },
            );
        }
      }
    );
  }
}
