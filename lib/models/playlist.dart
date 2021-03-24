class Storyteller {
  final String stName;
  final String image;
  final int id;

  Storyteller({this.id, this.stName, this.image});
}

List<Storyteller> playlists = [
  Storyteller(
    id: 1,
    stName: 'Party',
    image: "assets/images/party.jpg",
  ),
  Storyteller(
    id: 2,
    stName: 'Peace',
    image: "assets/images/meditation.jpg",
  ),
  Storyteller(
    id: 3,
    stName: 'Flutter Time',
    image: "assets/images/colors.jpg",
  ),
  Storyteller(
    id: 4,
    stName: 'Romance',
    image: "assets/images/love.jpg",
  ),
];