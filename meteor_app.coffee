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
      names = 
        "Dr. Doom" : "Victor von Doom (also known as Doctor Doom) is a fictional character who appears in Marvel Comics publications. Created by Stan Lee and Jack Kirby, the character first appeared in Fantastic Four #5 (July 1962) wearing his trademark metal mask and green cloak. The son of a gypsy witch, Doom is a recurring supervillain, arch enemy of the Fantastic Four, and leader of the fictional nation of Latveria. He is both a genius inventor and a sorcerer, and has served as a primary antagonist and occasional protagonist in the Marvel continuity since his creation. While Doom's chief opponents have been the Fantastic Four, he has also frequently battled Spider-Man, Doctor Strange, the Avengers, the X-Men, the Punisher, Blade, Iron Man, and the Silver Surfer, among others.",
        "Bowser" : "Bowser Koopa, also known as King Koopa, is a video game character and the main antagonist of Nintendo's Mario series. In Japan, the character is known as Koopa (クッパ Kuppa?) and bears the title of Daimaō (大魔王?, lit. Great Demon King).[2] Bowser is the leader and most powerful of the Turtle-like Koopa race and is Mario's greedy archnemesis beginning with his first appearance, in the game Super Mario Bros. His ultimate goals are to marry Princess Peach, defeat Mario, and conquer the Mushroom Kingdom. Since his debut, he has appeared in almost every Mario series game.",
        "Gannon" : "Ganon (ガノン?), anglicized Gannon in early Japanese materials, and also known in his humanoid form as Ganondorf (ガノンドロフ Ganondorofu?), is a fictional character who is the primary antagonist of Nintendo's The Legend of Zelda series. He is the final boss of most games in the series. He was first given a back-story in A Link to the Past. The English version of the A Link to the Past instruction manual adds the surname Dragmire and the alias Mandrag Ganon, which means Ganon of the Enchanted Thieves.",
        "Galactus" : "Galactus is a fictional character appearing in comic books and other publications published by Marvel Comics, as an entity who devours entire planets. Created by writer-editor Stan Lee and artist and co-plotter Jack Kirby, the character debuted in Fantastic Four #48 (March 1966), the first of a three-issue story later known as The Galactus Trilogy.",
        "Saren Arterius" : "Saren Arterius is a former turian Spectre and the main antagonist of the first game. He is known for getting results by any means necessary. More often than not, he has resorted to killing anyone and anything in his way - be it the target, any witnesses, or even innocent bystanders. In the novel Mass Effect: Revelation, he tortures and kills his victims mercilessly, rarely having any regards for sentient life or the lives of anyone in his way from getting the job done. In addition, Saren was responsible for sabotaging Captain Anderson's Spectre candidacy because of his hatred of humans. His seething hatred of humanity is speculated to have stemmed from the loss of his brother Desolas at the hands of the Systems Alliance in the First Contact War.",
        "Doctor Wily" : "Doctor Wily (Dr.ワイリー Dokutā Wairi?), full name Albert W. Wily, is a video game character and the main antagonist of the original Mega Man series. Designed by Keiji Inafune, he appeared in the first Mega Man video game and later in promotions and other media related to the series. In Japanese, he is voiced by Takeshi Aono in all appearances except Mega Man: The Power Battle and its sequel; in English, the character is voiced by Dean Galloway, with Ian James Corlett and Scott McNeil voicing the character in Captain N: The Game Master and the animated series, respectively."
      for key, value of names
        Villians.insert({name: key, description: value})