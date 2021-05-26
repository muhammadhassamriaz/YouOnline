class PostReaction {
  int postID;
  int userID;
  String reaction;
  PostReaction({
    this.postID,
    this.userID,
    this.reaction,
  });

  PostReaction copyWith({
    String postID,
    String userID,
    String reaction,
  }) {
    return PostReaction(
      postID: postID ?? this.postID,
      userID: userID ?? this.userID,
      reaction: reaction ?? this.reaction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postID': postID,
      'userID': userID,
      'reaction': reaction,
    };
  }

  factory PostReaction.fromMap(Map<String, dynamic> map) {
    return PostReaction(
      postID: map['postID'],
      userID: map['userID'],
      reaction: map['reaction'],
    );
  }
}
