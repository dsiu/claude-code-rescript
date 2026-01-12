type t = {
  cartId: string,
  userId: string,
  items: array<Product.t>,
}

let make = (~cartId, ~userId, ~items=[]) => {
  cartId: cartId,
  userId: userId,
  items: items,
}

let addItem = (cart, product) => {
  {
    ...cart,
    items: Array.concat(cart.items, [product]),
  }
}

let removeItem = (cart, productId) => {
  {
    ...cart,
    items: Array.filter(cart.items, item => item.id !== productId),
  }
}

let calculateTotal = cart => {
  Array.reduce(cart.items, 0.0, (acc, product) => {
    acc +. Product.getPrice(product)
  })
}

let getItemCount = cart => Array.length(cart.items)

let isEmpty = cart => Array.length(cart.items) === 0
