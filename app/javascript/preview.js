document.addEventListener('DOMContentLoaded', function(){
  // 新規投稿・編集ページのフォームを取得
  const editForm = document.getElementById('edit-profile');
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!editForm) return null;
  console.log("preview.jsが読み込まれました");

  // プレビュー画像を生成・表示する関数
  const buildPreviewImage = (i, blob) =>{
    // プレビューを表示するためのスペースを取得
    const previewWrapper = document.getElementById(`preview_${i}`);

    // 削除ボタンを生成
    const deleteButton = document.createElement("div");
    deleteButton.setAttribute("class", "image-delete-button");
    deleteButton.id = `image-delete-button_${i}`;
    deleteButton.innerText = "削除";
    // 削除ボタンをクリックしたらプレビューとfile_fieldを削除させる
    deleteButton.addEventListener("click", () => deleteImage(i));
    previewWrapper.appendChild(deleteButton);

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('id', `preview-image_${i}`);
    previewImage.setAttribute('src', blob);
    previewImage.setAttribute('alt', '選択されたファイルが画像ではない可能性があります');
    previewWrapper.appendChild(previewImage);
  };

  // 指定したプレビュー等を削除する関数
  const deleteImage = (i) => {
    const deleteImageFile = document.getElementById(`user-image_${i}`);
    const deletePreviewImage = document.getElementById(`preview-image_${i}`);
    const deleteButton = document.getElementById(`image-delete-button_${i}`);

    if (deletePreviewImage) {
      deleteImageFile.value = ''
      deletePreviewImage.remove();
      deleteButton.remove();
    };
  };

  // 各要素に仕込むイベント等
  const maxImages = 3
  for(let i = 1;i <= maxImages;i++) {
    // input要素を取得
    const fileField = document.querySelector(`input[type="file"][name="user[images][]"][id="user-image_${i}"]`);

    // input要素がクリックされた際に呼び出される関数
    fileField.addEventListener('click', function(e){
      // input要素で値の変化が起きた際に呼び出される関数
      fileField.addEventListener('change', function(){
        // debugger
        const alreadyPreview = document.getElementById(`preview-image_${i}`);
        const deleteButton = document.getElementById(`image-delete-button_${i}`);
        // 古いプレビューが存在する場合は削除
        if (alreadyPreview) {
          alreadyPreview.remove();
        };
        if (deleteButton) {
          deleteButton.remove();
        };

        const file = e.target.files[0];
        // fileが空 = 何も選択しなかったのでプレビュー等を削除して終了する
        if (!file) {
          deleteImage(i);
          return null;
        };

        const blob = window.URL.createObjectURL(file);
        buildPreviewImage(i, blob);
      });
    });
  };
});