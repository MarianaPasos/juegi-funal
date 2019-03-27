fdata = require("./assets/idle.json")
pic1 = require("./assets/idle.png")
Background = require ("./elements/Background")
Bg = require("./assets/background.png")
Back = require("./elements/Back")
B = require("./assets/camino.png")



class App extends PIXI.Application
  animation:true
  animationNodes:[]
  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    @preload()
    window.addEventListener("keypress", @onKeyPress)
    window.addEventListener 'keyup', @onKeyUp


  preload:=>
    PIXI.loader.add(Bg).add(B).add(fdata).load(@build)

  onKeyPress:(evt)=>
    if evt.key is 's'
      @anim.y += 3
      @frame.splice(0,25)
      for i in [1..21] by 1
        @frame.push(PIXI.Texture.fromFrame("slide #{i}.png"))

    if evt.key is 'w'
      @anim.y -= 3
      @frame.splice(0,25)
      for i in [1..18] by 1
        @frame.push(PIXI.Texture.fromFrame("jump #{i}.png"))

    if evt.key is 'a'
      @anim.x -= 3
      @anim.scale.x = -1
      @frame.splice(0,25)
      for i in [1..13] by 1
        @frame.push(PIXI.Texture.fromFrame("walk #{i}.png"))

    if evt.key is 'd'
      @anim.x += 3
      @anim.scale.x = 1
      @frame.splice(0,25)
      for i in [1..13] by 1
        @frame.push(PIXI.Texture.fromFrame("walk #{i}.png"))


  onKeyUp:(evt)=>
    if evt.key is 'w'
      @frame.splice(0,25)
      for i in [1..5] by 1
        @frame.push(PIXI.Texture.fromFrame("idle #{i}.png"))

    if evt.key is 'a'
      @frame.splice(0,25)
      for i in [1..5] by 1
        @frame.push(PIXI.Texture.fromFrame("idle #{i}.png"))

    if evt.key is 'd'
      @frame.splice(0,25)
      for i in [1..5] by 1
        @frame.push(PIXI.Texture.fromFrame("idle #{i}.png"))

    if evt.key is 's'
      @frame.splice(0,25)
      for i in [1..5] by 1
        @frame.push(PIXI.Texture.fromFrame("idle #{i}.png"))

  build:() =>
    Bg = new Background(Bg)
    Bg.alpha = 0.5
    #@stage.addChild Bg
    
    B = new Back(B)
    #@stage.addChild B

    container = new PIXI.Container
    container.addChild(Bg)
    container.addChild(B)
    @stage.addChild container

    @frame = []
    for i in [1..5] by 1
      node = PIXI.Texture.fromFrame("idle #{i}.png")
      @frame.push node

    @anim = new PIXI.extras.AnimatedSprite(@frame)
    @anim.x = 0
    @anim.y = 470
    @anim.anchor.set(0.2)
    @anim.animationSpeed = 0.1
    @anim.play()

    @stage.addChild(@anim)



  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()

    null

module.exports = App
