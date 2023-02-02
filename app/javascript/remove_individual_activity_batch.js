document.addEventListener('DOMContentLoaded', function(){
  // current-messagesを取得
  const currentMessages = document.querySelectorAll('.current-message');
  // batchesがないならここで終了。「!」は論理否定演算子。
  if (currentMessages.length == 0) return null;

  currentMessages.forEach(currentMessage =>{
    // イベントを仕込む
    currentMessage.addEventListener('click', () => {
      // room-idを取得
      const roomId = currentMessage.dataset.roomId;

      // // バッチを探す
      const batch = document.querySelector(`#individual-activity-batch_${roomId}`);

      // // バッチがないならここで終了
      if (!batch) return null;

      // // バッチを非表示にする
      batch.setAttribute("style", "display: none;");
    });
  });
});
