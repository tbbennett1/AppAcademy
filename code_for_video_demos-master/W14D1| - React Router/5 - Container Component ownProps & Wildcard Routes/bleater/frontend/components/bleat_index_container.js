import { connect } from 'react-redux';
import BleatIndex from './bleat_index';
import { fetchBleats } from '../actions/bleat_actions';
import { bleatsAndAuthors } from '../reducers/selectors';


const mapStateToProps = (state) => {
  // debugger;
  return {
    bleats: bleatsAndAuthors(state),
    // users: Object.values(state.users)
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