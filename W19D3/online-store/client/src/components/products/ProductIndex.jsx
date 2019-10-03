import React from 'react';
import { Query } from "react-apollo";
import queries from "../../graphql/queries";
import { Link } from "react-router-dom";
const { FETCH_PRODUCTS } = queries;

class ProductIndex extends React.Component{
  render(){
    return (
      <Query query={FETCH_PRODUCTS}>
        {({ loading, error, data }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;
          return (
            <ul>
              {data.products.map((product, idx) => (
                <Link to={`/${product.id}`} key={`/${product.id}`} ><li key={product.id}>{product.name}: {product.description}</li></Link>
              ))}
            </ul>
          );
        }}
      </Query>
    );
  }
}

export default ProductIndex;