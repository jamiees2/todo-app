#= require batman/es5-shim

#= require batman/batman
#= require batman/batman.rails

#= require jquery
#= require batman/batman.jquery

#= require_self

#= require_tree ./lib
#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./views

Batman.config.pathToHTML = '/assets/html'

class BatmanTodo extends Batman.App

  @root 'todos#all'
  @route '/completed', 'todos#completed'
  @route '/active', 'todos#active'

  # @on 'run', ->
  #   user = new BatmanTodo.User()
  #   user.url = '/sessions/current'
  #   user.load (err) -> throw err if err
  #   @set 'currentUser', user

  @on 'ready', ->
    console?.log "BatmanTodo ready for use."

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @set(key, '')
        , 2000
      value

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message

(global ? window).BatmanTodo = BatmanTodo
