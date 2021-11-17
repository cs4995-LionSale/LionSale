# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {
        email: 'admin@example.com',
        username: 'admin',
        password: 'AdminPassword',
        password_confirmation: 'AdminPassword',
        address: 'Admin\'s Address',
        rating_buyer: 5,
        rating_seller: 5,
        permission: 99
    },
    {
        email: 'klee@example.com',
        username: 'Klee',
        password: 'KleePassword',
        password_confirmation: 'KleePassword',
        address: '1 Klee St., Mondstadt',
        rating_buyer: 5,
        rating_seller: 2.8,
        permission: 0
    },
    {
        email: 'hu_tao@example.com',
        username: 'Hu Tao',
        password: 'HuTaoPassword',
        password_confirmation: 'HuTaoPassword',
        address: '233 Hu Tao Ave., Liyue',
        rating_buyer: 4.5,
        rating_seller: 4.4,
        permission: 0
    },
    {
        email: 'amber@example.com',
        username: 'Amber',
        password: 'AmberPassword',
        password_confirmation: 'AmberPassword',
        address: '157 Amber Ave., Mondstadt',
        rating_buyer: 4.5,
        rating_seller: 3.6,
        permission: 0
    },
    {
        email: 'deleted@example.com',
        username: 'Deleted',
        password: 'DeletedPassword',
        password_confirmation: 'DeletedPassword',
        address: 'Deleted',
        rating_buyer: 4.5,
        rating_seller: 3.6,
        permission: -99
    },
])
users[0].avatar.attach(
    io: File.open('db/seeds/1f605.png'),
    filename: '1f605.png'
)
users[1].avatar.attach(
    io: File.open('db/seeds/Character-Klee.png'),
    filename: 'Character-Klee.png'
)
users[2].avatar.attach(
    io: File.open('db/seeds/Hu-Tao.png'),
    filename: 'Hu-Tao.png'
)
users[3].avatar.attach(
    io: File.open('db/seeds/Character-Amber.png'),
    filename: 'Character-Amber.png'
)
users[4].avatar.attach(
    io: File.open('db/seeds/1f605m.png'),
    filename: '1f605m.png'
)
root_category = Category.create({
    name: "All"
})
lv1_categories = Category.create([
    {
        name: "Books",
        parent_category:root_category
    },
    {
        name: "Comsumable Items",
        parent_category:root_category
    },
    {
        name: "Weapons",
        parent_category:root_category
    }
])
lv2_categories = Category.create([
    {
        name: "Potions",
        parent_category:lv1_categories[1]
    },
    {
        name: "Others",
        parent_category:lv1_categories[1]
    }
])
items = Item.create([
    {
        title:"1000 YEARS OF LONELINESS",
        description:"<p>The beginning of the Springvale Hunter's tragic fantasy journey. Where did misfortune first befall him? What marks the start and finish of the 1000-year journey of loneliness? Let this first volume of 1000 Years of Loneliness be your guide through the fantastical fog that is the life of Gothson.</p>",
        seller:users[0],
        price:9.99,
        status:0,
        stock:10,
        category:lv1_categories[0]
    },
    {
        title:"ALONG WITH DIVINITY - PROLOGUE",
        description:"<p>Have you ever thought about what our lives would’ve been like without archons?<br> Come and join the author in an exploration of \“divinity\” with humor and logic.</p>",
        seller:users[0],
        price:0.99,
        status:20,
        stock:0,
        category:lv1_categories[0]
    },
    {
        title:"ADEPTUS' TEMPTATION",
        description:"<p>A complex, famous type of Liyue cuisine, in which specially selected ingredients are submerged and slowly bowled in soup stock. The recipe scribbled from memory alone was enough to urge the adepti to once again return to the world of men.</p>",
        seller:users[0],
        price:106,
        status:50,
        stock:0,
        category:lv2_categories[1]
    },
    {
        title:"WINDBARRIER POTION",
        description:"<p>A mysterious potion that boosts Anemo RES and makes one able to withstand strong winds. It works wonders for adventurers out in the world and is even said to keep the cold away.</p>",
        seller:users[1],
        price:19.99,
        status:0,
        stock:10,
        category:lv2_categories[0]
    },
    {
        title:"AMOS' BOW",
        description:"<h3>Detailed Description</h3><p>In a barren ancient time, when the now-verdant land was still but a wasteland,<br> A maiden, barefoot in the snow, followed the footsteps of the Lord of the Tower.</p><p>He once was her love, but the unforgiving winds could never understand the softness of mortal flesh.<br> He once was her foe, but her hunt was for more than simple vengeance.</p><p>\"I dreamt of ocean waves and sand, of lush forests and land.\"<br> \"I dreamt of boars playing in berry bushes, of a towering spire.\"<br> These words she spoke to the God King in a soft tone, but they were left unheard.</p><p>Awoken from blind love, she realized she was the only one who spoke with sincerity.<br> For he spoke of love, but was only accompanied by razor winds.<br> He looked down at the bent backs of his subjects in the howling wind,<br> Believing it to be a sign of their adoration and unwavering obedience.</p><p>It was the era when the Tyrant of the North Wind warred with the Lord of the Tower.<br> The huntress thought herself loved by the slavemaster.<br> At the end of the war, and when the wind of resistance first blew,<br> In the company of a nameless young man, elf, and knight,<br> She scaled the towering spire and challenged the eccentric Lord.</p><p>\"Finally, I shall hold his gaze.\"</p><p>But it was not until the moment when her arrow flew toward him,<br> And when the piercing wind was about to rip her asunder,<br> That she finally realized their distance apart.</p>",
        seller:users[2],
        price:19999.99,
        status:10,
        stock:0,
        category:lv1_categories[2]
    },
])
items[0].photos.attach(
    io: File.open('db/seeds/1000_Years_of_Loneliness.png'),
    filename: '1000_Years_of_Loneliness.png'    
)
items[0].photos.attach(
    io: File.open('db/seeds/1000_Years_of_Loneliness-1.png'),
    filename: '1000_Years_of_Loneliness-1.png'    
)
items[1].photos.attach(
    io: File.open('db/seeds/Along_with_Divinity.png'),
    filename: 'Along_with_Divinity.png'    
)
items[1].photos.attach(
    io: File.open('db/seeds/Along_with_Divinity-1.png'),
    filename: 'Along_with_Divinity-1.png'    
)
items[2].photos.attach(
    io: File.open('db/seeds/Adeptus_Temptation.png'),
    filename: 'Adeptus_Temptation.png'     
)
items[2].photos.attach(
    io: File.open('db/seeds/Delicious_Adeptus_Temptation.png'),
    filename: 'Delicious_Adeptus_Temptation.png'     
)
items[2].photos.attach(
    io: File.open('db/seeds/Suspicious_Adeptus__Temptation.png'),
    filename: 'Suspicious_Adeptus__Temptation.png'     
)
items[3].photos.attach(
    io: File.open('db/seeds/Windbarrier_Potion.png'),
    filename: 'Windbarrier_Potion.png' 
)
items[4].photos.attach(
    io: File.open('db/seeds/5_amos_bow.jpg'),
    filename: '5_amos_bow.jpg' 
)
items[4].photos.attach(
    io: File.open('db/seeds/5_amos_bow-1.png'),
    filename: '5_amos_bow-1.png' 
)
transactions = Transaction.create([
    {
        item:items[3],
        seller:users[2],
        buyer:users[3],
        expected_deal_time: Time.now + 2.days,
        real_deal_time: nil,
        deal_address: "157 Amber Ave., Mondstadt",
        deal_price: 19.99,
        quantity: 1,
        status: 200,
        buyer_rating: nil,
        seller_rating: nil
    },
    {
        item:items[1],
        seller:users[1],
        buyer:users[2],
        expected_deal_time: Time.now - 2.days,
        real_deal_time: Time.now - 1.day,
        deal_address: "233 Hu Tao Ave., Liyue",
        deal_price: 0.99,
        quantity: 10,
        status: 0,
        buyer_rating: 5,
        seller_rating: 4
    },
    {
        item:items[0],
        seller:users[0],
        buyer:users[4],
        expected_deal_time: Time.now - 200.days,
        real_deal_time: Time.now - 199.days,
        deal_address: "N/A",
        deal_price: 0.99,
        quantity: 1,
        status: 122,
        buyer_rating: nil,
        seller_rating: nil
    }
])