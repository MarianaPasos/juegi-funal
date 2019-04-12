class Enemies extends PIXI.Graphics

    constructor: (e, app) ->
        super()
        @app = app
        @data = e
        @beginFill(@data.color)
        @drawRect(0, 0, @data.width, @data.height)
        @x = @data.x
        @y = @data.y
        @endFill()


module.exports = Enemies