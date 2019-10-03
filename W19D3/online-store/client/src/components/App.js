import React from "react";
import ProductIndex from "./products/ProductIndex";
import Login from "./Login";
import Register from "./Register";
import { Route, Switch } from 'react-router-dom';
import AuthRoute from "../util/route_util";
import Nav from "./Nav";
import ProductShow from "./products/ProductShow";
import CreateProduct from "./products/CreateProduct";

const App = () => {
  return (
    <div>
      <Nav />
      <h1>Online Store</h1>
      <Switch>
        <AuthRoute exact path="/login" component={Login} routeType="auth" />
        <AuthRoute exact path="/register" component={Register} routeType="auth" />
        <AuthRoute exact path="/create_product" component={CreateProduct} />
        <Route path="/:id" component={ProductShow}/>
        <Route exact path="/" component={ProductIndex} />
      </Switch>
    </div>
  );
};

export default App;