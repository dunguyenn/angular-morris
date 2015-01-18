gulp = require 'gulp'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'
sourcemaps = require 'gulp-sourcemaps'
uglify = require 'gulp-uglify'

gulp.task 'coffee', ->
  gulp.src ['src/**/*.coffee']
    .pipe sourcemaps.init()
    .pipe coffee()
    .pipe concat 'angular-morris.js'
    .pipe sourcemaps.write()
    .pipe gulp.dest 'dist'

gulp.task 'watch', ->
  gulp.watch ['src/**/*.coffee'], ['coffee', 'minify']

gulp.task 'minify', ->
  gulp.src ['dist/angular-morris.js']
    .pipe uglify()
    .pipe concat 'angular-morris.min.js'
    .pipe gulp.dest 'dist'

gulp.task 'build', ['coffee', 'minify']

gulp.task 'default', ['build', 'watch']
