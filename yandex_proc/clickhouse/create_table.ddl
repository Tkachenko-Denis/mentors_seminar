CREATE TABLE IF NOT EXISTS default.orders (
  order_id       UInt64,
  user_id        UInt64,
  total_amount   Decimal(10,2),
  payment_status String,
  order_date     DateTime
)
ENGINE = MergeTree()
PARTITION BY toYYYYMM(order_date)
ORDER BY (user_id, order_date);

CREATE TABLE IF NOT EXISTS default.order_items (
  item_id    UInt64,
  order_id   UInt64,
  product_id UInt64,
  quantity   UInt32,
  price      Decimal(10,2)
)
ENGINE = MergeTree()
PARTITION BY toYYYYMM(toDate(order_date))
ORDER BY (order_id, product_id);
