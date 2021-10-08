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



// Get the Id of the form
const searchButton = document.getElementById("formButton");
// Get the Id of a loading spinner modal
  const modal = document.getElementById('myModal_2');
  console.log("running")

  const displayModal = (e) => {
    //e.preventDefault();
    modal.style.display =  'block' ;
  }

// Listen the submit click on the form and call display spinner
searchButton.addEventListener('submit', displayModal);


