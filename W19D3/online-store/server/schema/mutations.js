const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLInt, GraphQLID } = graphql;
const mongoose = require("mongoose");
const UserType = require("./types/user_type");
const CategoryType = require("./types/category_type");
const ProductType = require("./types/product_type");
const AuthService = require("../services/auth");
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
            name: { type: GraphQLString },
            description: { type: GraphQLString },
            weight: { type: GraphQLInt },
          },
          resolve(_, { name, description, weight }) {
            return new Product({ name, description, weight }).save();
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
        },
        register: {
          type: UserType,
          args: {
            name: { type: GraphQLString },
            email: { type: GraphQLString },
            password: { type: GraphQLString }
          },
          resolve(_, args) {
            return AuthService.register(args);
          }
        },
      logout: {
        type: UserType,
        args: {
          // all we need to log the user our is an id
          _id: { type: GraphQLID }
        },
        resolve(_, args) {
          return AuthService.logout(args);
        }
      },
      login: {
        type: UserType,
        args: {
          email: { type: GraphQLString },
          password: { type: GraphQLString }
        },
        resolve(_, args) {
          return AuthService.login(args);
        }
      },
      verifyUser: {
        type: UserType,
        args: {
          token: { type: GraphQLString }
        },
        async resolve(_, { name, description, weight }, ctx) {
          const validUser = await AuthService.verifyUser({ token: ctx.token });
          // if our service returns true then our product is good to save!
          // anything else and we'll throw an error
          if (validUser.loggedIn) {
            return validUser;
          } else {
            throw new Error('Sorry, you need to be logged in to create a product.');
          }
        }
      }
  }
});

module.exports = mutation;