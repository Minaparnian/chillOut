window.onload = function() {
console.log("loaded");
  // set up audio context
  var audioContext = (window.AudioContext || window.webkitAudioContext);
  // create audio class
  if (audioContext) {
    // Web Audio API is available.
    var audioAPI = new audioContext();
  } else {
    // Web Audio API is not available. Ask the user to use a supported browser.
    alert("Oh nos! It appears your browser does not support the Web Audio API, please upgrade or use a different browser");
  }

  // variables
  var analyserNode,
      frequencyData = new Uint8Array(256);
  const screen = document.querySelector('#screen'),
      allRepeatedEls = document.querySelectorAll('#screen section'),
      totalEls = allRepeatedEls.length;

  // create an audio API analyser node and connect to source
  function createAnalyserNode(audioSource) {
    analyserNode = audioAPI.createAnalyser();
    analyserNode.fftSize = 512;
    audioSource.connect(analyserNode);
  }

  // get's html elements, loops over them & attaches a frequency from analysed data - what you do is up to you!
  function animateStuff() {
    analyserNode.getByteFrequencyData(frequencyData);

    for (var i=0; i<totalEls; i++) {

      var freqVol = frequencyData[i*4]/8;
      allRepeatedEls[i].style.height = freqVol+'vh';
    }
    if (window.pause) { return };
    requestAnimationFrame(animateStuff);

  }

  // getUserMedia success callback -> pipe audio stream into audio API
  var gotStream = function(stream) {
    // Create an audio input from the stream.
    var audioSource = audioAPI.createMediaStreamSource(stream);
    createAnalyserNode(audioSource);
    animateStuff();
  }

  // pipe in analysing to getUserMedia
  navigator.mediaDevices.getUserMedia({ audio: true, video: false })
    .then(gotStream);


  // hide and show animation
//   $('.visualize').click(function() {
//     console.log("clicked");
//     $('#screen').toggle();
//
//
//
// });



}
