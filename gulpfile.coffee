gulp       = require('gulp')
browserify = require('browserify')
riotify    = require('riotify')
path       = require('path')
source     = require('vinyl-source-stream')
buffer     = require('vinyl-buffer')
uglify     = require('gulp-uglify')
sourcemaps = require('gulp-sourcemaps')
path       = require('path')

$ =
  app:  './src/app.js'
  src:  './src'
  dist: './dist'

gulp.task 'browserify', ->
  browserify
    entries: [$.app]
    debug: true
  .transform riotify
  .bundle()
    .pipe source path.basename $.app
    .pipe buffer()
    .pipe sourcemaps.init loadMaps: true
    .pipe uglify()
    .pipe sourcemaps.write './'
    .pipe gulp.dest $.dist
