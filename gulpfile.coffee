gulp        = require 'gulp'
gutil       = require 'gulp-util'
browserify  = require 'browserify'
riotify     = require 'riotify'
path        = require 'path'
source      = require 'vinyl-source-stream'
buffer      = require 'vinyl-buffer'
uglify      = require 'gulp-uglify'
sourcemaps  = require 'gulp-sourcemaps'
watchify    = require 'watchify'
path        = require 'path'
browserSync = require 'browser-sync'
reload      = browserSync.reload
clean       = require 'gulp-clean'

gulp.task 'clean', ->
  gulp.src './dist', read: false
    .pipe clean()

gulp.task 'browserify', ->
  browserify
    entries: ['./src/main.js']
    debug: true
  .transform riotify
  .bundle()
    .pipe source 'main.js'
    .pipe buffer()
    .pipe sourcemaps.init loadMaps: true
    .pipe uglify()
    .pipe sourcemaps.write './'
    .pipe gulp.dest './dist'
  .on 'error', ->
    gutil.log(arguments)

gulp.task 'watch', ->
  browserSync.init
    notify: false,
    server:
      baseDir: './'
  o = debounceDelay: 3000

  gulp.watch ['./src/**/*.js', './src/**/*.tag'], o, [
    'clean'
    'browserify'
  ]

  gulp.watch ['./dist/main.js', './index.html'], o, reload

