function timeAgo(date) {
  let commentDate = new Date(date);
  let currentDate = new Date();
  let yearDiff = currentDate.getFullYear() - commentDate.getFullYear();

  if (yearDiff > 0) return `${yearDiff} năm${yearDiff == 1 ? '' : ''} trước`;

  let monthDiff = currentDate.getMonth() - commentDate.getMonth();
  if (monthDiff > 0) return `${monthDiff} tháng${monthDiff == 1 ? '' : ''} trước`;

  let dateDiff = currentDate.getDate() - commentDate.getDate();
  if (dateDiff > 0) return `${dateDiff} ngày${dateDiff == 1 ? '' : ''} trước`;

  let hourDiff = currentDate.getHours() - commentDate.getHours();
  if (hourDiff > 0) return `${hourDiff} giờ${hourDiff == 1 ? '' : ''} trước`;

  let minuteDiff = currentDate.getMinutes() - commentDate.getMinutes();
  if (minuteDiff > 0) return `${minuteDiff} phút${minuteDiff == 1 ? '' : ''} trước`;
  return `vài giây trước`;
}

export default timeAgo;
