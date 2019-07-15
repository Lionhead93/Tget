function numberWithCommas(price) {	
	    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");	    
	}
function replaceAll(str, searchStr, replaceStr) {
	  return str.split(searchStr).join(replaceStr);
	}
function numberWithOutCommas(price) {	
    return replaceAll(price, ',' , '' );    
	}	
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}