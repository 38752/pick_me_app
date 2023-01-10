document.addEventListener('DOMContentLoaded', function(){
  // テストオブジェクトを取得
  const testObjects = document.getElementsByClassName('test');
  // テストオブジェクトが存在しなければ終了
  if (!testObjects) return null;

  for(let i=0;i<testObjects.length;i++){
    testObjects[i].setAttribute('id', `test_${i}`);
    testObjects[i].addEventListener('click', function(){
      console.log(i);
    });
  };
});