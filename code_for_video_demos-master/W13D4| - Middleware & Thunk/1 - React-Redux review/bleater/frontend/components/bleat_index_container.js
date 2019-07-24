import { connect } from 'react-redux';
import BleatIndex from './bleat_index';

const mapStateToProps = (state) => {
  // debugger;
  return {
    bleats: Object.values(state.bleats)
  };
};

const containerFunc = connect(mapStateToProps);
const ConnectedBleatIndex = containerFunc(BleatIndex);

export default ConnectedBleatIndex;