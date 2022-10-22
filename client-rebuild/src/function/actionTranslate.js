var actionTranslate = function (actionName) {
  let actionNameChanged = 'string';
  switch (actionName) {
    case 'commented':
      actionNameChanged = 'đã trả lời bình luận của';
      break;
    case 'posted':
      actionNameChanged = 'đã đăng bài';
      break;
    case 'voted':
      actionNameChanged = 'đã vote bài viết';
      break;
    case 'followed':
      actionNameChanged = 'đang theo dõi';
      break;
    default:
      return actionNameChanged;
    //   case 'voted':
    //     actionNameChanged = 'đã vote';
    //     break;
    //   case 'voted':
    //     actionNameChanged = 'đã vote';
    //     break;
    //   case 'voted':
    //     actionNameChanged = 'đã vote';
    //     break;
  }
};
export { actionTranslate };
