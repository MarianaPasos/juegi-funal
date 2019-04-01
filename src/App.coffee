Bob = require("./elements/Bob")
Bobimage = require("./assets/bob.png")
Background = require ("./elements/Background")
Bg = require("./assets/background.png")
Back = require("./elements/Back")
B = require("./assets/camino.png")
bobData = require('./assets/Bob.json')



class App extends PIXI.Application
  animation:true
  animationNodes:[]
  Bob: null
  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    window.addEventListener("keypress", @onKeyPress)
    window.addEventListener 'keyup', @onKeyUp
    @preload()
    @animate()


  preload:=>
    PIXI.loader.add(Bg).add(B).add(bobData).load(@build)

  onKeyPress:(evt)=>
    if evt.key is 's'
      @Bob.idle.y += 3
      for i in [1..21] by 1
        frames.push(PIXI.Texture.fromFrame("slide #{i}.png"))
    if evt.key is 'w'
      @Bob.idle.y -= 3
      for i in [1..18] by 1
        frames.push(PIXI.Texture.fromFrame("jump #{i}.png"))
    if evt.key is 'a'
      @Bob.idle.x -= 3
      @Bob.idle.scale.x = -1
      for i in [1..13] by 1
        frames.push(PIXI.Texture.fromFrame("walk #{i}.png"))
    if evt.key is 'd'
      @Bob.idle.x += 3
      @Bob.idle.scale.x = 1
      for i in [1..13] by 1
        frames.push(PIXI.Texture.fromFrame("walk #{i}.png"))
  onKeyUp:(evt)=>
    if evt.key is 'w'
      for i in [1..5] by 1
        frames.push(PIXI.Texture.fromFrame("idle #{i}.png"))
    if evt.key is 'a'
      for i in [1..5] by 1
        frames.push(PIXI.Texture.fromFrame("idle #{i}.png"))
    if evt.key is 'd'
      for i in [1..5] by 1
        frames.push(PIXI.Texture.fromFrame("idle #{i}.png"))
    if evt.key is 's'
      for i in [1..5] by 1
        frames.push(PIXI.Texture.fromFrame("idle #{i}.png"))

  build:() =>
    Bg = new Background(Bg)
    Bg.alpha = 0.5
    
    B = new Back(B)
    
    container = new PIXI.Container
    container.addChild(Bg)
    container.addChild(B)
    @stage.addChild container
    @Bob = new Bob(@)



  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()

    null

module.exports = App
