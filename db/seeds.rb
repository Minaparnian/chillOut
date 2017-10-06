User.destroy_all

u1 = User.create :email => "mina.mina@ga.com"
u2 = User.create :email => "saman.saman@ga.com"


Song.destroy_all

s1 = Song.create :name => "Crazy in love"
s2 = Song.create :name => "Nada"


Album.destroy_all

a1 = Album.create :name => "Dangerously in love", :image => "https://upload.wikimedia.org/wikipedia/en/8/84/Dangerously_In_Love_Album%282003%29.png"
a2 = Album.create :name => "El Dorado", :image => "https://upload.wikimedia.org/wikipedia/en/thumb/a/a7/Shakira_El_Dorado_cover.png/220px-Shakira_El_Dorado_cover.png"

Artist.destroy_all

r1 = Artist.create :name => "Beyonce"
r2 = Artist.create :name => "Shakira"


Playlist.destroy_all

p1 = Playlist.create :name => "Viva Latino-Top 50"
p2 = Playlist.create :name => "Best of 2017"




####Assosciation##############################################


a1.songs << s1
a2.songs << s2

r1.songs << s1
r2.songs << s2


p1.songs << s1 << s2
p2.songs << s2


u1.playlists << p1 << p2
u2.playlists << p2
