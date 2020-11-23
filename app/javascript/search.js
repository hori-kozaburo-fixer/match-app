if (document.URL.match(/users/)){
  document.addEventListener('DOMContentLoaded',() => {
    const btn = document.querySelector('.btn-menu');
    const team = document.querySelector('.search-team');
    const prefecture = document.querySelector('.search-prefecture');
    btn.addEventListener('click', () => {
      if(team.getAttribute("style") == "display:block;"){
        team.removeAttribute("style", "display:block;")
      } else {
        team.setAttribute("style", "display:block;")
      }
      if(prefecture.getAttribute("style") == "display:block;"){
        prefecture.removeAttribute("style", "display:block;")
      } else {
        prefecture.setAttribute("style", "display:block;")
      }
    });
  });
}