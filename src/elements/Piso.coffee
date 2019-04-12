class Piso extends PIXI.Graphics

    constructor: (p, app) ->
        super()
        @app = app
        @data = p
        @beginFill(@data.color)
        @drawRect(0, 0, @data.width, @data.height)
        @x = @data.x
        @y = @data.y
        @endFill()


module.exports = Piso