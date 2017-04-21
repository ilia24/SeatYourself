
Restaurant.destroy_all
User.destroy_all
Reservation.destroy_all

r1= Restaurant.create(name: 'Los Colibris',image_url:'http://media.gq.com/photos/573e23554bf860ff12c0e961/master/pass/best-restaurants-gq-0616-03.jpg' )
r2=Restaurant.create(name: 'Il Fornello',image_url:'http://www.thestationcarrboro.com/wp-content/uploads/2017/02/Restaurant.jpg' )
r3=Restaurant.create(name: 'Byblos',image_url:'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTGnJyd1XtKx-Jwxb6OIIm_QNtQj0lqSd44cV0IbFBktYwnfUo9' )
r4=Restaurant.create(name: "Michael's On Simcoe",image_url:'http://cdn.torontolife.com/wp-content/uploads/2015/09/toronto-restaurant-alo-05-386x217.jpg' )
r5=Restaurant.create(name: 'Tundra Restaurant and Bar',image_url:'http://www.destination360.com/north-america/us/nevada/las-vegas/images/s/las-vegas-restaurants.jpg' )
r6=Restaurant.create(name: 'Kit Kat Italian Bar & Grill',image_url:'http://static.instyle.exp.mx/wp-content/uploads/2016/02/10124017/UntitledCafeteria.jpg' )

u1 = User.create!(name:'Feida',password: '12345',email:'asf@afsf.com')
u2 = User.create(name:'Brian',password: '12345',email:'asf@afsf.com')
u3 = User.create(name:'Pritam',password: '12345',email:'asf@afsf.com')
u4 = User.create(name:'Ilia',password: '12345',email:'asf@afsf.com')

Reservation.create!(user: u1, restaurant: r1)
Reservation.create!(user: u2, restaurant: r2)
Reservation.create!(user: u3, restaurant: r3)
Reservation.create!(user: u4, restaurant: r4)
