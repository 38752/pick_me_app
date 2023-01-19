document.addEventListener('DOMContentLoaded', function(){
  // メニューボタンの要素を拾う
  const menuButton = document.querySelector('#menu-button');
  const pullDown = document.querySelector('#pull-down');
  // メニューボタンがないならここで終了。「!」は論理否定演算子。
    if (!menuButton) return null;

    menuButton.addEventListener('click', () => {
      if (pullDown.getAttribute("style")) {
        pullDown.removeAttribute("style");
      } else {
        pullDown.setAttribute("style", 'display: block;');
      };
    });
});