class Rectangles extends PIXI.Graphics

    constructor:()->
        super()
        @build()

    build:=>
        @beginFill ('0xff0000')
        @drawRect(0,0,50,100)
        @endFill()
        @x = 50
        @y = 100

module.exports = Rectangles