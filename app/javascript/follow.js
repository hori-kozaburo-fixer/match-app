if (document.URL.match(/follow_team/) || document.URL.match(/follow_prefecture/)) {
  function follow() {
    let like = document.getElementsByClassName('good')
    window.addEventListener('click', () => {
      for(let i = 0; i < like.length; i++){
        like[i].addEventListener('click', () => {
          like[i].removeAttribute('class', 'fa fa-thumbs-up fa-2x');
        });
      } 
    });
  }
  window.addEventListener('load', follow);
}
