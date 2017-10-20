ready = ->
  Typed.new '.element',
    strings: [
      'Welcome to my online home!'
      'Software development is the closest concept we have to magic.'
      'It\'s my goal to ensure that anyone with a passion for coding can become a true programming artisan.'
    ]
    typeSpeed: 50
  return
$(document).ready ready
$(document).on 'turbolinks:load', ready