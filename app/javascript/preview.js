if (document.URL.match(/sign_up/) || document.URL.match(/new/) || document.URL.match(/edit/)){
  document.addEventListener('DOMContentLoaded',() => {
    const thumbNail = document.getElementById('thumbnail');
    document.getElementById('file_photo').addEventListener('change', (e) => {
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      thumbNail.setAttribute('src', blob);
      document.getElementById('userImgPreview').setAttribute('style', 'display: block');
    });
  });
}