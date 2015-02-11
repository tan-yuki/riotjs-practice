var riot = require('riot')

require('./components/app.tag')

riot.mount('app', {
  items: [
    {
      title: 'hogehoge',
      done: false
    },
    {
      title: 'fugafuga',
      done: true
    }
  ]
})
