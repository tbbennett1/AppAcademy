const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLInt, GraphQLID } = graphql;
const mongoose = require("mongoose");
const UserType = require("./types/user_type");
const CategoryType = require("./types/category_type");
const ProductType = require("./types/product_type");

const Category = mongoose.model("categories");
const Product = mongoose.model("products");

const mutation = new GraphQLObjectType({
  name: "Mutation",
  fields: {
        newCategory:{
          type: CategoryType,
          args: {
              name: { type: GraphQLString },
          },
          resolve(parentValue, { name }) {
              return new Category({ name }).save();
          }
        },
        deleteCategory: {
            type: CategoryType,
            args: { id: { type: GraphQLID }},
            resolve(parentValue, { id }){
                return Category.remove({ _id: id });
            }
        },
        newProduct:{
          type: ProductType,
          args: {
            // user: { type: GraphQLObjectType},
            category: { type: GraphQLID},
            name: { type: GraphQLString },
            description: { type: GraphQLString },
            weight: { type: GraphQLInt },

          },
            resolve(parentValue, { category, name, description, weight }) {
                return new Product({ category, name, description, weight }).save();
          }
        },
        deleteProduct:{
          type: ProductType,
          args: { id: { type: GraphQLID } },
          resolve(parentValue, { id }) {
            return Product.remove({ _id: id });
          }
        },
        updateProductCategory: {
          type: ProductType,
          args: { 
              productId: { type: GraphQLID },
              categoryId: { type: GraphQLID },
             },
            resolve(parentValue, { productId, categoryId }) {
              return Product.updateProductCategory(productId, categoryId);
          }
        }
  }
});

module.exports = mutation;