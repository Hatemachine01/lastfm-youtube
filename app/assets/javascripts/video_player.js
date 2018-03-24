// 2. This code loads the IFrame Player API code asynchronously.
      
 
 

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
       function onPlayerStateChange(event) {        
              if(event.data === 0) {          
                  jQuery.ajax({
                   url: "/shuttle", 
                   type: "GET",
                   data: {username :UserId}
                 }); 
              }

            }  

         function onError(event) {
          jQuery.ajax({
                   url: "/shuttle", 
                   type: "GET",
                   data: {username :UserId}
                 }); 
         }        
            
      function stopVideo() {
        player.stopVideo();
      }



  