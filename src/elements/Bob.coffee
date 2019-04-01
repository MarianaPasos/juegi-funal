bob = require('../assets/bob.png')
app = require('../App.coffee')

class Bob 
    x: 100
    y: 100
    idle: null
    scale: 1
    animationSpeed: 0.1
    speedX: 0
    speedY: 0
    alpha: 1

    constructor: (app)->
        @app = app
        @build()
    build:()=>
        frames = []
        for i in [1..5] by 1
            frames.push(PIXI.Texture.fromFrame("idle #{i}.png"))
        @idle = new PIXI.extras.AnimatedSprite(frames)
        @idle.scale.x = @scale
        @idle.scale.y = @scale
        @idle.x = @x
        @idle.y = @y
        @idle.animationSpeed = @animationSpeed
        @idle.play()
        @app.stage.addChild @idle
        @idle.anchor.set 0.5


module.exports = Bob