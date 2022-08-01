alias Test.Repo
alias Test.Managment.User

Repo.insert! %User{
  first_name: "Aleksandar",
  last_name: "Pejkovic",
  email: "pejko89.ap@gmail.com",
  username: "pejko89",
  password: "aca123"
}

Repo.insert! %User{
  first_name: "Vladimir",
  last_name: "Pejkovic",
  email: "pejko88@gmail.com",
  username: "pejko88",
  password: "vlada123"
}
