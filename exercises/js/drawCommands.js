STEP = 20
OFFSET = new Point(200, 200)
var initPos = new Point(OFFSET.x, OFFSET.y)
var pos = new Point(0, 0)
var pencil = new Point(0, 0)
var angle = -90

var hist = {
  items: [],
  add: function(command) {
    this.items.push(command);
  },
  undo: function(delayed = false) {
    var itemsCopy = this.items.slice(0, -1);
    reset();
    this.items = [];
    for (var i = 0; i < itemsCopy.length; i++) {
      eval(itemsCopy[i]);
    }
  }
}

document.onload = reset()

function reset() {
  pos.set(0, 0) // the initial Position is applied only for drawing
  pencil.set(pos.x, pos.y)
  clearCanvas()
  angle = -90
}

function setColor(c = 'black') {
  var canvas = document.getElementById("drawboard");
  var context = canvas.getContext("2d");
  context.strokeStyle = c;
}

function undo() {
  hist.undo();
}

function setInitPos(x, y) {
  initPos.set(x, y)
  reset()
}

function clearCanvas() {
  var canvas = document.getElementById("drawboard")
  if (canvas == null)
    return
  var context = canvas.getContext("2d")
  context.clearRect(0, 0, canvas.width, canvas.height);
}

function turnLeft(a) {
  angle -= a;
  hist.add('turnLeft(' + a + ')')
}

function turnRight(a) {
  angle += a;
  hist.add('turnRight(' + a + ')')
}

function left(step = STEP) {
  pos.addX(-step)
  draw()
  hist.add('left(' + step + ')')
  return pos
}

function right(step = STEP) {
  pos.addX(step)
  draw()
  hist.add('right(' + step + ')')
  return pos
}

function up(step = STEP) {
  pos.addY(-step)
  draw()
  hist.add('up(' + step + ')')
  return pos
}

function down(step = STEP) {
  pos.addY(step)
  draw()
  hist.add('down(' + step + ')')
  return pos
}

function forward(step = STEP) {
  pos.addX(step * (Math.cos(Math.PI * angle / 180.0)))
  pos.addY(step * (Math.sin(Math.PI * angle / 180.0)))
  draw()
  hist.add('forward(' + step + ')')
  return pos
}

function back(step = STEP) {
  return forward(-step)
}

function goTo(x, y) {
  console.log(x)
  pos.set(x, -y)
  pencil.set(pos.x, pos.y)
  hist.add('goTo(' + x + ', ' + y + ')')
  return pos
}

function drawTo(x, y) {
  pos.set(x, -y)
  draw()
  return pos
}

function draw() {
  var paper = document.getElementById("drawboard").getContext("2d")
  paper.beginPath()
  // respect the initial Position
  paper.moveTo(pencil.x + initPos.x, pencil.y + initPos.y)
  paper.lineTo(pos.x + initPos.x, pos.y + initPos.y)
  paper.stroke()
  pencil.set(pos.x, pos.y)
}
