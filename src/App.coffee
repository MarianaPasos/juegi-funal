Background = require ("./elements/Background")
Bg = require("./assets/background.jpg")
Piso = require('./elements/Piso')
pisos = require('./data/pisos')
Enemy = require('./elements/Enemies')
enemies = require('./data/enemies')
Hero = require('./elements/Hero')


class App extends PIXI.Application
  animation:true
  animationNodes:[]
  pisos: []
  enemies: []
  hero: null
  leftPressed: false
  rightPressed: false
  upPressed: false
  downPressed: false
  jumpPressed: false

  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    window.addEventListener("keypress", @onKeyPress)
    window.addEventListener 'keyup', @onKeyUp
    @preload()


  preload:=>
    PIXI.loader.add(Bg).load(@build)

  onKeyPress:(evt)=>
    if evt.key is 'w'
      @hero.jump = @hero.jump + 1
      if @hero.jump < 4 
        @hero.gravitySpeed = -6
        @hero.onPlataform = false
    if evt.key is 'a'
      @leftPressed = true
      @hero.x -= 3
    if evt.key is 'd'
      @rightPressed = true
      @hero.x += 3

  onKeyUp:(evt)=>
    if evt.key is 'a'
      @leftPressed = false
      @hero.xAcc = 0
    if evt.key is 'd'
      @rightPressed = false
      @hero.xAcc = 0


  build:() =>
    Bg = new Background(Bg)
    Bg.alpha = 0.5
    
    
    container = new PIXI.Container
    container.addChild(Bg)
    @stage.addChild container

    for p in pisos
      plataformas = new Piso(p, @)
      @stage.addChild(plataformas)
      @pisos.push(plataformas)

    for e in enemies
      badboys = new Enemy(e, @)
      @stage.addChild(badboys)
      @enemies.push(badboys)

    @hero = new Hero(@)
    @addAnimationNodes @hero
    @stage.addChild @hero
    @animate()


  collisions:(player, arr)=>
    for p in arr
      if(player.x < p.x + p.width and p.x < player.x + player.width and player.y < p.y + p.height and p.y < player.y + player.height and player.y + player.height - p.y < player.gravitySpeed)
        player.y = p.y - player.height + 1
        return true





  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      if @collisions(@hero, @pisos) 
        #@hero.gravitySpeed = 0
        @hero.onPlataform = true
        @hero.jump = 0 
      else
        null
        @hero.onPlataform = false
      if @collisions(@hero, @enemies) 
        @hero.x = 100
        @hero.y = 550
      for n in @animationNodes
        n.animate?()

    null

module.exports = App
