type t = {
  id: string,
  name: string,
  price: float,
  inStock: bool,
}

let make = (~id, ~name, ~price, ~inStock=true, ()) => {
  id: id,
  name: name,
  price: price,
  inStock: inStock,
}

let getPrice = product => product.price

let isAvailable = product => product.inStock
