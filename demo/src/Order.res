type t = {
  orderId: string,
  userId: string,
  products: array<Product.t>,
  total: float,
}

let make = (~orderId, ~userId, ~products) => {
  orderId: orderId,
  userId: userId,
  products: products,
  total: 0.0,
}

let calculateTotal = order => {
  Array.reduce(order.products, 0.0, (acc, product) => {
    acc +. Product.getPrice(product)
  })
}
