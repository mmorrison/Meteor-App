if Meteor.is_client
  Template.hello.greeting = () ->
    return "Welcome to meteor_app.";

  Template.hello.events = 
    'click input' : () ->
      # template data, if any, is available in 'this'
      if typeof console isnt 'undefined'
        console.log "You pressed the button"

if Meteor.is_server
  Meteor.startup () ->
    #code to run on server at startup
