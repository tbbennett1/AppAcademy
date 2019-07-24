import { connect } from 'react-redux';
import { addBleat } from '../actions/bleat_actions';
import BleatForm from './bleat_form';

const mapStateToProps = (state) => {
  return {}
};

const mapDispatchToProps = (dispatch) => {
  // debugger;
  return {
    dispatchAddBleat: (body) => dispatch(addBleat(body))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(BleatForm);