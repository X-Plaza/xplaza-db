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

DROP TABLE permissions;

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
select au.admin_user_id, au.user_name, au.full_name, r.role_id, r.role_name, false as authentication 
from admin_users au
left join roles r on au.fk_role_id = r.role_id;

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

ALTER TABLE coupons ADD is_active bool NOT NULL DEFAULT true;

ALTER TABLE delivery_schedules ALTER COLUMN fk_day_type_id TYPE int4 USING fk_day_type_id::int4;
ALTER TABLE delivery_schedules ALTER COLUMN delivery_schedule_start TYPE time USING delivery_schedule_start::time;
ALTER TABLE delivery_schedules ALTER COLUMN delivery_schedule_end TYPE time USING delivery_schedule_end::time;
ALTER TABLE delivery_schedules RENAME COLUMN fk_day_type_id TO fk_day_id;
ALTER TABLE day_types RENAME TO day_names;
ALTER TABLE day_names ALTER COLUMN day_type_name TYPE varchar USING day_type_name::varchar;
ALTER TABLE day_names RENAME COLUMN day_type_name TO day_name;
ALTER TABLE day_names RENAME COLUMN day_type_id TO day_id;
ALTER TABLE delivery_schedules DROP COLUMN delivery_schedule_slab;

ALTER TABLE orders DROP CONSTRAINT orders_fk_delivery_id_fkey;
ALTER TABLE orders DROP COLUMN fk_delivery_id;
ALTER TABLE deliveries ALTER COLUMN person_name TYPE varchar USING person_name::varchar;
ALTER TABLE orders ADD date_to_deliver date NULL;
ALTER TABLE products RENAME COLUMN product_var_type_option TO product_var_type_value;

ALTER TABLE coupons ALTER COLUMN is_active SET DEFAULT false;

ALTER TABLE coupons DROP COLUMN is_active;

ALTER TABLE coupons ADD "is_active" bool DEFAULT false;

-- top_customer view

CREATE OR REPLACE VIEW top_customer
AS SELECT temp.id,
    temp.customer_id,
    temp.customer_name,
    temp.total_order_amount,
    temp.shop_id
   FROM ( SELECT row_number() OVER () AS id,
            c.customer_id,
            concat(c.first_name, ' ', c.last_name) AS customer_name,
            COALESCE(sum(o.grand_total_price), 0::double precision) AS total_order_amount,
            o.fk_shop_id AS shop_id
           FROM customers c
             LEFT JOIN orders o ON o.fk_customer_id = c.customer_id
			 where extract (month FROM o.received_time) = extract (month FROM CURRENT_DATE)
          GROUP BY c.customer_id, o.fk_shop_id
          ORDER BY (COALESCE(sum(o.grand_total_price), 0::double precision)) DESC) temp
  WHERE temp.shop_id IS NOT NULL;

-- top_product view

CREATE OR REPLACE VIEW top_product
AS SELECT row_number() OVER () AS id,
    p.product_id,
    p.product_name,
    COALESCE(sum(oi.order_item_quantity), 0::bigint) AS monthly_sold_unit,
    o.fk_shop_id AS shop_id
   FROM products p
     LEFT JOIN order_items oi ON oi.fk_product_id = p.product_id
     LEFT JOIN orders o ON oi.fk_order_id = o.order_id
	 where extract (month FROM o.received_time) = extract (month FROM CURRENT_DATE)
  GROUP BY p.product_id, o.fk_shop_id
  ORDER BY (COALESCE(sum(oi.order_item_quantity), 0::bigint)) DESC;

--revenue view

CREATE OR REPLACE VIEW revenue
AS select total_expense,
total_income,
total_income - total_expense AS total_revenue,
shop_id
FROM (SELECT sum(p.product_buying_price * (p.quantity + tp.monthly_sold_unit)::double precision) AS total_expense,
temp_income.total_income, s.shop_id
FROM (SELECT sum(o.grand_total_price) AS total_income, o.fk_shop_id FROM orders o GROUP BY o.fk_shop_id) temp_income
LEFT JOIN shops s ON temp_income.fk_shop_id = s.shop_id
LEFT JOIN products p ON s.shop_id = p.fk_shop_id
LEFT JOIN top_product tp ON tp.product_id = p.product_id
GROUP BY s.shop_id, temp_income.total_income) temp_revenue;

--product to stock view
CREATE OR REPLACE VIEW product_to_stock
AS SELECT row_number() OVER () AS id,
    p.product_id,
    p.product_name,
    p.quantity AS remaining_unit,
    p.fk_shop_id AS shop_id
   FROM products p
  WHERE p.quantity <= 5
  ORDER BY p.quantity;

ALTER TABLE admin_users ADD full_name varchar NULL;

ALTER TABLE shops ADD shop_description varchar NULL;

CREATE TABLE "coupon_shop_link" (
  "shop_id" BIGSERIAL,
  "coupon_id" BIGSERIAL,
  PRIMARY KEY ("shop_id", "coupon_id")
);

ALTER TABLE "coupon_shop_link" ADD FOREIGN KEY ("shop_id") REFERENCES "shops" ("shop_id");
ALTER TABLE "coupon_shop_link" ADD FOREIGN KEY ("coupon_id") REFERENCES "coupons" ("coupon_id");

ALTER TABLE orders ADD fk_currency_id int NULL;
ALTER TABLE "orders" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");
ALTER TABLE orders ADD last_updated_by int NULL;
ALTER TABLE orders ADD last_updated_at timestamp(0) NULL;
ALTER TABLE orders ADD additional_info text NULL;
ALTER TABLE orders ADD remarks text NULL;


ALTER TABLE order_items ADD last_updated_by int NULL;
ALTER TABLE order_items ADD last_updated_at timestamp(0) NULL;

ALTER TABLE products ADD created_by int NULL;
ALTER TABLE products ADD created_at timestamp(0) NULL;
ALTER TABLE products ADD last_updated_by int NULL;
ALTER TABLE products ADD last_updated_at timestamp(0) NULL;

ALTER TABLE product_images ADD created_by int NULL;
ALTER TABLE product_images ADD created_at timestamp(0) NULL;
ALTER TABLE product_images ADD last_updated_by int NULL;
ALTER TABLE product_images ADD last_updated_at timestamp(0) NULL;

CREATE TABLE bin_orders (
	order_id bigserial NOT NULL,
	total_price float8 NULL,
	discount_amount float8 NULL,
	grand_total_price float8 NULL,
	delivery_address varchar NULL,
	fk_customer_id int4 NULL,
	fk_shop_id int4 NULL,
	fk_delivery_schedule_id int4 NULL,
	fk_delivery_cost_id int4 NULL,
	fk_payment_type_id int4 NULL,
	fk_status_id int4 NULL,
	fk_coupon_id int4 NULL,
	received_time timestamp(0),
	date_to_deliver date NULL,
	last_updated_by int NULL,
	last_updated_at timestamp(0),
	CONSTRAINT bin_orders_pkey PRIMARY KEY (order_id)
);

-- bin_orders foreign keys
ALTER TABLE bin_orders ADD CONSTRAINT bin_orders_fk_coupon_id_fkey FOREIGN KEY (fk_coupon_id) REFERENCES coupons(coupon_id);
ALTER TABLE bin_orders ADD CONSTRAINT bin_orders_fk_customer_id_fkey FOREIGN KEY (fk_customer_id) REFERENCES customers(customer_id);
ALTER TABLE bin_orders ADD CONSTRAINT bin_orders_fk_delivery_cost_id_fkey FOREIGN KEY (fk_delivery_cost_id) REFERENCES delivery_costs(delivery_cost_id);
ALTER TABLE bin_orders ADD CONSTRAINT bin_orders_fk_delivery_schedule_id_fkey FOREIGN KEY (fk_delivery_schedule_id) REFERENCES delivery_schedules(delivery_schedule_id);
ALTER TABLE bin_orders ADD CONSTRAINT bin_orders_fk_payment_type_id_fkey FOREIGN KEY (fk_payment_type_id) REFERENCES payment_types(payment_type_id);
ALTER TABLE bin_orders ADD CONSTRAINT bin_orders_fk_shop_id_fkey FOREIGN KEY (fk_shop_id) REFERENCES shops(shop_id);
ALTER TABLE bin_orders ADD CONSTRAINT bin_orders_fk_status_id_fkey FOREIGN KEY (fk_status_id) REFERENCES status_catalogues(status_id);
ALTER TABLE bin_orders ADD fk_currency_id int NULL;
ALTER TABLE "bin_orders" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");
ALTER TABLE bin_orders ADD additional_info text NULL;
ALTER TABLE bin_orders ADD remarks text NULL;

CREATE TABLE bin_order_items (
	order_item_id bigserial NOT NULL,
	fk_order_id int4 NULL,
	fk_product_id int4 NULL,
	order_item_name varchar NULL,
	order_item_total_price float8 NULL,
	fk_currency_id int4 NULL,
	order_item_quantity int4 NULL,
	order_item_unit_price float8 NULL,
	order_item_category varchar NULL,
	order_item_quantity_type varchar NULL,
	order_item_image varchar NULL,
	last_updated_by int4 NULL,
	last_updated_at timestamp(0) NULL,
	CONSTRAINT bin_order_items_pkey PRIMARY KEY (order_item_id)
);

-- bin_order_items foreign keys
ALTER TABLE bin_order_items ADD CONSTRAINT bin_order_items_fk_currency_id_fkey FOREIGN KEY (fk_currency_id) REFERENCES currencies(currency_id);
ALTER TABLE bin_order_items ADD CONSTRAINT bin_order_items_fk_order_id_fkey FOREIGN KEY (fk_order_id) REFERENCES bin_orders(order_id);
ALTER TABLE bin_order_items ADD CONSTRAINT bin_order_items_fk_product_id_fkey FOREIGN KEY (fk_product_id) REFERENCES products(product_id);
ALTER TABLE bin_order_items DROP CONSTRAINT bin_order_items_fk_order_id_fkey;


CREATE TABLE bin_products (
	product_id bigserial NOT NULL,
	product_name text NULL,
	product_description text NULL,
	fk_brand_id int4 NULL,
	fk_category_id int4 NULL,
	fk_product_var_type_id int4 NULL,
	product_var_type_value int4 NULL,
	product_buying_price float8 NULL,
	product_selling_price float8 NULL,
	fk_currency_id int4 NULL,
	fk_shop_id int4 NOT NULL,
	quantity int4 NOT NULL DEFAULT 1,
	created_by int4 NULL,
	created_at timestamp(0) NULL,
	last_updated_by int4 NULL,
	last_updated_at timestamp(0) NULL,
	CONSTRAINT bin_products_pkey PRIMARY KEY (product_id)
);

-- products foreign keys
ALTER TABLE bin_products ADD CONSTRAINT bin_products_fk_brand_id_fkey FOREIGN KEY (fk_brand_id) REFERENCES brands(brand_id);
ALTER TABLE bin_products ADD CONSTRAINT bin_products_fk_category_id_fkey FOREIGN KEY (fk_category_id) REFERENCES categories(category_id);
ALTER TABLE bin_products ADD CONSTRAINT bin_products_fk_currency_id_fkey FOREIGN KEY (fk_currency_id) REFERENCES currencies(currency_id);
ALTER TABLE bin_products ADD CONSTRAINT bin_products_fk_product_var_type_id_fkey FOREIGN KEY (fk_product_var_type_id) REFERENCES product_variation_types(product_var_type_id);
ALTER TABLE bin_products ADD CONSTRAINT bin_products_fk_shop_id_fkey FOREIGN KEY (fk_shop_id) REFERENCES shops(shop_id);

CREATE TABLE bin_product_images (
	product_image_id int8 NOT NULL DEFAULT nextval('product_images_product_images_id_seq'::regclass),
	fk_product_id int4 NULL,
	product_image_name varchar NULL,
	product_image_path varchar NULL,
	created_by int4 NULL,
	created_at timestamp(0) NULL,
	last_updated_by int4 NULL,
	last_updated_at timestamp(0) NULL,
	CONSTRAINT bin_product_images_pkey PRIMARY KEY (product_image_id)
);

-- product_images foreign keys
ALTER TABLE bin_product_images ADD CONSTRAINT bin_product_images_fk_product_id_fkey FOREIGN KEY (fk_product_id) REFERENCES bin_products(product_id);
ALTER TABLE bin_product_images DROP CONSTRAINT bin_product_images_fk_product_id_fkey;
   
CREATE FUNCTION order_stamp() RETURNS trigger AS $order_stamp$
    begin
	    IF (TG_OP = 'INSERT') THEN
	       -- Remember when we recieved the order
           NEW.received_time := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'UPDATE') THEN
           -- Remember when changed the order
           NEW.last_updated_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'DELETE') then
            -- Insert into bin table
            INSERT INTO bin_orders select OLD.*;
            RETURN OLD;
        END IF;
    END;
$order_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER order_stamp
BEFORE INSERT OR UPDATE OR DELETE ON orders
    FOR EACH ROW EXECUTE PROCEDURE order_stamp();


CREATE FUNCTION order_item_stamp() RETURNS trigger AS $order_item_stamp$
    begin
	    IF (TG_OP = 'UPDATE') THEN
           -- Remember when changed the order
           NEW.last_updated_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'DELETE') then
            -- Insert into bin table
            INSERT INTO bin_order_items select OLD.*;
            RETURN OLD;
        END IF;
    END;
$order_item_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER order_item_stamp
BEFORE UPDATE OR DELETE ON order_items
    FOR EACH ROW EXECUTE PROCEDURE order_item_stamp();


CREATE FUNCTION product_stamp() RETURNS trigger AS $product_stamp$
    begin
	    IF (TG_OP = 'INSERT') THEN
	       -- Remember when we recieved the order
           NEW.created_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'UPDATE') THEN
           -- Remember when changed the order
           NEW.last_updated_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'DELETE') then
            -- Insert into bin table
            INSERT INTO bin_products select OLD.*;
            RETURN OLD;
        END IF;
    END;
$product_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER product_stamp
BEFORE INSERT OR UPDATE OR DELETE ON products
    FOR EACH ROW EXECUTE PROCEDURE product_stamp();
	
	
CREATE FUNCTION product_image_stamp() RETURNS trigger AS $product_image_stamp$
    begin
	    IF (TG_OP = 'INSERT') THEN
	       -- Remember when we recieved the order
           NEW.created_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'UPDATE') THEN
           -- Remember when changed the order
           NEW.last_updated_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'DELETE') then
            -- Insert into bin table
            INSERT INTO bin_product_images select OLD.*;
            RETURN OLD;
        END IF;
    END;
$product_image_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER product_image_stamp
BEFORE INSERT OR UPDATE OR DELETE ON product_images
    FOR EACH ROW EXECUTE PROCEDURE product_image_stamp();
	
	
ALTER TABLE coupons ADD min_shopping_amount float8 NULL;

CREATE OR REPLACE VIEW coupon_shop_list
AS SELECT row_number() OVER () AS id,
    csl.*,
    s.shop_name 
   FROM coupon_shop_link csl
     LEFT JOIN shops s ON s.shop_id = csl.shop_id;
	 
	 

ALTER TABLE admin_users ADD is_confirmed bool NULL;

CREATE TABLE confirmation_tokens (
	token_id bigserial NOT NULL,
	confirmation_token text NOT NULL,
	user_email text NOT NULL,
	created_date timestamp(0) NULL,
	CONSTRAINT confirmation_tokens_pkey PRIMARY KEY (token_id)
);

ALTER TABLE admin_users RENAME COLUMN is_confirmed TO confirmation_code;
ALTER TABLE admin_users ALTER COLUMN confirmation_code TYPE text USING confirmation_code::text;

ALTER TABLE order_items DROP CONSTRAINT order_items_fk_product_id_fkey;
ALTER TABLE order_items RENAME COLUMN fk_product_id TO product_id;

ALTER TABLE bin_order_items DROP CONSTRAINT bin_order_items_fk_product_id_fkey;
ALTER TABLE bin_order_items RENAME COLUMN fk_product_id TO product_id;

ALTER TABLE order_items ADD order_item_var_type_id int NULL;
ALTER TABLE order_items ADD order_item_var_type_value int NULL;

ALTER TABLE bin_order_items ADD order_item_var_type_id int NULL;
ALTER TABLE bin_order_items ADD order_item_var_type_value int NULL;

ALTER TABLE order_items RENAME COLUMN order_item_var_type_id TO order_item_var_type_name;
ALTER TABLE bin_order_items RENAME COLUMN order_item_var_type_id TO order_item_var_type_name;

ALTER TABLE order_items ALTER COLUMN order_item_var_type_name TYPE text USING order_item_var_type_name::text;
ALTER TABLE bin_order_items ALTER COLUMN order_item_var_type_name TYPE text USING order_item_var_type_name::text;


CREATE OR REPLACE VIEW order_details
AS SELECT row_number() OVER () AS id,
o.order_id, o.total_price, o.discount_amount, o.grand_total_price, o.delivery_address, o.fk_customer_id, o.fk_shop_id, o.fk_delivery_schedule_id, 
o.fk_delivery_cost_id, o.fk_payment_type_id, o.fk_status_id, COALESCE(o.fk_coupon_id, 0) as fk_coupon_id, o.received_time, o.date_to_deliver, o.fk_currency_id, 
COALESCE(o.additional_info,'N/A') as additional_info, COALESCE(o.remarks,'N/A') as remarks, 
concat(c.first_name,' ',c.last_name) as customer_name, c.mobile_no, 
s.shop_name, 
st.status_name, 
concat(ds.delivery_schedule_start, '-' , ds.delivery_schedule_end) as allotted_time, dc.delivery_cost, 
pt.payment_type_name, 
d.delivery_id, d.person_name, d.contact_no, 
COALESCE(cou.coupon_code,'N/A') as coupon_code, COALESCE(cou.coupon_amount, 0) as coupon_amount, 
concat(oi.order_item_name, ' (', oi.order_item_var_type_value, oi.order_item_var_type_name, ')') as order_item_name, 
oi.order_item_category, oi.order_item_quantity, oi.order_item_quantity_type, oi.order_item_unit_price, 
oi.order_item_total_price, oi.order_item_image, oi.order_item_id, 
cur.currency_name, cur.currency_sign 
from orders o 
left join currencies cur on cur.currency_id = o.fk_currency_id 
left join order_items oi on o.order_id = oi.fk_order_id 
left join delivery_costs dc on dc.delivery_cost_id = o.fk_delivery_cost_id 
left join payment_types pt on o.fk_payment_type_id = pt.payment_type_id 
left join deliveries d on o.order_id = d.fk_order_id 
left join coupons cou on cou.coupon_id = o.fk_coupon_id 
left join shops s on o.fk_shop_id = s.shop_id 
left join customers c on o.fk_customer_id = c.customer_id 
left join delivery_schedules ds on o.fk_delivery_schedule_id = ds.delivery_schedule_id 
left join status_catalogues st on o.fk_status_id = st.status_id; 


ALTER TABLE delivery_costs ALTER COLUMN delivery_slab_start_range TYPE float8 USING delivery_slab_start_range::float8;
ALTER TABLE delivery_costs ALTER COLUMN delivery_slab_end_range TYPE float8 USING delivery_slab_end_range::float8;


CREATE OR REPLACE VIEW product_by_sold_unit
AS SELECT row_number() OVER () AS id,
    p.product_id,
    p.product_name,
    COALESCE(sum(oi.order_item_quantity), 0::bigint) AS total_sold_unit,
    p.fk_shop_id AS shop_id
   FROM products p
     LEFT JOIN order_items oi ON oi.product_id = p.product_id
     LEFT JOIN orders o ON oi.fk_order_id = o.order_id
  GROUP BY p.product_id, o.fk_shop_id
  ORDER BY total_sold_unit DESC;
  

CREATE OR REPLACE VIEW public.revenue
AS SELECT temp_revenue.total_expense,
    temp_revenue.total_income,
    temp_revenue.total_income - temp_revenue.total_expense AS total_revenue,
    temp_revenue.shop_id
   FROM ( SELECT sum (p.product_buying_price * (p.quantity + psu.total_sold_unit)::double precision) AS total_expense,
            temp_income.total_income,
            s.shop_id
           FROM ( SELECT sum (o.grand_total_price) AS total_income,
                    o.fk_shop_id
                   FROM orders o
                  GROUP BY o.fk_shop_id) temp_income
             LEFT JOIN shops s ON temp_income.fk_shop_id = s.shop_id
             LEFT JOIN products p ON s.shop_id = p.fk_shop_id
             LEFT JOIN product_by_sold_unit psu ON psu.product_id = p.product_id
          GROUP BY s.shop_id, temp_income.total_income) temp_revenue;
		  

ALTER TABLE public.orders RENAME COLUMN fk_customer_id TO customer_id;
ALTER TABLE public.orders ADD customer_name text NULL;
ALTER TABLE public.orders RENAME COLUMN fk_shop_id TO shop_id;
ALTER TABLE public.orders ADD shop_name text NULL;
ALTER TABLE public.orders DROP  CONSTRAINT orders_fk_delivery_schedule_id_fkey CASCADE;
ALTER TABLE public.orders DROP COLUMN fk_delivery_schedule_id CASCADE;
ALTER TABLE public.orders ADD delivery_schedule_start time with time zone NULL;
ALTER TABLE public.orders ADD delivery_schedule_end time with time zone NULL;
ALTER TABLE public.orders ADD delivery_cost float8 NULL;
ALTER TABLE public.orders ADD coupon_code text NULL;
ALTER TABLE public.orders ADD coupon_amount float8 NULL;
ALTER TABLE public.orders ADD mobile_no text NULL;
ALTER TABLE public.orders RENAME COLUMN fk_coupon_id TO coupon_id;
ALTER TABLE public.orders ALTER COLUMN received_time TYPE timestamp with time zone USING received_time::timestamp with time zone;
ALTER TABLE public.orders ALTER COLUMN last_updated_at TYPE timestamp with time zone USING last_updated_at::timestamp with time zone;
ALTER TABLE public.orders RENAME COLUMN fk_delivery_cost_id TO delivery_cost_id;

-- public.top_customer source

CREATE OR REPLACE VIEW public.top_customer
AS SELECT temp.id,
    temp.customer_id,
    temp.customer_name,
    temp.total_order_amount,
    temp.shop_id
   FROM ( SELECT row_number() OVER () AS id,
            o.customer_id,
            o.customer_name,
            COALESCE(sum(o.grand_total_price), 0::double precision) AS total_order_amount,
            o.shop_id AS shop_id
           FROM orders o
          WHERE date_part('month'::text, o.received_time) = date_part('month'::text, CURRENT_DATE)
          GROUP BY o.customer_id, o.customer_name, o.shop_id
          ORDER BY (COALESCE(sum(o.grand_total_price), 0::double precision)) DESC) temp
  WHERE temp.shop_id IS NOT NULL;

-- public.top_product source

CREATE OR REPLACE VIEW public.top_product
AS SELECT row_number() OVER () AS id,
    oi.product_id,
    oi.order_item_name as product_name,
    COALESCE(sum(oi.order_item_quantity), 0::bigint) AS monthly_sold_unit,
    o.shop_id AS shop_id
   FROM order_items oi
     LEFT JOIN orders o ON oi.fk_order_id = o.order_id
  WHERE date_part('month'::text, o.received_time) = date_part('month'::text, CURRENT_DATE)
  GROUP BY oi.product_id, product_name, o.shop_id 
  ORDER BY (COALESCE(sum(oi.order_item_quantity), 0::bigint)) DESC;
  
  
  -- public.order_details source

CREATE OR REPLACE VIEW public.order_details
AS SELECT row_number() OVER () AS id,
    o.order_id,
    o.total_price,
    o.discount_amount,
    o.grand_total_price,
    o.delivery_address,
    o.customer_id,
    o.shop_id,
    o.fk_payment_type_id,
    o.fk_status_id,
    COALESCE(o.coupon_id, 0) AS coupon_id,
    o.received_time,
    o.date_to_deliver,
    o.fk_currency_id,
    COALESCE(o.additional_info, 'N/A'::text) AS additional_info,
    COALESCE(o.remarks, 'N/A'::text) AS remarks,
    o.customer_name,
    o.mobile_no,
    o.shop_name,
    st.status_name,
    concat(o.delivery_schedule_start, '-', o.delivery_schedule_end) AS allotted_time,
    o.delivery_cost,
    pt.payment_type_name,
    d.delivery_id,
    d.person_name,
    d.contact_no,
    COALESCE(o.coupon_code, 'N/A'::character varying) AS coupon_code,
    COALESCE(o.coupon_amount, 0::double precision) AS coupon_amount,
    concat(oi.order_item_name, ' (', oi.order_item_var_type_value, oi.order_item_var_type_name, ')') AS order_item_name,
    oi.order_item_category,
    oi.order_item_quantity,
    oi.order_item_quantity_type,
    oi.order_item_unit_price,
    oi.order_item_total_price,
    oi.order_item_image,
    oi.order_item_id,
    cur.currency_name,
    cur.currency_sign
   FROM orders o
   	 LEFT JOIN order_items oi ON o.order_id = oi.fk_order_id
     LEFT JOIN currencies cur ON cur.currency_id = o.fk_currency_id
     LEFT JOIN payment_types pt ON o.fk_payment_type_id = pt.payment_type_id
     LEFT JOIN deliveries d ON o.order_id = d.fk_order_id
     LEFT JOIN status_catalogues st ON o.fk_status_id = st.status_id;
	 
	 
ALTER TABLE orders ADD net_total float8 NULL;
ALTER TABLE bin_orders  ADD net_total float8 NULL;