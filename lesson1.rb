#Custom times method

# def times(number)
#   counter = 0
#   while counter < number do 
#     yield(counter)
#     counter += 1
#   end
#   number
# end


# times(5) do |num|
#   puts num
# end

#Custom each method

# def each(arr)
#   counter = 0

#   while counter < arr.size do 
#     yield(arr[counter])
#     counter += 1
#   end

#   arr

# end

# saved = each([1,2,3,4]) do |num|
#   puts num
# end

#Custom select method

# def select(arr)
#   selected_arr = []
#   counter = 0
#   while counter < arr.size do 
#     current_element = arr[counter]
#     selected_arr.push(current_element) if yield(current_element)
#     counter += 1
#   end
#   selected_arr
# end

# saved = select([1,2,3]) do |num|
#   num > 1
# end

# p saved


# array = [1, 2, 3, 4, 5]

# test1 = select(array) { |num| num.odd? }      # => [1, 3, 5]
# test2 = select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# test3 = select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

# p test1
# p test2
# p test3

#Custom reduce method

# def reduce(arr, starting_value = 0)
#   counter = 0
#   acc = starting_value

#   while counter < arr.size do 
#     num = arr[counter]
#     acc = yield(acc, num)
#     counter += 1
#   end

#   acc
# end

# array = [1, 2, 3, 4, 5]

# test1 = reduce(array) { |acc, num| acc + num }                    # => 15
# test2 = reduce(array, 10) { |acc, num| acc + num }    \

# p test1
# p test2
# test3 = reduce(array) { |acc, num| acc + num if num.odd? }

#ToDoList Assignment 9

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    if item.class == Todo 
      self.todos.push(item)
    else 
      raise TypeError.new("Can only add Todo objects.")
    end

    todos.each { |item| puts item }
  end

  def size
    todos.size
  end

  def first
    puts todos.first
  end

  def last
    puts todos.last
  end

  def to_a
    readable_arr = []
    todos.each do |todo|
      readable_arr.push("[#{todo.done? ? Todo::DONE_MARKER : Todo::UNDONE_MARKER}] #{todo.title}")
    end
    readable_arr
  end

  def done?
   todos.all? { |todo| todo.done? }
  end

  def item_at(index)
    if index < todos.size && index >= 0
      todos.fetch(index)
    else
      raise IndexError.new
    end
  end

  def mark_done_at(index)
    if index < todos.size && index >= 0
      todos[index].done!
    else
      raise IndexError
    end
  end

  def mark_undone_at(index)
    if index < todos.size && index >= 0
      todos[index].undone!
    else
      raise IndexError
    end
  end

  def remove_at(index)
    if index < todos.size && index >= 0
      todos.delete_at(index)
    else
      raise IndexError
    end
  end

  def done!
    todos.each do |todo|
      todo.done!
    end
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def to_s
    puts "-----Today's todo list: ------"
    todos.each do |todo|
      puts todo
    end
  end

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    todos.each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def find_by_title(str)
    match = nil
    todos.each do |todo|
      match = todo.title if todo.title == str
    end
    match
  end

  def all_done
    done = select{ |todo| todo.done?}
  end

  def all_not_done
    not_done = select { |todo| !todo.done?}
  end

  def mark_done(str)
    each do |todo|
      todo.done! if todo.title == str 
    end
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_not_done
    each do |todo|
      todo.undone!
    end
  end

end



# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list



todo1.done!

list.mark_all_not_done
p list.to_a



# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.class

# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end

# list.size
# list.first
# list.last

# list.to_a
# list.done?

# # #list.item_at                    # raises ArgumentError
# # list.item_at(1)                 # returns 2nd item in list (zero based index)
# # list.item_at(100)               # raises IndexError

# #list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# #list.mark_done_at(100)          # raises IndexError

# list.mark_undone_at(1) 

# list.done!

# # p list.shift

# # #list.pop

# list.to_s