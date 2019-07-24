import { connect } from 'react-redux';
import BleatIndex from './bleat_index';
import { fetchBleats } from '../actions/bleat_actions';

const mapStateToProps = (state) => {
  // debugger;
  return {
    bleats: Object.values(state.bleats)
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    dispatchFetchBleats: () => dispatch(fetchBleats())
  };
};

const containerFunc = connect(mapStateToProps, mapDispatchToProps);
const ConnectedBleatIndex = containerFunc(BleatIndex);

export default ConnectedBleatIndex;