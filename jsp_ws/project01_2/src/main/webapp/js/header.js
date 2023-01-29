/**
 * 
 */

// 상단 네비게이션바 효과
/* 

$(document).ready(function(){
	let w = $("#navbar ul li").width();
	$("#navbar").append("<span></span>");
    $("#navbar ul li").on("mouseenter focusin", function(){
    	let index = $(this).index();
        console.log(index);
        $(this).find("a").addClass("on");
        $(this).siblings().find("a").removeClass("on");
        $("#navbar span").stop().animate({
            left: index * w
        }, "fast", "swing");
    });
    $("#navbar ul li:eq(0)").trigger("mouseenter");
});
 */