class BatmanTodo.Todo extends Batman.Model
  @resourceName: 'todo'
  @storageKey: 'todos'
  @persist Batman.RailsStorage

  @encode 'title', 'completed'
  @validate 'title', presence: true

  @classAccessor 'active', ->
    @get('all').filter (todo) -> !todo.get('completed')

  @classAccessor 'completed', ->
    @get('all').filter (todo) -> todo.get('completed')

  @wrapAccessor 'title', (core) ->
    set: (key, value) -> core.set.call(@, key, value?.trim())