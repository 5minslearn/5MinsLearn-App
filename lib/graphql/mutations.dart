String loginMutationGql = """
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

String registerMutationGql = """
mutation Register(\$input: RegisterInput!) {
  register(input: \$input) {
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

const String logoutMutationGql = """
mutation Logout {
  logout
}
""";

const String addBookmarkMutationGql = """
mutation Add_bookmark(\$input: BookmarkInput!) {
  add_bookmark(input: \$input) {
    blogId
    message
  }
}
""";

const String removeBookmarkMutationGql = """
mutation Remove_bookmark(\$input: BookmarkInput!) {
  remove_bookmark(input: \$input) {
    blogId
    message
  }
}
""";
