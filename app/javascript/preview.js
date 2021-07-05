document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item_images')){
    const ImageList = document.getElementById('image-list')

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', 'image-element')
      let imageElementNum = document.querySelectorAll('.image-element').length

      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)
      blobImage.setAttribute('height', 200)
      blobImage.setAttribute('width', 300)
      blobImage.style.marginTop = ('20px')

      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'item[images][]')
      inputHTML.setAttribute('type', 'file')


      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)

      inputHTML.addEventListener('change', (e) => {
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      });
    };
    
    document.getElementById('item_images').addEventListener('change', function(e){

      const existImage = document.getElementById('image-list')
        if (existImage) {
          existImage.innerHTML = '';
        }  
          
          const file = e.target.files[0];
          const blob = window.URL.createObjectURL(file);
          
          createImageHTML(blob)
    });
  };
})




