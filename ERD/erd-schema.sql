CREATE DATABASE e-commerce-backend_development


Table users {
  id int PRIMARY KEY,
  "name" VARCHAR(255),
  "username" varchar(255),
  "email" varchar(255),
  "password_digest" varchar
}

Table products {
  "id" int PRIMARY KEY,
  "name" VARCHAR(255),
  "description" VARCHAR(255),
  "price" decimal,
  "image" VARCHAR(255)
}

Table orders {
  "id" int [pk, increment],
  "user_id" int [ref: > users.id],
  "total_amount" decimal,
  "status" VARCHAR,
  "image" VARCHAR,
  "shipping_address" VARCHAR,
  "billing_address" VARCHAR,
  "order_date" timestamp,
  "delivery_date" timestamp
}

Table payments {
  "id" PRIMARY KEY,
  "order_id" int [ref: > orders.id],
  "amount" decimal,
  "payment_date" timestamp
}

Table order_items {
  "id" int [pk, increment],
  "order_id" int [ref: > orders.id],
  "product_id" int [ref: > products.id],
  "quantity" int,
  "image" VARCHAR(255)
}


-- Add foreign key constraint for user_id referencing users.id
ALTER TABLE "order_items" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

-- Add foreign key constraint for product_id referencing products.id
ALTER TABLE "order_items" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

-- Create indexes for the order_items table
CREATE INDEX order_items_user_id ON order_items (user_id);
CREATE INDEX order_items_product_id ON order_items (product_id);


