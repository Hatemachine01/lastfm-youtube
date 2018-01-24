// 2. This code loads the IFrame Player API code asynchronously.
      
      $(document).ready( function(id) {
  loadPlayer();
});


    function loadPlayer(id) { 
      console.log(id)
  if (typeof(YT) == 'undefined' || typeof(YT.Player) == 'undefined') {

    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    window.onYouTubePlayerAPIReady = function(id) {
      onYouTubePlayer(id);
    };

  } else {

    onYouTubePlayer(id);

  }
}

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubePlayer(id) {
        player = new YT.Player('player', {
          height: '360',
          width: '540',
          videoId: id,
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

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
                alert('Continous Playing + Next and Previous functions  coming soon!');
            }
        }

      function stopVideo() {
        player.stopVideo();
      }