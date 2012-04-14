Villians = new Meteor.Collection("villians")

if Meteor.is_client
  
  window.villians = Villians
  
  window.villiansInsert = (key,value) ->
    Villians.insert({name: key, description: value})
  
  Template.cards.villians = () ->
    return Villians.find({}, {sort: {likes: -1, name: 1}})
  
  Template.hello.greeting = () ->
    return "Vote For Your Favorite Super Villain"
    
  Template.villian.events =
    'click .btn-primary' : (e) ->
      e.preventDefault()
      if typeof console isnt 'undefined'
        Villians.update({_id: this._id}, {$inc: {likes: 1}});
    
    'click .btn-secondary' : (e) ->
      e.preventDefault()
      if typeof console isnt 'undefined'
        Villians.update({_id: this._id}, {$inc: {likes: -1}});

  Template.hello.events = 
    'click input' : () ->
      # template data, if any, is available in 'this'
      if typeof console isnt 'undefined'
        console.log "You pressed the button"

if Meteor.is_server
  Meteor.startup () ->
    #code to run on server at startup
    if Villians.find().count() is 0
      villians = [ [ name: "Dr. Doom",  description: "Victor von Doom (also known as Doctor Doom) is a fictional character who appears in Marvel Comics publications. Created by Stan Lee and Jack Kirby, the character first appeared in Fantastic Four #5 (July 1962) wearing his trademark metal mask and green cloak. The son of a gypsy witch, Doom is a recurring supervillain, arch enemy of the Fantastic Four, and leader of the fictional nation of Latveria. He is both a genius inventor and a sorcerer, and has served as a primary antagonist and occasional protagonist in the Marvel continuity since his creation.", likes: 0, img: 'http://images3.wikia.nocookie.net/__cb20111006002338/marveldatabase/images/0/04/Dr_doom.jpg' ],
                   [ name: "Bowser", description: "Bowser Koopa, also known as King Koopa, is a video game character and the main antagonist of Nintendo's Mario series. In Japan, the character is known as Koopa (クッパ Kuppa?) and bears the title of Daimaō (大魔王?, lit. Great Demon King).[2] Bowser is the leader and most powerful of the Turtle-like Koopa race and is Mario's greedy archnemesis beginning with his first appearance, in the game Super Mario Bros. His ultimate goals are to marry Princess Peach, defeat Mario, and conquer the Mushroom Kingdom.", likes: 0, img: 'http://www.destructoid.com/elephant//ul/20743-550x-bowsss.jpg'],
                   [ name: "Gannon", description: "Ganon (ガノン?), anglicized Gannon in early Japanese materials, and also known in his humanoid form as Ganondorf (ガノンドロフ Ganondorofu?), is a fictional character who is the primary antagonist of Nintendo's The Legend of Zelda series. He is the final boss of most games in the series. He was first given a back-story in A Link to the Past. The English version of the A Link to the Past instruction manual adds the surname Dragmire and the alias Mandrag Ganon, which means Ganon of the Enchanted Thieves.", likes: 0, img: 'http://static.tumblr.com/1uzuq2f/nJfl8pvxp/ganondorf_by_rinerdar.jpg'],
                   [ name: "Galactus", description: "Galactus is a fictional character appearing in comic books and other publications published by Marvel Comics, as an entity who devours entire planets. Created by writer-editor Stan Lee and artist and co-plotter Jack Kirby, the character debuted in Fantastic Four #48 (March 1966), the first of a three-issue story later known as The Galactus Trilogy.", likes: 0, img: 'http://www.fightersgeneration.com/np7/char/galactus-clouds.jpg'],
                   [ name: "Saren Arterius", description: "Saren Arterius is a former turian Spectre and the main antagonist of the first game. He is known for getting results by any means necessary. More often than not, he has resorted to killing anyone and anything in his way - be it the target, any witnesses, or even innocent bystanders. In the novel Mass Effect: Revelation, he tortures and kills his victims mercilessly, rarely having any regards for sentient life or the lives of anyone in his way from getting the job done.", likes: 0, img: 'http://media.giantbomb.com/uploads/0/7472/329527-mass_effect___saren_with_gun_2__super.jpg'],
                   [ name: "Kid Buu", description: "Kid Buu (魔人ブウ 純粋, Majin Bū Junsui; lit. 'Majin Boo Pure'), also known as Majin Buu (魔人ブウ, Majin Bū), is the original and purest form of the Majin called Buu. The first form Buu appeared in Dragon Ball Z was actually the form that he took after he had absorbed Southern Supreme Kai and Grand Supreme Kai millions of years earlier and Kid Buu appeared again only after all of the fighters he had absorbed were removed from his system.", likes: 0, img: 'http://pictures.fanart-central.net/t/tilley025/753369.jpg'] ]
      for villian, i of villians
        Villians.insert({name: i[0].name, description: i[0].description, likes: i[0].likes, img_url: i[0].img})