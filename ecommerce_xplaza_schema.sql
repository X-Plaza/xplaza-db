-- FRESH INSTALL: ECOMMERCE SOLUTION DB

-- 1. SCHEMA RESET
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-- 2. TABLES
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
  "date_of_birth" date,
  "password" varchar,
  "salt" varchar,
  "otp" varchar,
  "created_at" timestamp with time zone,
  "updated_at" timestamp with time zone
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
  "net_total" float8,
  "grand_total_price" float,
  "delivery_address" varchar,
  "customer_id" int,
  "customer_name" text,
  "shop_id" int,
  "shop_name" text,
  "fk_payment_type_id" int,
  "fk_status_id" int,
  "coupon_id" int,
  "coupon_code" text,
  "coupon_amount" float8,
  "delivery_schedule_start" time with time zone,
  "delivery_schedule_end" time with time zone,
  "delivery_cost" float8,
  "mobile_no" text,
  "fk_currency_id" int,
  "received_time" timestamp with time zone,
  "date_to_deliver" date,
  "last_updated_by" int,
  "last_updated_at" timestamp with time zone,
  "additional_info" text,
  "remarks" text
);

CREATE TABLE "order_items" (
  "order_item_id" BIGSERIAL PRIMARY KEY,
  "fk_order_id" int,
  "product_id" int,
  "order_item_name" varchar,
  "order_item_total_price" float8,
  "fk_currency_id" int,
  "order_item_quantity" int,
  "order_item_unit_price" float8,
  "order_item_category" varchar,
  "order_item_quantity_type" varchar,
  "order_item_image" varchar,
  "order_item_var_type_name" text,
  "order_item_var_type_value" int,
  "last_updated_by" int,
  "last_updated_at" timestamp(0)
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
  "person_name" varchar,
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
  "product_var_type_value" int,
  "product_buying_price" float,
  "product_selling_price" float,
  "fk_currency_id" int,
  "fk_shop_id" int NOT NULL,
  "quantity" int NOT NULL DEFAULT 1,
  "created_by" int,
  "created_at" timestamp(0),
  "last_updated_by" int,
  "last_updated_at" timestamp(0)
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

CREATE TABLE "product_images" (
  "product_images_id" BIGSERIAL PRIMARY KEY,
  "fk_product_id" int,
  "product_image_name" varchar,
  "product_image_path" varchar,
  "created_by" int,
  "created_at" timestamp(0),
  "last_updated_by" int,
  "last_updated_at" timestamp(0)
);

CREATE TABLE "shops" (
  "shop_id" BIGSERIAL PRIMARY KEY,
  "shop_name" varchar,
  "shop_description" varchar,
  "shop_address" varchar,
  "fk_location_id" int,
  "shop_owner" varchar
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

CREATE TABLE "currencies" (
  "currency_id" BIGSERIAL PRIMARY KEY,
  "currency_name" varchar,
  "currency_sign" varchar
);

CREATE TABLE "delivery_schedules" (
  "delivery_schedule_id" BIGSERIAL PRIMARY KEY,
  "delivery_schedule_start" time,
  "delivery_schedule_end" time,
  "fk_day_id" int
);

CREATE TABLE "day_names" (
  "day_id" BIGSERIAL PRIMARY KEY,
  "day_name" varchar
);

CREATE TABLE "coupons" (
  "coupon_id" BIGSERIAL PRIMARY KEY,
  "coupon_code" varchar NOT NULL,
  "coupon_amount" float,
  "max_coupon_amount" float8,
  "fk_currency_id" int,
  "coupon_start_date" timestamp,
  "coupon_end_date" timestamp,
  "fk_discount_type_id" int,
  "min_shopping_amount" float8,
  "is_active" bool DEFAULT false
);

CREATE TABLE "delivery_costs" (
  "delivery_cost_id" BIGSERIAL PRIMARY KEY,
  "delivery_slab_start_range" float8,
  "delivery_slab_end_range" float8,
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
  "salt" varchar,
  "full_name" varchar,
  "confirmation_code" text,
  "fk_role_id" int NOT NULL DEFAULT 1
);

CREATE TABLE "roles" (
  "role_id" BIGSERIAL PRIMARY KEY,
  "role_name" text,
  "role_description" text,
  "fk_module_id" int
);

CREATE TABLE "modules" (
  "module_id" BIGSERIAL PRIMARY KEY,
  "module_name" text,
  "module_description" text
);

CREATE TABLE "menus" (
  "menu_id" BIGSERIAL PRIMARY KEY,
  "menu_name" text,
  "menu_description" text
);

CREATE TABLE "menu_module_link" (
  "menu_id" BIGSERIAL,
  "module_id" BIGSERIAL,
  "all_of_them" bool NOT NULL DEFAULT false,
  "view" bool DEFAULT false,
  "add" bool DEFAULT false,
  "update" bool DEFAULT false,
  "delete" bool DEFAULT false,
  PRIMARY KEY ("menu_id", "module_id")
);

CREATE TABLE "admin_user_shop_link" (
  "admin_user_id" BIGSERIAL,
  "shop_id" BIGSERIAL,
  PRIMARY KEY ("admin_user_id", "shop_id")
);

CREATE TABLE "coupon_shop_link" (
  "shop_id" BIGSERIAL,
  "coupon_id" BIGSERIAL,
  PRIMARY KEY ("shop_id", "coupon_id")
);

CREATE TABLE bin_orders (
  order_id bigserial NOT NULL,
  total_price float8 NULL,
  discount_amount float8 NULL,
  net_total float8 NULL,
  grand_total_price float8 NULL,
  delivery_address varchar NULL,
  customer_id int4 NULL,
  shop_id int4 NULL,
  fk_payment_type_id int4 NULL,
  fk_status_id int4 NULL,
  coupon_id int4 NULL,
  coupon_code text NULL,
  coupon_amount float8 NULL,
  delivery_schedule_start time with time zone NULL,
  delivery_schedule_end time with time zone NULL,
  delivery_cost float8 NULL,
  mobile_no text NULL,
  fk_currency_id int NULL,
  received_time timestamp with time zone NULL,
  date_to_deliver date NULL,
  last_updated_by int NULL,
  last_updated_at timestamp with time zone NULL,
  additional_info text NULL,
  remarks text NULL,
  CONSTRAINT bin_orders_pkey PRIMARY KEY (order_id)
);

CREATE TABLE bin_order_items (
  order_item_id bigserial NOT NULL,
  fk_order_id int4 NULL,
  product_id int4 NULL,
  order_item_name varchar NULL,
  order_item_total_price float8 NULL,
  fk_currency_id int4 NULL,
  order_item_quantity int4 NULL,
  order_item_unit_price float8 NULL,
  order_item_category varchar NULL,
  order_item_quantity_type varchar NULL,
  order_item_image varchar NULL,
  order_item_var_type_name text NULL,
  order_item_var_type_value int NULL,
  last_updated_by int4 NULL,
  last_updated_at timestamp(0) NULL,
  CONSTRAINT bin_order_items_pkey PRIMARY KEY (order_item_id)
);

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

CREATE TABLE platform_info (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255),
    invoice VARCHAR(255),
    cell_no VARCHAR(255),
    additional_info VARCHAR(255),
    banner_image VARCHAR(255),
    banner_image_path VARCHAR(255)
);

CREATE TABLE admin_user_shop_list (
    id BIGINT PRIMARY KEY,
    admin_user_id BIGINT,
    shop_id BIGINT
);

CREATE TABLE coupon_shop_list (
    id BIGINT PRIMARY KEY,
    coupon_id BIGINT,
    shop_id BIGINT
);

CREATE SEQUENCE IF NOT EXISTS countries_country_id_seq;

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

-- 3. FOREIGN KEYS
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

ALTER TABLE "orders" ADD FOREIGN KEY ("fk_payment_type_id") REFERENCES "payment_types" ("payment_type_id");
ALTER TABLE "orders" ADD FOREIGN KEY ("fk_status_id") REFERENCES "status_catalogues" ("status_id");
ALTER TABLE "orders" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("fk_order_id") REFERENCES "orders" ("order_id");
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
ALTER TABLE "products" ADD FOREIGN KEY ("fk_shop_id") REFERENCES "shops" ("shop_id");

ALTER TABLE "product_discounts" ADD FOREIGN KEY ("fk_discount_type_id") REFERENCES "discount_types" ("discount_type_id");
ALTER TABLE "product_discounts" ADD FOREIGN KEY ("fk_product_id") REFERENCES "products" ("product_id");
ALTER TABLE "product_discounts" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "product_images" ADD FOREIGN KEY ("fk_product_id") REFERENCES "products" ("product_id");

ALTER TABLE "shops" ADD FOREIGN KEY ("fk_location_id") REFERENCES "locations" ("location_id");

ALTER TABLE "locations" ADD FOREIGN KEY ("fk_city_id") REFERENCES "cities" ("city_id");

ALTER TABLE "cities" ADD FOREIGN KEY ("fk_state_id") REFERENCES "states" ("state_id");

ALTER TABLE "states" ADD FOREIGN KEY ("fk_country_id") REFERENCES "countries" ("country_id");

ALTER TABLE "delivery_schedules" ADD FOREIGN KEY ("fk_day_id") REFERENCES "day_names" ("day_id");

ALTER TABLE "delivery_costs" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "coupons" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");
ALTER TABLE "coupons" ADD FOREIGN KEY ("fk_discount_type_id") REFERENCES "discount_types" ("discount_type_id");

ALTER TABLE "users" ADD FOREIGN KEY ("fk_customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "roles" ADD FOREIGN KEY ("fk_module_id") REFERENCES "modules" ("module_id");

ALTER TABLE "menu_module_link" ADD FOREIGN KEY ("menu_id") REFERENCES "menus" ("menu_id");
ALTER TABLE "menu_module_link" ADD FOREIGN KEY ("module_id") REFERENCES "modules" ("module_id");

ALTER TABLE "admin_users" ADD FOREIGN KEY ("fk_role_id") REFERENCES "roles" ("role_id");

ALTER TABLE "admin_user_shop_link" ADD FOREIGN KEY ("admin_user_id") REFERENCES "admin_users" ("admin_user_id");
ALTER TABLE "admin_user_shop_link" ADD FOREIGN KEY ("shop_id") REFERENCES "shops" ("shop_id");

ALTER TABLE "coupon_shop_link" ADD FOREIGN KEY ("shop_id") REFERENCES "shops" ("shop_id");
ALTER TABLE "coupon_shop_link" ADD FOREIGN KEY ("coupon_id") REFERENCES "coupons" ("coupon_id");

ALTER TABLE "bin_orders" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "bin_order_items" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");
ALTER TABLE "bin_order_items" ADD FOREIGN KEY ("fk_order_id") REFERENCES "bin_orders" ("order_id");

ALTER TABLE "bin_products" ADD FOREIGN KEY ("fk_brand_id") REFERENCES "brands" ("brand_id");
ALTER TABLE "bin_products" ADD FOREIGN KEY ("fk_category_id") REFERENCES "categories" ("category_id");
ALTER TABLE "bin_products" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");
ALTER TABLE "bin_products" ADD FOREIGN KEY ("fk_product_var_type_id") REFERENCES "product_variation_types" ("product_var_type_id");
ALTER TABLE "bin_products" ADD FOREIGN KEY ("fk_shop_id") REFERENCES "shops" ("shop_id");

ALTER TABLE "bin_product_images" ADD FOREIGN KEY ("fk_product_id") REFERENCES "bin_products" ("product_id");

ALTER TABLE admin_user_shop_list ADD CONSTRAINT fk_admin_user FOREIGN KEY (admin_user_id) REFERENCES admin_users(admin_user_id);
ALTER TABLE admin_user_shop_list ADD CONSTRAINT fk_shop FOREIGN KEY (shop_id) REFERENCES shops(shop_id);

ALTER TABLE coupon_shop_list ADD CONSTRAINT fk_coupon FOREIGN KEY (coupon_id) REFERENCES coupons(coupon_id);
ALTER TABLE coupon_shop_list ADD CONSTRAINT fk_shop FOREIGN KEY (shop_id) REFERENCES shops(shop_id);

-- 4. FUNCTIONS & TRIGGERS
CREATE OR REPLACE FUNCTION order_stamp() RETURNS trigger AS $order_stamp$
    begin
        IF (TG_OP = 'INSERT') THEN
           NEW.received_time := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'UPDATE') THEN
           NEW.last_updated_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'DELETE') then
            INSERT INTO bin_orders select OLD.*;
            RETURN OLD;
        END IF;
    END;
$order_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER order_stamp
BEFORE INSERT OR UPDATE OR DELETE ON orders
    FOR EACH ROW EXECUTE PROCEDURE order_stamp();

CREATE OR REPLACE FUNCTION order_item_stamp() RETURNS trigger AS $order_item_stamp$
    begin
        IF (TG_OP = 'UPDATE') THEN
           NEW.last_updated_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'DELETE') then
            INSERT INTO bin_order_items select OLD.*;
            RETURN OLD;
        END IF;
    END;
$order_item_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER order_item_stamp
BEFORE UPDATE OR DELETE ON order_items
    FOR EACH ROW EXECUTE PROCEDURE order_item_stamp();

CREATE OR REPLACE FUNCTION product_stamp() RETURNS trigger AS $product_stamp$
    begin
        IF (TG_OP = 'INSERT') THEN
           NEW.created_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'UPDATE') THEN
           NEW.last_updated_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'DELETE') then
            INSERT INTO bin_products select OLD.*;
            RETURN OLD;
        END IF;
    END;
$product_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER product_stamp
BEFORE INSERT OR UPDATE OR DELETE ON products
    FOR EACH ROW EXECUTE PROCEDURE product_stamp();

CREATE OR REPLACE FUNCTION product_image_stamp() RETURNS trigger AS $product_image_stamp$
    begin
        IF (TG_OP = 'INSERT') THEN
           NEW.created_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'UPDATE') THEN
           NEW.last_updated_at := current_timestamp;
           RETURN NEW;
        ELSIF (TG_OP = 'DELETE') then
            INSERT INTO bin_product_images select OLD.*;
            RETURN OLD;
        END IF;
    END;
$product_image_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER product_image_stamp
BEFORE INSERT OR UPDATE OR DELETE ON product_images
    FOR EACH ROW EXECUTE PROCEDURE product_image_stamp();

-- 5. VIEWS
CREATE OR REPLACE VIEW logins AS
SELECT au.admin_user_id, au.user_name, au.full_name, r.role_id, r.role_name, false AS authentication 
FROM admin_users au
LEFT JOIN roles r ON au.fk_role_id = r.role_id;

CREATE OR REPLACE VIEW permissions AS
SELECT row_number() OVER() AS id, au.admin_user_id, m2.menu_name, mml.all_of_them, mml.view, mml.add, mml.update, mml.delete 
FROM admin_users au 
LEFT JOIN roles r ON au.fk_role_id = r.role_id 
LEFT JOIN modules m ON r.fk_module_id = m.module_id 
LEFT JOIN menu_module_link mml ON m.module_id = mml.module_id 
LEFT JOIN menus m2 ON mml.menu_id = m2.menu_id;

CREATE OR REPLACE VIEW top_customer AS 
SELECT temp.id, temp.customer_id, temp.customer_name, temp.total_order_amount, temp.shop_id
FROM (
  SELECT row_number() OVER () AS id, o.customer_id, o.customer_name, 
         COALESCE(SUM(o.grand_total_price), 0::double precision) AS total_order_amount, o.shop_id
  FROM orders o
  WHERE date_part('month', o.received_time) = date_part('month', CURRENT_DATE)
  GROUP BY o.customer_id, o.customer_name, o.shop_id
  ORDER BY COALESCE(SUM(o.grand_total_price), 0::double precision) DESC
) temp
WHERE temp.shop_id IS NOT NULL;

CREATE OR REPLACE VIEW top_product AS 
SELECT row_number() OVER () AS id, oi.product_id, oi.order_item_name AS product_name, 
       COALESCE(SUM(oi.order_item_quantity), 0::bigint) AS monthly_sold_unit, o.shop_id
FROM order_items oi
LEFT JOIN orders o ON oi.fk_order_id = o.order_id
WHERE date_part('month', o.received_time) = date_part('month', CURRENT_DATE)
GROUP BY oi.product_id, product_name, o.shop_id 
ORDER BY COALESCE(SUM(oi.order_item_quantity), 0::bigint) DESC;

CREATE OR REPLACE VIEW revenue AS 
SELECT temp_revenue.total_expense, temp_revenue.total_income, 
       temp_revenue.total_income - temp_revenue.total_expense AS total_revenue, temp_revenue.shop_id
FROM (
  SELECT SUM(p.product_buying_price * (p.quantity + psu.total_sold_unit)::double precision) AS total_expense,
         temp_income.total_income, s.shop_id
  FROM (
    SELECT SUM(o.grand_total_price) AS total_income, o.shop_id
    FROM orders o
    GROUP BY o.shop_id
  ) temp_income
  LEFT JOIN shops s ON temp_income.shop_id = s.shop_id
  LEFT JOIN products p ON s.shop_id = p.fk_shop_id
  LEFT JOIN (
    SELECT p.product_id, COALESCE(SUM(oi.order_item_quantity), 0::bigint) AS total_sold_unit
    FROM products p
    LEFT JOIN order_items oi ON oi.product_id = p.product_id
    GROUP BY p.product_id
  ) psu ON psu.product_id = p.product_id
  GROUP BY s.shop_id, temp_income.total_income
) temp_revenue;

CREATE OR REPLACE VIEW order_details AS 
SELECT row_number() OVER () AS id, o.order_id, o.total_price, o.discount_amount, o.net_total, 
       o.grand_total_price, o.delivery_address, o.customer_id, o.shop_id, o.fk_payment_type_id, 
       o.fk_status_id, COALESCE(o.coupon_id, 0) AS coupon_id, o.received_time, o.date_to_deliver, 
       o.fk_currency_id, COALESCE(o.additional_info, 'N/A') AS additional_info, 
       COALESCE(o.remarks, 'N/A') AS remarks, o.customer_name, o.mobile_no, o.shop_name, 
       st.status_name, CONCAT(o.delivery_schedule_start, '-', o.delivery_schedule_end) AS allotted_time, 
       o.delivery_cost, pt.payment_type_name, d.delivery_id, d.person_name, d.contact_no, 
       COALESCE(o.coupon_code, 'N/A') AS coupon_code, COALESCE(o.coupon_amount, 0::double precision) AS coupon_amount, 
       CONCAT(oi.order_item_name, ' (', oi.order_item_var_type_value, oi.order_item_var_type_name, ')') AS order_item_name, 
       oi.order_item_category, oi.order_item_quantity, oi.order_item_quantity_type, oi.order_item_unit_price, 
       oi.order_item_total_price, oi.order_item_image, oi.order_item_id, cur.currency_name, cur.currency_sign
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.fk_order_id
LEFT JOIN currencies cur ON cur.currency_id = o.fk_currency_id
LEFT JOIN payment_types pt ON o.fk_payment_type_id = pt.payment_type_id
LEFT JOIN deliveries d ON o.order_id = d.fk_order_id
LEFT JOIN status_catalogues st ON o.fk_status_id = st.status_id;

CREATE OR REPLACE VIEW coupon_shop_list AS 
SELECT row_number() OVER () AS id, csl.*, s.shop_name 
FROM coupon_shop_link csl
LEFT JOIN shops s ON s.shop_id = csl.shop_id;

CREATE OR REPLACE VIEW product_to_stock AS 
SELECT row_number() OVER () AS id, p.product_id, p.product_name, p.quantity AS remaining_unit, p.fk_shop_id AS shop_id
FROM products p
WHERE p.quantity <= 5
ORDER BY p.quantity;

-- 6. INSERTS
INSERT INTO countries (country_id, iso, country_name, nicename, iso3, numcode, phonecode) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', 'ATA', 10, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', 'BVT', 74, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'IOT', 86, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', 'CXR', 162, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECHIA', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', 'ATF', 260, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', 'HMD', 334, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'NORTH MACEDONIA', 'North Macedonia', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', 'MYT', 175, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROU', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 7),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', 'SGS', 239, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', 'TLS', 626, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 993),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', 'UMI', 581, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(241, 'XK', 'KOSOVO', 'Kosovo', 'XKX', 0, 383),
(242, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', '248', '358'),
(243, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', '535', '599'),
(244, 'CW', 'CURACAO', 'Curacao', 'CUW', '531', '599'),
(245, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', '831', '44'),
(246, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', '833', '44'),
(247, 'JE', 'JERSEY', 'Jersey', 'JEY', '832', '44'),
(248, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', '652', '590'),
(249, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', '663', '590'),
(250, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', '534', '1'),
(251, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', '728', '211');

INSERT INTO modules (module_name, module_description) VALUES ('Master Admin Module', 'This module contains all the things a master admin can do');
INSERT INTO modules (module_name, module_description) VALUES ('Shop Admin Module', 'This module contains all the things a shop admin can do');

INSERT INTO roles (role_name, role_description, fk_module_id) VALUES ('Master Admin', 'Master Admin', 1);
INSERT INTO roles (role_name, role_description, fk_module_id) VALUES ('Shop Admin', 'Shop Owner', 2);

-- END OF FRESH INSTALL SCRIPT