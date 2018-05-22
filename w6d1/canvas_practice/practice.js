document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("myCanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "purple" //`rgb(137,0,206)`;
  ctx.fillRect(0,0,500,500);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "orange";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "orange";
  ctx.fill();

});
