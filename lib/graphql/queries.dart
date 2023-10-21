const getBlogsQueryGql = """
query GetBlogs(\$pagination: PaginatedInput!) {
  get_blogs(pagination: \$pagination) {
    cursor
    hasMore
    items {
      id
      title
      description
      url
      image
      category
      createdAt
      updatedAt
      deletedAt
      isBookmarked
    }
  }
}
""";
