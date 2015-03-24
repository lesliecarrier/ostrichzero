$(document).ready(function () {
    $("body").keydown(function(e) {
      if(e.which == 37) { // left
				if($(".prevImg").attr("href")) {
					window.location.href = $(".prevImg").attr("href")+"/#comic";
				}
      }
      else if(e.which == 39) { // right
				if($(".nextImg").attr("href")) {
					window.location.href = $(".nextImg").attr("href") + "/#comic";
				}
      }
    });
});
