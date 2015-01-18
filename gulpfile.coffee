gulp = require 'gulp'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'
sourcemaps = require 'gulp-sourcemaps'

gulp.task 'coffee', ->
  gulp.src ['./src/**/*.coffee']
    .pipe sourcemaps.init()
    .pipe coffee()
    .pipe concat 'angular-morris.js'
    .pipe sourcemaps.write()
    .pipe gulp.dest './dist/'

gulp.task 'watch', ->
  gulp.watch ['./src/**/*.coffee'], ['coffee']

gulp.task 'build', ['coffee']

gulp.task 'default', ['build', 'watch']
