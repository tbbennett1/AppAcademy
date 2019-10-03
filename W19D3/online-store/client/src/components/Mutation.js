import React, { Component } from 'react';
import { LOGIN_USER } from '../graphql/mutations';

export default class Mutation extends Component {
    render() {
        return (
            <Mutation
                mutation={LOGIN_USER}
                onCompleted={data => {
                    const { token } = data.login;
                    localStorage.setItem("auth-token", token);
                    this.props.history.push("/");
                }}
            >
                {() => { }}
            </Mutation>
        );
    }
}
