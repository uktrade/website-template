var video = (function ($) {
  var player;

  function onYouTubeIframeAPIReady() {
    // create the global player from the specific iframe (#video)
    player = new YT.Player('video-ad-index', {
      events: {
        // call this function when player is ready to use
        'onReady': onPlayerReady
      }
    });
  }

	function init (){

	}

	return {
	    init: init
	};

})(jQuery);