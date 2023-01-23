document.addEventListener('DOMContentLoaded', function(){
  // hit_onのフォームを配列で拾う
  const hitOnForms = document.querySelectorAll('.hit_on-form');
  // hit_onのフォームがないならここで終了。「!」は論理否定演算子。
  if (hitOnForms.length == 0) return null;

  // ボタンを配列で拾う
  const showFormButtons = document.querySelectorAll('.create-hit_on-button');
  // それぞれのボタンにクリックされた際のイベントを仕込む
  showFormButtons.forEach(button =>{
    const commandMessageSpace = button.children[1];
    commandMessageSpace.innerHTML = `<u>リクエストを作成する</u>`;
    commandMessageSpace.style.cursor = 'pointer';

    button.addEventListener('click', (e) => {
      const form = button.parentElement.nextElementSibling.children[0];
      if (form.getAttribute("style") == "display: block;") {
        form.setAttribute("style", "display: none;");
        commandMessageSpace.innerHTML= `<u>リクエストを作成する</u>`;
      } else {
        form.setAttribute("style", "display: block;");
        commandMessageSpace.innerHTML = 'フォームを閉じる';
      };
    });
  });


  // それぞれのフォームにデータの定義とイベントを仕込む
  hitOnForms.forEach(form =>{
    const submit = form.children[2].children[0];
    submit.addEventListener('click', (e) => {
      e.preventDefault();
      const formData = new FormData(form);
      const XHR = new XMLHttpRequest();
      XHR.open("POST", `/himas/${form.dataset.id}/hit_ons`, true);
      XHR.responseType = "json";
      XHR.send(formData);
      XHR.onload = () => {
        // レスポンスに失敗した時
        if (XHR.status != 200) {
          alert(`Response Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        };
        // バリデーションで引っかかった時
        if (XHR.response.hit_on_and_errors.errors != null) {
          errorMessage = XHR.response.hit_on_and_errors.errors[0];
          alert(`Validation Error: ${errorMessage}`);
          return null;
        };
        // フォームの上の部分を上書きして"リクエスト済みです"と載せる
        const hitOnStatusContainer = form.parentElement.previousElementSibling.children[0];
        hitOnStatusContainer.removeAttribute('class')
        hitOnStatusContainer.setAttribute('class', 'hit_on-status')
        hitOnStatusContainer.innerHTML = '<span>リクエスト済みです</span>';
        // フォームを消し去ってhit_onの内容を載せる
        const formContainer = form.parentElement;
        formContainer.removeAttribute('class');
        formContainer.setAttribute('class', 'hit_on-container');
        const hit_on = XHR.response.hit_on_and_errors.hit_on;
        const htmlForLine =`
          <div style="display: block;">
            <div>
              <span>${hit_on.line}</span>
            </div>
            <br>
            <div>
              <a href="/rooms/${hit_on.id}/messages" target="_blank" rel="noreferrer noopener">メッセージへ移動</a>
            </div>
          </div>`;
        formContainer.innerHTML = htmlForLine;
      };
    });
  });
});