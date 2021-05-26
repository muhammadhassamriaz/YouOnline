class ApiNetwork {
  final String serverKey;
  static const String BASE_URL = "https://api.youonline.site/";
  final String loginURL;
  final String createAccountURL;
  final String authenticateRequest;
  final String getAllBlogs;
  final String getUserData;
  final String getTimeline;
  final String getComments;
  final String addComment;
  final String addReplyComment;
  final String sharePost;
  final String likePost;
  final String commentLike;
  final String getColors;
  final String createPost;
  final String voteForPoll;
  final String getTrendingGIFs;
  final String savePost;
  final String reportPost;
  final String hidePost;
  final String requestEmail;
  final String createStory;
  final String getUserGroups;
  final String getUserPages;
  final String getUserPosts;
  final String getSingleGroup;
  final String joinGroup;
  final String getSinglePage;
  final String unjoinGroup;
  final String getUserFollowings;
  final String getUserFollowers;
  final String followUser;
  final String unFollowUser;
  final String getUserImagesPosts;
  final String getUserVideoPosts;
  final String updateUserProfile;
  final String followPage;
  final String unfollowPage;
  final String searchURL;
  final String getAllStories;
  const ApiNetwork({
    this.serverKey =
        "5572447f999065e3aca553c5b0bfafc32abb23b4-a2aba67c4d09ce599d90a8c4327c810d-43668015",
    this.loginURL = "api/login",
    this.createAccountURL = "api/signup",
    this.authenticateRequest = "api/authenticate-request",
    this.getAllBlogs = "api/get-blog",
    this.getUserData = "api/user",
    this.getTimeline = "api/get-timeline?page=",
    this.getComments = "api/get-post-comments/",
    this.addComment = "api/add-comment",
    this.addReplyComment = "api/add-reply-comment",
    this.sharePost = "api/share-post",
    this.likePost = "api/add-post-like",
    this.commentLike = "api/add-comment-like",
    this.getColors = "api/get-color-post-types",
    this.createPost = "api/create-post",
    this.voteForPoll = "api/vote-for-poll",
    this.getTrendingGIFs = "api/get-trending-gifs",
    this.savePost = "api/save-post",
    this.reportPost = "api/report-post",
    this.hidePost = "api/hide-post",
    this.requestEmail = "api/request-password",
    this.createStory = "api/create-story",
    this.getUserGroups = "api/user-groups",
    this.getUserPages = "api/user-pages",
    this.getUserPosts = "api/profile?id=",
    this.getSingleGroup = "api/get-group?id=",
    this.joinGroup = "api/join-group",
    this.getSinglePage = "api/get-page?id=",
    this.unjoinGroup = "api/unjoin-group",
    this.getUserFollowings = "api/get-user-followings?id=",
    this.getUserFollowers = "api/get-user-followers?id=",
    this.followUser = "api/follow-user",
    this.unFollowUser = "api/unfollow-user",
    this.getUserImagesPosts = "api/get-user-images?user_id=",
    this.getUserVideoPosts = "api/get-user-videos?user_id=",
    this.updateUserProfile = "api/update-profile",
    this.followPage = "api/follow-page",
    this.unfollowPage = "api/unfollow-page",
    this.searchURL = "api/search",
    this.getAllStories = "api/get-all-stories",
  });

  static authenticateUserBody() => {
        "username": "Valentin_Batz",
        "password": "password",
      };
}
