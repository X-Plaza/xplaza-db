CREATE TABLE "customers" (
  "customer_id" int PRIMARY KEY,
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
  "date_of_birth" datetime
);

CREATE TABLE "temp_orders" (
  "temp_order_id" int PRIMARY KEY,
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
  "temp_order_item_id" int PRIMARY KEY,
  "fk_temp_order_id" int,
  "fk_product_id" int,
  "order_item_name" varchar,
  "order_item_price" float,
  "fk_currency_id" int,
  "order_item_quantity" int
);

CREATE TABLE "orders" (
  "order_id" int PRIMARY KEY,
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
  "order_item_id" int PRIMARY KEY,
  "fk_order_id" int,
  "fk_product_id" int,
  "order_item_name" varchar,
  "order_item_price" float,
  "fk_currency_id" int,
  "order_item_quantity" int
);

CREATE TABLE "payment_types" (
  "payment_type_id" int PRIMARY KEY,
  "payment_type_name" varchar
);

CREATE TABLE "transactions" (
  "transaction_id" int PRIMARY KEY,
  "transcation_amount" float,
  "fk_currency_id" int,
  "fk_order_id" int,
  "fk_payment_type_id" int,
  "fk_status_id" int
);

CREATE TABLE "shopping_temp_carts" (
  "shopping_temp_cart_id" int PRIMARY KEY,
  "fk_product_id" int,
  "fk_customer_id" int,
  "item_quantity" int
);

CREATE TABLE "status_catalogues" (
  "status_id" int PRIMARY KEY,
  "status_name" varchar,
  "status_desc" varchar
);

CREATE TABLE "deliveries" (
  "delivery_id" int PRIMARY KEY,
  "fk_order_id" int,
  "person_name" int,
  "contact_no" varchar,
  "alloted_time" datetime,
  "recieved_time" datetime
);

CREATE TABLE "shippings" (
  "shipping_id" int PRIMARY KEY
);

CREATE TABLE "cancellations" (
  "cancellation_id" int PRIMARY KEY
);

CREATE TABLE "brands" (
  "brand_id" int PRIMARY KEY,
  "brand_name" varchar,
  "brand_description" varchar
);

CREATE TABLE "categories" (
  "category_id" int PRIMARY KEY,
  "category_name" varchar,
  "category_description" varchar,
  "parent_category" int
);

CREATE TABLE "products" (
  "product_id" int PRIMARY KEY,
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
  "product_discount_id" int PRIMARY KEY,
  "fk_product_id" int,
  "fk_discount_type_id" int,
  "discount_amount" float,
  "fk_currency_id" int,
  "discount_start_date" datetime,
  "discount_end_date" datetime
);

CREATE TABLE "discount_types" (
  "discount_type_id" int PRIMARY KEY,
  "discount_type_name" varchar
);

CREATE TABLE "product_variation_types" (
  "product_var_type_id" int PRIMARY KEY,
  "var_type_name" varchar,
  "var_type_description" varchar
);

CREATE TABLE "product_variation_type_options" (
  "product_var_type_option_id" int PRIMARY KEY
);

CREATE TABLE "product_images" (
  "product_images_id" int PRIMARY KEY,
  "fk_product_id" int,
  "product_image_name" varchar,
  "product_image_path" varchar
);

CREATE TABLE "shops" (
  "shop_id" int PRIMARY KEY,
  "shop_name" varchar,
  "shop_description" varchar,
  "shop_address" varchar,
  "fk_location_id" int
);

CREATE TABLE "locations" (
  "location_id" int PRIMARY KEY,
  "location_name" varchar,
  "fk_country_id" int
);

CREATE TABLE "countries" (
  "country_id" int PRIMARY KEY,
  "country_name" varchar
);

CREATE TABLE "currencies" (
  "currency_id" int PRIMARY KEY,
  "currency_name" varchar,
  "currency_sign" varchar
);

CREATE TABLE "delivery_schedules" (
  "delivery_schedule_id" int PRIMARY KEY,
  "delivery_schedule_slab" int,
  "delivery_schedule_start" datetime,
  "delivery_schedule_end" datetime,
  "fk_day_type_id" int
);

CREATE TABLE "day_types" (
  "day_type_id" int PRIMARY KEY,
  "day_type_name" int
);

CREATE TABLE "coupons" (
  "coupon_id" int PRIMARY KEY,
  "coupon_amount" float,
  "fk_currency_id" int,
  "coupon_start_date" datetime,
  "coupon_end_date" datetime
);

CREATE TABLE "delivery_costs" (
  "delivery_cost_id" int PRIMARY KEY,
  "delivery_slab_start_range" int,
  "delivery_slab_end_range" int,
  "delivery_cost" float,
  "fk_currency_id" int
);

CREATE TABLE "users" (
  "user_id" int PRIMARY KEY,
  "fk_customer_id" int,
  "user_name" varchar,
  "user_email" varchar,
  "password" varchar,
  "salt" varchar
);

CREATE TABLE "admin_users" (
  "admin_user_id" int PRIMARY KEY,
  "user_name" varchar,
  "password" varchar,
  "salt" varchar
);

CREATE TABLE "permissions" (
  "permission_id" int PRIMARY KEY,
  "permission_name" text,
  "permission_description" text
);

CREATE TABLE "roles" (
  "role_id" int PRIMARY KEY,
  "role_name" text,
  "role_description" text,
  "fk_permission_id" int
);

CREATE TABLE "user_role_links" (
  "admin_user_id" int,
  "role_id" int,
  PRIMARY KEY ("admin_user_id", "role_id")
);

CREATE TABLE "menus" (
  "menu_id" int PRIMARY KEY,
  "menu_name" text,
  "menu_description" text
);

CREATE TABLE "modules" (
  "module_id" int PRIMARY KEY,
  "module_name" text,
  "module_description" text
);

CREATE TABLE "menu_module_link" (
  "menu_id" int,
  "module_id" int,
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

ALTER TABLE "locations" ADD FOREIGN KEY ("fk_country_id") REFERENCES "countries" ("country_id");

ALTER TABLE "delivery_schedules" ADD FOREIGN KEY ("fk_day_type_id") REFERENCES "day_types" ("day_type_id");

ALTER TABLE "delivery_costs" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "coupons" ADD FOREIGN KEY ("fk_currency_id") REFERENCES "currencies" ("currency_id");

ALTER TABLE "users" ADD FOREIGN KEY ("fk_customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "roles" ADD FOREIGN KEY ("fk_permission_id") REFERENCES "permissions" ("permission_id");

