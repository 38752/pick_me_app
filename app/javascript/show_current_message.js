document.addEventListener('DOMContentLoaded', function(){
  // トークルーム一覧の要素を拾う
  const toCurrentButton = document.querySelector('#to-current-button');
  // ジャンプ台がないならここで終了。「!」は論理否定演算子。
    if (!toCurrentButton) return null;

    toCurrentButton.click();
});