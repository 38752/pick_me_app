document.addEventListener('DOMContentLoaded', function(){
  // hit_onのフォームを取得
  const hitOnForm = document.querySelectorAll('.hit_on-form')
  // hit_onのフォームがないならここで終了。「!」は論理否定演算子。
  if (hitOnForm.length == 0) return null;

  // ボタンを配列で拾う
  const showFormButtons = document.querySelectorAll('.create-hit_on-button');
  // それぞれにクリックされた際のイベントを仕込む
  showFormButtons.forEach(button =>{
    const commandMessageSpace = button.children[1];
    commandMessageSpace.textContent = 'リクエストを送る';
    button.addEventListener('click', function(e){
      const hima = button.nextElementSibling;
      if (hima.getAttribute("style") == "display: block;") {
        hima.removeAttribute("style");
        commandMessageSpace.textContent = 'リクエストを送る';
      } else {
        hima.setAttribute("style", "display: block;");
        commandMessageSpace.textContent = 'フォームを閉じる';
      };
    });
  });
});