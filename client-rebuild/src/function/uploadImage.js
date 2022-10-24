import axios from 'axios';

function handleImageAdded(file, Editor, cursorLocation, resetUploader) {
  var formData = new FormData();
  formData.append('file', file);

  axios({
    url: 'http://localhost:3000/upload_image',
    method: 'POST',
    data: formData,
  })
    .then((result) => {
      const url = result.data.image_url;
      Editor.insertEmbed(cursorLocation, 'image', url);
      resetUploader();
    })
    .catch((err) => {
      console.log(err);
    });
}

export default handleImageAdded;
