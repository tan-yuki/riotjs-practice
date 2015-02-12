<app>
  <form onsubmit={ addTodo }>
    <input name="title" type="text">
    <button>Add</button>
  </form>
  <ul>
    <li each={ items }>
      <input type="checkbox" checked={ done }>
      <span>{ title }</span>
      <span><a href="#" onclick={ parent.remove }>delete</a></span>
    </li>
  </ul>

  <script>
  this.items = opts.items

  addTodo(e) {
    e.preventDefault()

    var title = e.target.title.value
    if (title) {
      this.items.push({
        title: title,
        done: false
      })

      e.target.title.value = ''
    }
  }

  remove(e) {
    e.preventDefault()

    var index = this.items.indexOf(e.item)

    this.items.splice(index, 1)
    this.update()
  }
  </script>
</app>
