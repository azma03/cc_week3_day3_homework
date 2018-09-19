require("pry")
require_relative("../models/artists")
require_relative("../models/albums")




artist1 = Artist.new({

  'name' => 'Prince'


  })

artist1.save()



artist2 = Artist.new({

  'name' => 'More Prince'

  })

artist2.save()


album1 = Album.new({

  'title' => 'Purple Rain',
  'genre' => 'All',
  'artist_id' => artist1.id


  })

  album1.save()

album2 = Album.new({

  'title' => 'Diamonds and Pearls',
  'genre' => 'Ballad',
  'artist_id' => artist1.id
  })

album2.save()


albums_artist = album2.list_artist()

artists = Artist.all()
albums = Album.all()

collection = artist1.list_albums()

artist1.name = 'Robert'
artist1.update_artist()
#
album2.title = 'Cottage & Cheese'
album2.update_album()


artist2.delete_artist()

album2.delete_album()

found_artist = Artist.find_artist(artist1.id)

found_album = Album.find_album(album1.id)


binding.pry
nil
