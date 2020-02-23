DROP DATABASE if exists greenlist_db
CREATE DATABASE greenlist_db;

\c greenlist_db;


CREATE TABLE creators
(
    id SERIAL PRIMARY KEY,
    username VARCHAR,
    firstname VARCHAR,
    lastname VARCHAR,
    password VARCHAR,
    about VARCHAR,
    avatar_Url VARCHAR,
    phone_Number VARCHAR,
    email VARCHAR,
    wesbite VARCHAR,
    address VARCHAR
);

CREATE TABLE resourcers
(
    id SERIAL PRIMARY KEY,
    company VARCHAR,
    password VARCHAR,
    about VARCHAR,
    avatar_Url VARCHAR,
    phone_Number VARCHAR,
    email VARCHAR,
    wesbite VARCHAR,
    address VARCHAR
);

CREATE TABLE products
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    body VARCHAR,
    resourcers_id INT REFERENCES resourcers (id),
    material_id INT REFERENCES materials (id)
);

CREATE TABLE reclaims
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    quantity VARCHAR,
    TIMESTAMP
    WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    body VARCHAR, 
    creator_id INT REFERENCES creators
    (id) 
);

    CREATE TABLE materials
    (
        id SERIAL PRIMARY KEY,
        name VARCHAR,
        description VARCHAR,
        photo_url VARCHAR
    );

    CREATE TABLE photos
    (
        id SERIAL PRIMARY KEY,
        name VARCHAR,
        description VARCHAR,
        photo_url VARCHAR,
        reclaim_id INT references reclaims(id)
    );

    -- Dummy data. 
INSERT INTO creators
        (username, firstname, lastname, about, avatar_url, phoneNumber, email, website, address)
VALUES
        ('FashionitaAransa', 'Aransa', 'Garcia', 'garcia', 'Desginer that loves reusing and recycling', 'https://image.flaticon.com/icons/svg/219/219969.svg ', '(000)000-0001', 'aransagarcia@pursuit.org', 'aransa.com', 'no address for you'),
        ('ElectricTrailor', 'Sergio', 'Salama', 'I design the best and use the best', 'https://wasupwireless.com/web/wp-content/uploads/2019/06/avatar2.png', '(000)-000-0003', 'sergiosalama@pursuit.org', 'NYU Campus');
        
INSERT INTO resourcers
        (company, password, about, avatar_Url, phone_Number, email, website, address)
 VALUES
        ('GreenIsFuture', 'green', 'Company that sells only 100% organic cotton', 'https://www.svgrepo.com/show/51589/girl.svg', '(000)000-0002', 'greenIsFuture@pursuit.org', 'greenIsFuture.com', 'USA'),

        ('RoyalApparel', 'apparel', 'Organic Clothing Manufaturers in the U.S.A', 'https://pbs.twimg.com/profile_images/900081763543678976/0u16IRag_400x400.jpg', '(000)-000-0004', 'sales@royalapparel.com', 'https://www.royalapparel.net//cgi-bin/liveb2b//wam_tmpl/login.p?site=B2B&layout=Baseb2b&page=login&loginLocation=/wam_tmpl/my_account.p%26page%3Dmy_account', 'USA' )


INSERT INTO materials
        (name, description, photo_url)
VALUES
        ('Organic Cotton', 'Organic cotton is the alternative to this harmful process and still creates a comfortable product', 'https://fashionunited.uk/images/201706/r/810/Cotton-nn1.jpg'
),
        ('Hemp', 'This specific type of cannabis plant, does not exhaust the soil and does not require pesticides', 'https://images.unsplash.com/photo-1519181236443-b175d4c3ca1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80' ),

        ('Organic Linen', 'Natural Fabric that is made from flax can be grown without felitzer.', 'https://fabric-media.moodfabrics.com/media/catalog/product/cache/1/image/800x800/9df78eab33525d08d6e5fb8d27136e95/3/1/311043/5.6oz-natural-organic-linen-woven-311043-11.jpg?1558666306'); 




        