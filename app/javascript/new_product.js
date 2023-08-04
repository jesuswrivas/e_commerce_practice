let input_image = document.querySelector("#product_image")


let loadFile = function(event) {
    let preview_image = document.querySelector("#product_image_preview")
    preview_image.src = URL.createObjectURL(event.target.files[0])

};

input_image.addEventListener("change", loadFile)
