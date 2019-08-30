import React from 'react';


class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this)
  }

    handleInput(type) {
        return (e) => {
            this.setState({ [type]: e.target.value })
        };
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user);
    }

  render(){
      return (
          <div className="session-form">
              <h2>{this.props.formType}</h2>
              <form action="">
                  <label htmlFor="">Username:
                        <input
                          type="text"
                          value={this.state.username}
                          onChange={this.handleInput('username')} />
                  </label>
                  <label htmlFor="">Password:
                        <input
                          type="password"
                          value={this.state.password}
                          onChange={this.handleInput('password')} />
                  </label>
                  <button onClick={this.handleSubmit}>{this.props.formType}</button>
              </form>
          </div>
      );
  }
}

export default SessionForm;