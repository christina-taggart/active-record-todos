require_relative '../app/models/list'
require_relative '../app/models/task'
require_relative '../app/models/tag'
require_relative '../app/models/cat'

# Being lazy, just writing task attributes as hash

list_1_tasks = [{list_id: 1, body: "milk", completed: 1},
                {list_id: 1, body: "eggs", completed: 1},
                {list_id: 1, body: "kimchi", completed: 0},
                {list_id: 1, body: "lotus root", completed: 1},
                {list_id: 1, body: "sichuan spices", completed: 1},
                {list_id: 1, body: "coconut water", completed: 0},
                {list_id: 1, body: "spam", completed: 0},
                {list_id: 1, body: "cheez-its", completed: 0},
                {list_id: 1, body: "cheez wiz", completed: 1}]


list_2_tasks = [{list_id: 2, body: "active record", completed: 1},
                {list_id: 2, body: "study OO", completed: 0},
                {list_id: 2, body: "Read POODR", completed: 0},
                {list_id: 2, body: "Make cool rails app", completed: 1}]




list_3_tasks = [{list_id: 3, body: "clean room", completed: 1},
                {list_id: 3, body: "get sheets", completed: 0}]


tags = [{body: "shopping"}, {body: "food"}, {body: "important"}]

tags_tasks = [{tag_id: 1, task_id: 1},
              {tag_id: 1, task_id: 2},
              {tag_id: 1, task_id: 3},
              {tag_id: 2, task_id: 3},
              {tag_id: 3, task_id: 3},
              {tag_id: 1, task_id: 5},
              {tag_id: 3, task_id: 6},
              {tag_id: 2, task_id: 8},
              {tag_id: 1, task_id: 9}]

List.create!({name: "Grocery shopping"})
list_1_tasks.each{ |attributes| Task.create!(attributes)}
List.create!({name: "DBC"})
list_2_tasks.each{ |attributes| Task.create!(attributes)}
List.create!({name: "Chores"})
list_3_tasks.each{ |attributes| Task.create!(attributes)}
tags.each{ |attributes| Tag.create!(attributes)}
tags_tasks.each{ |attributes| Cat.create!(attributes) }
