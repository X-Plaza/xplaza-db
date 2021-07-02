DROP SCHEMA public CASCADE;
CREATE SCHEMA public;


CREATE TABLE "customers" (
  "customer_id" BIGSERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "house_no" varchar,
  "street_name" varchar,
  "postcode" int,
  "area" varchar,
  "city" varchar,
  "country" varchar,
  "mobile_no" varchar,
  "email" varchar,
  "date_of_birth" timestamp
);

CREATE TABLE "temp_orders" (
  "temp_order_id" BIGSERIAL PRIMARY KEY,
  "total_price" float,
  "discount_amount" float,
  "grand_total_price" float,
  "delivery_address" varchar,
  "fk_customer_id" int,
  "fk_shop_id" int,
  "fk_delivery_schedule_id" int,
  "fk_delivery_cost_id" int,
  "fk_payment_type_id" int,
  "fk_status_id" int,
  "fk_delivery_id" int,
  "fk_coupon_id" int
);

CREATE TABLE "temp_order_items" (
  "temp_order_item_id" BIGSERIAL PRIMARY KEY,
  "fk_temp_order_id" int,
  "fk_product_id" int,
  "order_item_name" varchar,
  "order_item_price" float,
  "fk_currency_id" int,
  "order_item_quantity" int
);

CREATE TABLE "orders" (
  "order_id" BIGSERIAL PRIMARY KEY,
  "total_price" float,
  "discount_amount" float,
  "grand_total_price" float,
  "delivery_address" varchar,
  "fk_customer_id" int,
  "fk_shop_id" int,
  "fk_delivery_schedule_id" int,
  "fk_delivery_cost_id" int,
  "fk_payment_type_id" int,
  "fk_status_id" int,
  "fk_delivery_id" int,
  "fk_coupon_id" int
);

CREATE TABLE "order_items" (
  "order_item_id" BIGSERIAL PRIMARY KEY,
  "fk_order_id" int,
  "fk_product_id" int,
  "order_item_name" varchar,
  "order_item_price" float,
  "fk_currency_id" int,
  "order_item_quantity" int
);

CREATE TABLE "payment_types" (
  "payment_type_id" BIGSERIAL PRIMARY KEY,
  "payment_type_name" varchar
);

CREATE TABLE "transactions" (
  "transaction_id" BIGSERIAL PRIMARY KEY,
  "transcation_amount" float,
  "fk_currency_id" int,
  "fk_order_id" int,
  "fk_payment_type_id" int,
  "fk_status_id" int
);

CREATE TABLE "shopping_temp_carts" (
  "shopping_temp_cart_id" BIGSERIAL PRIMARY KEY,
  "fk_product_id" int,
  "fk_customer_id" int,
  "item_quantity" int
);

CREATE TABLE "status_catalogues" (
  "status_id" BIGSERIAL PRIMARY KEY,
  "status_name" varchar,
  "status_desc" varchar
);

CREATE TABLE "deliveries" (
  "delivery_id" BIGSERIAL PRIMARY KEY,
  "fk_order_id" int,
  "person_name" int,
  "contact_no" varchar,
  "alloted_time" timestamp,
  "recieved_time" timestamp
);

CREATE TABLE "shippings" (
  "shipping_id" BIGSERIAL PRIMARY KEY
);

CREATE TABLE "cancellations" (
  "cancellation_id" BIGSERIAL PRIMARY KEY
);

CREATE TABLE "brands" (
  "brand_id" BIGSERIAL PRIMARY KEY,
  "brand_name" varchar,
  "brand_description" varchar
);

CREATE TABLE "categories" (
  "category_id" BIGSERIAL PRIMARY KEY,
  "category_name" varchar,
  "category_description" varchar,
  "parent_category" int
);

CREATE TABLE "products" (
  "product_id" BIGSERIAL PRIMARY KEY,
  "product_name" text,
  "product_description" text,
  "fk_brand_id" int,
  "fk_category_id" int,
  "fk_product_var_type_id" int,
  "product_var_type_option" int,
  "product_buying_price" float,
  "product_selling_price" float,
  "fk_currency_id" int
);

CREATE TABLE "product_discounts" (
  "product_discount_id" BIGSERIAL PRIMARY KEY,
  "fk_product_id" int,
  "fk_discount_type_id" int,
  "discount_amount" float,
  "fk_currency_id" int,
  "discount_start_date" timestamp,
  "discount_end_date" timestamp
);

CREATE TABLE "discount_types" (
  "discount_type_id" BIGSERIAL PRIMARY KEY,
  "discount_type_name" varchar
);

CREATE TABLE "product_variation_types" (
  "product_var_type_id" BIGSERIAL PRIMARY KEY,
  "var_type_name" varchar,
  "var_type_description" varchar
);

CREATE TABLE "product_variation_type_options" (
  "product_var_type_option_id" BIGSERIAL PRIMARY KEY
);

CREATE TABLE "product_images" (
  "product_images_id" BIGSERIAL PRIMARY KEY,
  "fk_product_id" int,
  "product_image_name" varchar,
  "product_image_path" varchar
);

CREATE TABLE "shops" (
  "shop_id" BIGSERIAL PRIMARY KEY,
  "shop_name" varchar,
  "shop_description" varchar,
  "shop_address" varchar,
  "fk_location_id" int
);

CREATE TABLE "locations" (
  "location_id" BIGSERIAL PRIMARY KEY,
  "location_name" varchar,
  "fk_city_id" int
);

CREATE TABLE "cities" (
  "city_id" BIGSERIAL PRIMARY KEY,
  "city_name" varchar,
  "fk_state_id" int
);

CREATE TABLE "states" (
  "state_id" BIGSERIAL PRIMARY KEY,
  "state_name" varchar,
  "fk_country_id" int
);

CREATE SEQUENCE countries_country_id_seq;

CREATE TABLE IF NOT EXISTS countries (
  country_id int NOT NULL DEFAULT NEXTVAL ('countries_country_id_seq'),
  iso char(2) NOT NULL,
  country_name varchar(80) NOT NULL,
  nicename varchar(80) NOT NULL,
  iso3 char(3) DEFAULT NULL,
  numcode smallint DEFAULT NULL,
  phonecode int NOT NULL,
  PRIMARY KEY (country_id)
);

CREATE TABLE "currencies" (
  "currency_id" BIGSERIAL PRIMARY KEY,
  "currency_name" varchar,
  "currency_sign" varchar
);

CREATE TABLE "delivery_schedules" (
  "delivery_schedule_id" BIGSERIAL PRIMARY KEY,
  "delivery_schedule_slab" int,
  "delivery_schedule_start" timestamp,
  "delivery_schedule_end" timestamp,
  "fk_day_type_id" int
);

CREATE TABLE "day_types" (
  "day_type_id" BIGSERIAL PRIMARY KEY,
  "day_type_name" int
);

CREATE TABLE "coupons" (
  "coupon_id" BIGSERIAL PRIMARY KEY,
  "coupon_amount" float,
  "fk_currency_id" int,
  "coupon_start_date" timestamp,
  "coupon_end_date" timestamp
);

CREATE TABLE "delivery_costs" (
  "delivery_cost_id" BIGSERIAL PRIMARY KEY,
  "delivery_slab_start_range" int,
  "delivery_slab_end_range" int,
  "delivery_cost" float,
  "fk_currency_id" int
);

CREATE TABLE "users" (
  "user_id" BIGSERIAL PRIMARY KEY,
  "fk_customer_id" int,
  "user_name" varchar,
  "user_email" varchar,
  "password" varchar,
  "salt" varchar
);

CREATE TABLE "admin_users" (
  "admin_user_id" BIGSERIAL PRIMARY KEY,
  "user_name" varchar,
  "password" varchar,
  "salt" varchar
);

CREATE TABLE "permissions" (
  "permission_id" BIGSERIAL PRIMARY KEY,
  "permission_name" text,
  "permission_description" text
);

CREATE TABLE "roles" (
  "role_id" BIGSERIAL PRIMARY KEY,
  "role_name" text,
  "role_description" text,
  "fk_permission_id" int
);

CREATE TABLE "user_role_links" (
  "admin_user_id" BIGSERIAL,
  "role_id" BIGSERIAL,
  PRIMARY KEY ("admin_user_id", "role_id")
);

CREATE TABLE "menus" (
  "menu_id" BIGSERIAL PRIMARY KEY,
  "menu_name" text,
  "menu_description" text
);

CREATE TABLE "modules" (
  "module_id" BIGSERIAL PRIMARY KEY,
  "module_name" text,
  "module_description" text
);

CREATE TABLE "menu_module_link" (
  "menu_id" BIGSERIAL,
  "module_id" BIGSERIAL,
  PRIMARY KEY ("menu_id", "module_id")
);

ALTER TABLE "temp_orders" ADD FOREIGN KEY ("fk_customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "temp_orders" ADD FOREIGN KEY ("fk_status_id") REFERENCES "status_catalogues" ("status_id");

ALTER TABLE "temp_orders" ADD FOREIGN KEY ("fk_shop_id") REFERENCES "shops" ("shop_id");

ALTER TABLE "temp_orders" ADD FOREIGN KEY ("fk_delivery_schedule_id") REFERENCES "delivery_schedules" ("delivery_schedule_id");

ALTER TABLE "temp_orders" ADD FOREIGN KEY ("fk_delivery_cost_id") REFERENCES "delivery_costs" ("delivery_cost_id");

ALTER TABLE "temp_orders" ADD FOREIGN KEY ("fk_payment_type_id") REFERENCES "payment_types" ("payment_type_id");

ALTER TABLE "temp_orders" ADD FOREIGN KEY ("fk_delivery_id") REFERENCES "deliveries" ("delivery_id");

ALTER TABLE "temp_orders" ADD FOREIGN KEY ("fk_coupon_id") REFERENCES "coupons" ("coupon_id");

ALTER TABLE "temp_order_items" ADD FOREIGN KEY ("fk_temp_order_id") REFERENCES "temp_orders" ("temp_order_id");

ALTER TABLE "temp_order_items" ADD FOREIGN KEY ("fk_product_id") REFERENCES "products" ("product_id");

ALTER TABLE "temp_order_items" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("fk_customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("fk_status_id") REFERENCES "status_catalogues" ("status_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("fk_shop_id") REFERENCES "shops" ("shop_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("fk_delivery_schedule_id") REFERENCES "delivery_schedules" ("delivery_schedule_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("fk_delivery_cost_id") REFERENCES "delivery_costs" ("delivery_cost_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("fk_payment_type_id") REFERENCES "payment_types" ("payment_type_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("fk_delivery_id") REFERENCES "deliveries" ("delivery_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("fk_coupon_id") REFERENCES "coupons" ("coupon_id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("fk_order_id") REFERENCES "orders" ("order_id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("fk_product_id") REFERENCES "products" ("product_id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("fk_payment_type_id") REFERENCES "payment_types" ("payment_type_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("fk_order_id") REFERENCES "orders" ("order_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("fk_status_id") REFERENCES "status_catalogues" ("status_id");

ALTER TABLE "shopping_temp_carts" ADD FOREIGN KEY ("fk_product_id") REFERENCES "products" ("product_id");

ALTER TABLE "shopping_temp_carts" ADD FOREIGN KEY ("fk_customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "deliveries" ADD FOREIGN KEY ("fk_order_id") REFERENCES "orders" ("order_id");

ALTER TABLE "products" ADD FOREIGN KEY ("fk_brand_id") REFERENCES "brands" ("brand_id");

ALTER TABLE "products" ADD FOREIGN KEY ("fk_category_id") REFERENCES "categories" ("category_id");

ALTER TABLE "products" ADD FOREIGN KEY ("fk_product_var_type_id") REFERENCES "product_variation_types" ("product_var_type_id");

ALTER TABLE "products" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "product_discounts" ADD FOREIGN KEY ("fk_discount_type_id") REFERENCES "discount_types" ("discount_type_id");

ALTER TABLE "product_discounts" ADD FOREIGN KEY ("fk_product_id") REFERENCES "products" ("product_id");

ALTER TABLE "product_discounts" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "product_images" ADD FOREIGN KEY ("fk_product_id") REFERENCES "products" ("product_id");

ALTER TABLE "shops" ADD FOREIGN KEY ("fk_location_id") REFERENCES "locations" ("location_id");

ALTER TABLE "locations" ADD FOREIGN KEY ("fk_city_id") REFERENCES "cities" ("city_id");

ALTER TABLE "delivery_schedules" ADD FOREIGN KEY ("fk_day_type_id") REFERENCES "day_types" ("day_type_id");

ALTER TABLE "delivery_costs" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "coupons" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "users" ADD FOREIGN KEY ("fk_customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "roles" ADD FOREIGN KEY ("fk_permission_id") REFERENCES "permissions" ("permission_id");

ALTER TABLE "menu_module_link" ADD FOREIGN KEY ("menu_id") REFERENCES "menus" ("menu_id");

ALTER TABLE "menu_module_link" ADD FOREIGN KEY ("module_id") REFERENCES "modules" ("module_id");

ALTER TABLE "user_role_links" ADD FOREIGN KEY ("admin_user_id") REFERENCES "admin_users" ("admin_user_id");

ALTER TABLE "user_role_links" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");

DROP TABLE user_role_links ;

ALTER TABLE roles DROP CONSTRAINT roles_fk_permission_id_fkey;

DROP TABLE permissions  ;

ALTER TABLE roles RENAME COLUMN fk_permission_id TO fk_module_id;

ALTER TABLE "roles" ADD FOREIGN KEY ("fk_module_id") REFERENCES "modules" ("module_id");

ALTER TABLE admin_users ADD fk_role_id int NOT NULL DEFAULT 1;

INSERT INTO modules
(module_name, module_description)
VALUES('Master Admin Module', 'This module contains all the things a master admin can do');

INSERT INTO modules
(module_name, module_description)
VALUES('Shop Admin Module', 'This module contains all the things a shop admin can do');

INSERT INTO roles
(role_name, role_description, fk_module_id)
VALUES('Master Admin', 'Master Admin', 1);

ALTER TABLE "admin_users" ADD FOREIGN KEY ("fk_role_id") REFERENCES "roles" ("role_id");

INSERT INTO roles
(role_name, role_description, fk_module_id)
VALUES('Shop Admin', 'Shop Owner', 2);

ALTER TABLE admin_users ADD fk_shop_id int;

ALTER TABLE "admin_users" ADD FOREIGN KEY ("fk_shop_id") REFERENCES "shops" ("shop_id");

ALTER TABLE products ADD fk_shop_id int NOT NULL;

ALTER TABLE "products" ADD FOREIGN KEY ("fk_shop_id") REFERENCES "shops" ("shop_id");

ALTER TABLE "cities" ADD FOREIGN KEY ("fk_state_id") REFERENCES "states" ("state_id");

ALTER TABLE "states" ADD FOREIGN KEY ("fk_country_id") REFERENCES "countries" ("country_id");

ALTER TABLE products ADD quantity int NOT NULL DEFAULT 1;

ALTER TABLE menu_module_link ADD "full" bool NOT NULL DEFAULT false;

ALTER TABLE menu_module_link ADD "view" bool DEFAULT false;

ALTER TABLE menu_module_link ADD "add" bool DEFAULT false;

ALTER TABLE menu_module_link ADD "update" bool DEFAULT false;

ALTER TABLE menu_module_link ADD "delete" bool DEFAULT false;

CREATE OR REPLACE VIEW login AS
select a.admin_user_id, a.user_name, r.role_id, r.role_name, false as authentication 
from admin_users a
left join roles r on a.fk_role_id = r.role_id;

CREATE OR REPLACE VIEW permissions AS
select row_number() OVER() AS id, au.admin_user_id, m2.menu_name, mml.full, mml.view, mml.add, mml.update, mml.delete 
from admin_users au left join roles r on au.fk_role_id = r.role_id 
left join modules m on r.fk_module_id = m.module_id 
left join menu_module_link mml on m.module_id = mml.module_id 
left join menus m2 on mml.menu_id = m2.menu_id;

ALTER TABLE coupons ADD coupon_code varchar NOT NULL;

ALTER TABLE orders ADD received_time timestamp(0) NULL;

ALTER TABLE order_items ADD order_item_unit_price float8 NULL;

ALTER TABLE order_items ADD order_item_category varchar NULL;

ALTER TABLE order_items ADD order_item_quantity_type varchar NULL;

ALTER TABLE order_items ADD order_item_image varchar NULL;

ALTER TABLE order_items RENAME COLUMN order_item_price TO order_item_total_price;

ALTER TABLE coupons ADD max_coupon_amount float8 NULL;

ALTER TABLE coupons ADD fk_discount_type_id int4 NULL;

ALTER TABLE "coupons" ADD FOREIGN KEY ("fk_discount_type_id") REFERENCES "discount_types" ("discount_type_id");

CREATE TABLE "admin_user_shop_link" (
  "admin_user_id" BIGSERIAL,
  "shop_id" BIGSERIAL,
  PRIMARY KEY ("admin_user_id", "shop_id")
);

ALTER TABLE "admin_user_shop_link" ADD FOREIGN KEY ("admin_user_id") REFERENCES "admin_users" ("admin_user_id");

ALTER TABLE "admin_user_shop_link" ADD FOREIGN KEY ("shop_id") REFERENCES "shops" ("shop_id");

ALTER TABLE admin_users DROP COLUMN fk_shop_id;

CREATE OR REPLACE VIEW Admin_User_Shop_List AS
select row_number() OVER() AS id, ausl.*, s.shop_name 
from admin_user_shop_link ausl left join shops s on s.shop_id = ausl.shop_id;

ALTER TABLE coupons ALTER COLUMN is_active SET DEFAULT false;

##Order Details:
select o.order_id, o.total_price, o.discount_amount, o.grand_total_price, o.delivery_address, concat(c.first_name ,' ',c.last_name) as customer_name,
c.mobile_no, o.received_time, o.fk_shop_id, s.shop_name, o.fk_status_id, st.status_name,
concat(ds.delivery_schedule_start,'-',ds.delivery_schedule_end) as allotted_time,
o.fk_delivery_cost_id, dc.delivery_cost,
o.fk_payment_type_id, pt.payment_type_name, o.fk_delivery_id, d.person_name, d.contact_no,
o.fk_coupon_id, cou.coupon_code, cou.coupon_amount,
oi.order_item_name, oi.order_item_category, oi.order_item_quantity, oi.order_item_quantity_type, oi.order_item_unit_price,
oi.order_item_total_price, oi.order_item_image
from orders o
left join shops s on o.fk_shop_id = s.shop_id
left join customers c on o.fk_customer_id = c.customer_id
left join delivery_schedules ds on o.fk_delivery_schedule_id = ds.delivery_schedule_id
left join status_catalogues st on o.fk_status_id = st.status_id
left join order_items oi on o.order_id = oi.fk_order_id 
left join delivery_costs dc on dc.delivery_cost_id = o.fk_delivery_cost_id 
left join payment_types pt on o.fk_payment_type_id = pt.payment_type_id 
left join deliveries d on o.fk_delivery_id = d.delivery_id 
left join coupons cou on cou.coupon_id = o.fk_coupon_id 
where o.order_id = 1

##Order List:
select o.order_id, o.total_price, o.discount_amount, o.grand_total_price, o.delivery_address, concat(c.first_name,' ',c.last_name) as customer_name, 
c.mobile_no, o.received_time, o.fk_shop_id, s.shop_name, o.fk_status_id, st.status_name, 
concat(ds.delivery_schedule_start, '-' , ds.delivery_schedule_end) as allotted_time 
from orders o 
left join shops s on o.fk_shop_id = s.shop_id 
left join customers c on o.fk_customer_id = c.customer_id 
left join delivery_schedules ds on o.fk_delivery_schedule_id = ds.delivery_schedule_id 
left join status_catalogues st on o.fk_status_id = st.status_id

