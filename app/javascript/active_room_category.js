document.addEventListener('DOMContentLoaded', function(){
  // トークルーム一覧の要素を配列で拾う
  const roomCategoryContainers = document.querySelectorAll('.room-category-container');
  // ないならここで終了。「!」は論理否定演算子。
  if (roomCategoryContainers.length == 0) return null;

  // 一個目のカテゴリを強調表示
  const primeCategory = roomCategoryContainers[0];
  primeCategory.setAttribute("id", "current-category");

  // 一個目のカテゴリのルーム一覧を表示
  const primeRooms = document.getElementById(`rooms-category_${primeCategory.dataset.number}`);
  primeRooms.setAttribute("style", "display: block;");

  // クリックしたカテゴリの色が変わるようにイベントをセット
  roomCategoryContainers.forEach(container => {
    const link = container.children[0];
    const activeRooms = document.getElementById(`rooms-category_${container.dataset.number}`);

    // クリックするとカテゴリにidを付与し直し、.roomsのdisplayプロパティを変更する
    link.addEventListener('click', () => {
      // カテゴリーの強調表示とルーム一覧の表示を解除
      roomCategoryContainers.forEach(containerForRemove => {
        containerForRemove.removeAttribute("id");
        const room = document.getElementById(`rooms-category_${containerForRemove.dataset.number}`);
        room.removeAttribute("style");
      });
      container.setAttribute("id", "current-category");
      activeRooms.setAttribute("style", "display: block;");
    });
  });
});