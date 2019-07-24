import { connect } from 'react-redux';
import { createBleat } from '../actions/bleat_actions';
import BleatForm from './bleat_form';

const mapStateToProps = (state, ownProps) => {
  // debugger;
  return {}
};

const mapDispatchToProps = (dispatch, ownProps) => {
  // debugger;
  return {
    // dispatchAddBleat: (body) => dispatch(addBleat(body)),
    dispatchCreateBleat: (body) => dispatch(createBleat(body))
  }
};

export default connect(mapStateToProps, mapDispatchToProps)(BleatForm);