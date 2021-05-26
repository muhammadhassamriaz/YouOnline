class UserModel {
  UserModel(this.stories, this.userName, this.imageUrl);

  final List<StoryViewerModel> stories;
  final String userName;
  final String imageUrl;
}

class StoryViewerModel {
  StoryViewerModel(this.imageUrl);

  final String imageUrl;
}
