import React from 'react';

class BleatForm extends React.Component {
  constructor(props) {
    super(props)

    this.state = {body: ""};
    this.handleSubmit = this.handleSubmit.bind(this);
    // this.updateBody = this.updateBody.bind(this);
  }

  // updateBody(e) {
  //   this.setState({body: e.target.value});
  // }

  update(field) {
    // this;
    return (e) => {
      this.setState({[field]: e.target.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    // e.target
    // this.props.dispatchAddBleat(this.state.body);
    const bleatForm = this;
    this.props.dispatchCreateBleat(this.state.body).then((response) => {
      // debugger;
      // bleatForm;
      this.setState({body: ""});
      const bleatId = Object.values(response.bleats)[0].id;
      bleatForm.props.history.push(`/bleats/${ bleatId }`);
    }); 
  }

  render() {
    return <form onSubmit={ this.handleSubmit }>
      <label htmlFor="bleat-body">Body</label>
      <input 
        type="text" 
        id="bleat-body" 
        onChange={ this.update("body") } 
        value={ this.state.body }
      />

      <button>Create the bleat!</button>
    </form>;
  }

}

export default BleatForm;