// カーソルが乗った時に太字にしたいやつ
document.addEventListener('DOMContentLoaded', function(){
  // 太字にしたい要素を拾う
  const links = document.querySelectorAll('.mouseover-weightier');
  // 太字にしたい要素がないならここで終了。
    if (links.length == 0) return null;

    // それぞれにイベント仕込む
    links.forEach(link => {
      link.addEventListener('mouseover', () => {
        link.setAttribute("style", "font-weight: 550;");
      });
      link.addEventListener('mouseout', () => {
        link.removeAttribute("style");
      });
    });
});