const mongoose = require("mongoose");
const graphql = require("graphql");
const { GraphQLObjectType, GraphQLList, GraphQLID, GraphQLNonNull } = graphql;
const God = require('../models/God')
const Abode = require('../models/Abode')
const Emblem = require('../models/Emblem')
const GodType = require("./god_type");
const EmblemType = require("./emblem_type");
const AbodeType = require("./abode_type");


const RootQuery = new GraphQLObjectType({
    name: "RootQueryType",
    fields: () => ({
        gods: {
            type: new GraphQLList(GodType),
            resolve() {
                return God.find({});
            }
        },
        god: {
            type: GodType,
            args: { id: { type: new GraphQLNonNull(GraphQLID) } },
            resolve(parentValue, { id }) {
                return God.findById(id);
            }
        },
        emblems: {
            type: new GraphQLList(EmblemType),
            resolve() {
                return Emblem.find({});
            }
        },
        emblem: {
            type: EmblemType,
            args: { id: { type: new GraphQLNonNull(GraphQLID) } },
            resolve(parentValue, { id }) {
                return Emblem.findById(id);
            }
        },
        abodes: {
            type: new GraphQLList(AbodeType),
            resolve() {
                return Abode.find({});
            }
        },
        abode: {
            type: AbodeType,
            resolve(parentValue, { id }) {
                return Abode.findById(id);
            }
        }
    })
});

module.exports = RootQuery;