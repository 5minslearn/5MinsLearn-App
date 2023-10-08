String login = """
mutation Login(\$input: LoginInput!) {
  login(input: \$input) {
    token
    user {
      id
      first_name
      last_name
      email
      gender
      address_line1
      address_line2
      city
      state
      secret_question
      dob
      mobile
      full_address
      name
      activate_date
      createdAt
      updatedAt
      deletedAt
    }
  }
}
""";

const String logout = """
mutation {
  logout
}
""";
