
Restaurant.destroy_all
User.destroy_all
Reservation.destroy_all



r1=Restaurant.create(name: 'Los Colibris',opentime:,image_url:'http://media.gq.com/photos/573e23554bf860ff12c0e961/master/pass/best-restaurants-gq-0616-03.jpg' )
r2=Restaurant.create(name: 'Il Fornello',image_url:'http://www.thestationcarrboro.com/wp-content/uploads/2017/02/Restaurant.jpg' )
r3=Restaurant.create(name: 'Byblos',image_url:'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTGnJyd1XtKx-Jwxb6OIIm_QNtQj0lqSd44cV0IbFBktYwnfUo9' )
r4=Restaurant.create(name: "Michael's On Simcoe",image_url:'http://cdn.torontolife.com/wp-content/uploads/2015/09/toronto-restaurant-alo-05-386x217.jpg' )
r5=Restaurant.create(name: 'Tundra Restaurant and Bar',image_url:'http://www.destination360.com/north-america/us/nevada/las-vegas/images/s/las-vegas-restaurants.jpg' )
r6=Restaurant.create(name: 'Kit Kat Italian Bar & Grill',image_url:'http://static.instyle.exp.mx/wp-content/uploads/2016/02/10124017/UntitledCafeteria.jpg' )

Timeslot.destroy_all

#CURRENT SEEDS WILL NOT WORK PROPERLY FOR TESTING. we need to make forms for everytrhing to sure all the ID's line up!
# they need to be rewtweaked to ensure that all the ID's are matched up so we can keep testing associations, easiest way is to do it via forms!
# -ilia


#
# t1 = Time.new(2002, 10, 31, 16)
# t2 = Time.new(2002, 10, 31, 12)
# Restaurant.create(name: 'Los Colibris',image_url:'http://media.gq.com/photos/573e23554bf860ff12c0e961/master/pass/best-restaurants-gq-0616-03.jpg', opentime: t2, closetime: t1 )
User.create!(name:'Feida',password: '12345',email:'asf@afsf.com')
# User.create(name:'Brian',password: '12345',email:'asf@afsf.com')
# User.create(name:'Pritam',password: '12345',email:'asf@afsf.com')
# User.create(name:'Ilia',password: '12345',email:'asf@afsf.com')
# Reservation.create!(user_id: 1, restaurant_id: 1, start_time: t2, end_time: t1)

# r2=Restaurant.create(name: 'Il Fornello',image_url:'http://www.thestationcarrboro.com/wp-content/uploads/2017/02/Restaurant.jpg' )
# r3=Restaurant.create(name: 'Byblos',image_url:'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTGnJyd1XtKx-Jwxb6OIIm_QNtQj0lqSd44cV0IbFBktYwnfUo9' )
# r4=Restaurant.create(name: "Michael's On Simcoe",image_url:'http://cdn.torontolife.com/wp-content/uploads/2015/09/toronto-restaurant-alo-05-386x217.jpg' )
# r5=Restaurant.create(name: 'Tundra Restaurant and Bar',image_url:'http://www.destination360.com/north-america/us/nevada/las-vegas/images/s/las-vegas-restaurants.jpg' )
# r6=Restaurant.create(name: 'Kit Kat Italian Bar & Grill',image_url:'http://static.instyle.exp.mx/wp-content/uploads/2016/02/10124017/UntitledCafeteria.jpg' )


# Reservation.create!(user: u2, restaurant: r2)
# Reservation.create!(user: u3, restaurant: r3)
# Reservation.create!(user: u4, restaurant: r4)
