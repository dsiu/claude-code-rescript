type t = {
  firstName: string,
  lastName: string,
  age: option<int>,
  email: string,
}

let makeUser = (firstName, lastName, age, email) => {
  firstName: firstName,
  lastName: lastName,
  age: Some(age),
  email: email,
}

let makeUserWithOptionalAge = (firstName, lastName, ~age=?, email) => {
  firstName: firstName,
  lastName: lastName,
  age: age,
  email: email,
}

let getFullName = user => {
  user.firstName ++ " " ++ user.lastName
}

let formatFullName = (user: t): string => {
  user.firstName ++ " " ++ user.lastName
}
