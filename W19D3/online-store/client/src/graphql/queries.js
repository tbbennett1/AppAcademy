import gql from "graphql-tag";

export default {
  FETCH_PRODUCTS: gql`
    query FetchProducts{
      products {
        id
        name
        description
      }
    }`,
  IS_LOGGED_IN: gql`
    query IsUserLoggedIn {
      isLoggedIn @client
    }
  `,

}