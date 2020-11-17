if (document.URL.match(/users/)){
  window.onload = function() {
    const spinner = document.getElementById('loading');
    spinner.classList.add('loaded');
  }
}