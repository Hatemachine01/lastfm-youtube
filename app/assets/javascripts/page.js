// $(document).ready(function(){
//     $('.middle').click(function() {
//         $('.inactive, .active').toggle();
//         //   });
// });



// $(document).ready(function(){
// 	$('.middle').click(function() {
// 		$('.inactive, .active').toggle();
//   });
// });



$( document ).on('turbolinks:load', function() {
    $('.middle').click(function () {
        $('.page').toggleClass('active');
        $(".light-buld").toggle();
    });
})




