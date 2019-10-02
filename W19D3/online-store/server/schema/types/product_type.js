const mongoose = require("mongoose");
const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLID } = graphql;

// const Product = mongoose.model("products");

const ProductType = new GraphQLObjectType({
  name: "ProductType",
  // remember we wrap the fields in a thunk to avoid circular dependency issues
  fields: () => ({
    id: { type: GraphQLID },
    // user: { type: GraphQLObjectType },
    name: { type: GraphQLString },
    category: {
      type: GraphQLID
        // type: require("./category_type"),
        // resolve(parentValue){
        //     return Product.findById(parentValue._id)
        //     .populate("category")
        //     .then(product => product.category)
        // }
    },
    description: { type: GraphQLString },
    weight: { type: GraphQLString }
  })
});

module.exports = ProductType;