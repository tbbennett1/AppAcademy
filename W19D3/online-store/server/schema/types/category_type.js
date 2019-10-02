const mongoose = require("mongoose");
const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLID, GraphQLList } = graphql;
// const model = require("../../models/index.js");
// const Category = mongoose.model("categories");

const CategoryType = new GraphQLObjectType({
  name: "CategoryType",
  // remember we wrap the fields in a thunk to avoid circular dependency issues
  fields: () => ({
    id: { type: GraphQLID },
    name: { type: GraphQLString },
    products: { 
      type: new GraphQLList(require("./product_type")),
      resolve(parentValue) {
        return Category.findById(parentValue.id)
          .populate("product")
          .then(category => {
            console.log(category)
            return category.products
            });
      }
    }
  })
});

module.exports = CategoryType;