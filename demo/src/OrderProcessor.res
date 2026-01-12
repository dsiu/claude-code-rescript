// This file has intentional type errors for demonstration

let processOrder = (order: Order.t, user: User.t) => {
  let total = Order.calculateTotal(order)
  let userName = User.getFullName(user)

  // Now correctly accessing age as option type
  let userAge = switch user.age {
  | Some(age) => age
  | None => 0
  }

  // Fixed: comparing float with float
  if total > 100.0 {
    Js.log("Large order!")
  }

  Js.log2("Processing order for:", userName)
}
