class Hero extends PIXI.Graphics
    speedX: 0
    speedY: 0
    gravity: 0.6
    gravitySpeed: 0
    pause: false
    yAcc: 0
    xAcc: 0
    onPlatform: false
    jump: 0

    constructor: (app) ->
        super()
        @app = app
        @draw()

    draw:()=>
        @beginFill(0x00ffff)
        @drawRect(0, 0, 20, 20)
        @x = 100
        @y = 550
        console.log 'new hero'
        @endFill()

    animate:()=>
        if @pause is true then return
        @x += @speedX
        @.x += @.xAcc
        if (@app.rightPressed && @.xAcc < 3 && !@app.leftPressed)
            @.xAcc++

        if (@app.leftPressed && @.xAcc > -3 && !@app.rightPressed)
            @.xAcc--
        if @onPlataform is true then return
        @gravitySpeed += @gravity
        @y += @gravitySpeed
        if @y >= 550
            #@gravitySpeed = -@gravity
            @y = 550
            @jump = 0

module.exports = Hero