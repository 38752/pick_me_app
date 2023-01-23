document.addEventListener('DOMContentLoaded', function(){
  // categoriesを取得
  const categories = document.querySelectorAll('.room-category');
  // categoriesがないならここで終了。「!」は論理否定演算子。
  if (!categories) return null;

  categories.forEach(category =>{
    // カーソルの形を変更
    category.style.cursor = 'pointer';
  });
});
