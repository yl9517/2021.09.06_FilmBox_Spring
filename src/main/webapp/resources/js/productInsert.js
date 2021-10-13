/**
 * 
 */
/*이미지 미리보기*/
function imgPreview(event)
{
	let fReader = new FileReader();
	
	fReader.onload = function(event)
    {
        let img_old = document.getElementById("img_section");
        img_old.setAttribute("src", event.target.result);
    }

    fReader.readAsDataURL(event.target.files[0]);
}