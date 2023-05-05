class Music {
  String? id;
  String? title;
  String? album;
  String? artist;
  String? genre;
  String? source;
  String? image;
  int? trackNumber;
  int? totalTrackCount;
  int? duration;
  String? site;
   

  Music(
      {this.id,
      this.title,
      this.album,
      this.artist,
      this.genre,
      this.source,
      this.image,
      this.trackNumber,
      this.totalTrackCount,
      this.duration,
      this.site});

  Music.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    album = json['album'];
    artist = json['artist'];
    genre = json['genre'];
    source = json['source'];
    image = json['image'];
    trackNumber = json['trackNumber'];
    totalTrackCount = json['totalTrackCount'];
    duration = json['duration'];
    site = json['site'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['album'] = album;
    data['artist'] = artist;
    data['genre'] = genre;
    data['source'] = source;
    data['image'] = image;
    data['trackNumber'] = trackNumber;
    data['totalTrackCount'] = totalTrackCount;
    data['duration'] = duration;
    data['site'] = site;
    return data;
  }
}
