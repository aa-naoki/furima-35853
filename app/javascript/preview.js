document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item_image')){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('height', 200);
      blobImage.setAttribute('width', 300);
      blobImage.style.marginTop = ('20px')

      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('item_image').addEventListener('change', function(e){
      const existImage = document.getElementById('image_size');
      if (existImage) {
        existImage.remove();
      }
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      
      createImageHTML(blob);
    });
  }
});