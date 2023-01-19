document.addEventListener('DOMContentLoaded', function(){
  // クローズするの要素を拾う
  const closeButton = document.querySelector('#close-room-button');
  // ジャンプ台がないならここで終了。「!」は論理否定演算子。
    if (!closeButton) return null;

    closeButton.addEventListener('click', (e) => {
      e.preventDefault();
      var result = window.confirm(`⚠️トークルームのクローズは取り消せません。\nクローズしてよろしいですか？`);
      if (result == true) {
        window.location.href = `/rooms/${closeButton.dataset.room_id}/close`;
      };
    });
});