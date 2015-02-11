var riot = require('riot')

require('./components/app.tag')

riot.mount('app', {
  items: [
    {
      id: 1,
      title: 'hogehoge',
      done: false
    },
    {
      id: 2,
      title: 'fugafuga',
      done: true
    }
  ]
})
