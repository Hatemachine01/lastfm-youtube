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
        $('.inactive').toggleClass('fa-rotate-180 on')
        // $(".light-buld").toggle();
    });
})




