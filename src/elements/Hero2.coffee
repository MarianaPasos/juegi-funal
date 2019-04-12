class Hero2 extends PIXI.Graphics

    velocity: 0
    gravity: 1  
    speed: 5
    onPlatform: true

    constructor: (app) ->
        super()
        @app = app
        @draw()
        window.addEventListener 'keypress', @onKeyPress
        window.addEventListener 'keyup', @onKeyUp
        @jump()

    draw:()=>
        @beginFill(0x00ffff)
        @drawRect(0, 0, 20, 20)
        @x = 100
        @y = 550
        @endFill()

    onKeyPress:(evt)=>
        if evt.key is 'w'
            @app.jumpPressed = true
        if evt.key is 'd'
            @app.rightPressed = true
        if evt.key is 'a'
            @app.leftPressed = true

    onKeyUp:(evt)=>
        if evt.key is 'w'
            @app.jumpPressed = false
        if evt.key is 'd'
            @app.rightPressed = false
        if evt.key is 'a'
            @app.leftPressed = false

    jump:()=>
        if @onPlatform is true
            @velocity = -15
            @onPlatform = false

    animate:()=>
        if (@app.jumpPressed)
            @jump()
        if (@app.leftPressed)
            @x += 3
        if (!@onPlatform)
            @velocity += @gravity


module.exports = Hero2