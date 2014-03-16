class BatmanTodo.User extends Batman.Model
  @storageKey: 'users'
  @resourceName: 'user'
  @persist Batman.RailsStorage
  
  @encode 'id', 'nickname', 'api_key'