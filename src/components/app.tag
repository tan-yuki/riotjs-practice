<app>
  <form onsubmit={ addTodo }>
    <input name="title" type="text">
    <button>Add</button>
  </form>
  <ul>
    <li each={ items }>
      <input
        type="checkbox"
        checked={ done }>
      <span>{ title }</span>
    </li>
  </ul>

  <script>
  this.items = opts.items

  addTodo(e) {
    var title = e.target.title.value
    if (title) {
      this.items.push({
        title: title,
        done: false
      })
    }
  }
  </script>
</app>
