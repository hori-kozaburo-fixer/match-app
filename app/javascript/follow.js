if (document.URL.match(/users/)){
  function follow() {
    let goods = document.getElementsByClassName('good')
    window.addEventListener('click', () => {
      for(let i = 0; i < goods.length; i++){
        goods[i].addEventListener('click', () => {
          goods[i].removeAttribute('class', 'fa fa-thumbs-up fa-2x');
        });
      } 
    });
  }
  window.addEventListener('load', follow);
}
