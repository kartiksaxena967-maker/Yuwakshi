<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>For Yashi ❤️</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
  margin: 0;
  font-family: 'Segoe UI', sans-serif;
  background: linear-gradient(to bottom, #ffdde1, #ee9ca7);
  color: #fff;
  text-align: center;
  overflow-x: hidden;
}

section {
  padding: 60px 20px;
}

h1, h2 {
  font-weight: 600;
}

.hero {
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

button {
  padding: 15px 30px;
  font-size: 18px;
  border: none;
  border-radius: 30px;
  background: #ff4b6e;
  color: white;
  cursor: pointer;
  margin-top: 20px;
}

button:hover {
  background: #ff1e56;
}

img {
  width: 80%;
  max-width: 350px;
  border-radius: 20px;
  margin: 20px 0;
  box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}

.story {
  font-size: 18px;
  line-height: 1.8;
  max-width: 800px;
  margin: auto;
}

.chat {
  background: #111;
  border-radius: 15px;
  padding: 20px;
  max-width: 400px;
  margin: auto;
  text-align: left;
}

.msg {
  background: #dcf8c6;
  color: #000;
  padding: 10px 15px;
  border-radius: 15px;
  margin: 10px 0;
  width: fit-content;
}

footer {
  padding: 40px;
  font-size: 20px;
}
canvas {
  position: fixed;
  top:0;
  left:0;
  z-index:-1;
}
</style>
</head>

<body>

<canvas id="fireworks"></canvas>

<audio id="music" loop>
  <source src="music.mp3" type="audio/mpeg">
</audio>

<section class="hero">
  <h1>Hey Yashi ❤️</h1>
  <h2>This is not just a website…  
  it’s my heart, written for you</h2>
  <button onclick="startLove()">Tap to begin 💖</button>
</section>

<section>
  <h2>The Smile I Fell For 🌸</h2>
  <img src="pic1.jpg">
  <img src="pic2.jpg">
</section>

<section>
  <h2>Every Picture, One Feeling ❤️</h2>
  <img src="pic3.jpg">
  <img src="pic4.jpg">
</section>

<section class="story">
  <h2>My Love Letter to You 💌</h2>
  <p>
    Yashi,  
    I don’t know when it happened…  
    but somewhere between your smile, your silence,  
    and the way you exist so beautifully,  
    you became my favorite part of every day.
  </p>
  <p>
    Loving you never felt like a choice.  
    It felt like something my heart decided  
    long before I could explain it.
  </p>
  <p>
    If forever had a face,  
    it would look like you smiling at me.
  </p>
</section>

<section>
  <h2>One Last Question 💍</h2>
  <h1>Will you be mine forever, Yashi? ❤️</h1>
  <button onclick="celebrate()">YES 💖</button>
</section>

<section>
  <h2>Message from me 💬</h2>
  <div class="chat">
    <div class="msg">Hey Yashi…</div>
    <div class="msg">I just wanted to say this once, honestly.</div>
    <div class="msg">I love you. Not perfectly, but truly.</div>
    <div class="msg">No matter what, my heart chooses you.</div>
    <div class="msg">– Kartik ❤️</div>
  </div>
</section>

<footer>
  Made with all my heart ❤️  
  Yours always, Kartik
</footer>

<script>
function startLove(){
  document.getElementById("music").play();
  window.scrollTo({top: window.innerHeight, behavior:'smooth'});
}

function celebrate(){
  startFireworks();
  alert("You just made my heart the happiest ❤️");
}

// Fireworks
const canvas = document.getElementById("fireworks");
const ctx = canvas.getContext("2d");
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

let particles = [];

function startFireworks(){
  for(let i=0;i<200;i++){
    particles.push({
      x: canvas.width/2,
      y: canvas.height/2,
      vx: (Math.random()-0.5)*6,
      vy: (Math.random()-0.5)*6,
      life: 100
    });
  }
}

function animate(){
  ctx.clearRect(0,0,canvas.width,canvas.height);
  particles.forEach((p,i)=>{
    p.x += p.vx;
    p.y += p.vy;
    p.life--;
    ctx.fillStyle = "rgba(255,255,255,0.8)";
    ctx.fillRect(p.x,p.y,3,3);
    if(p.life<=0) particles.splice(i,1);
  });
  requestAnimationFrame(animate);
}
animate();
</script>

</body>
</html>
