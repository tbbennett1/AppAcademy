import { connect } from 'react-redux';
import BleatShow from './bleat_show';
import { fetchBleat } from '../actions/bleat_actions';

const mapStateToProps = function (state, ownProps) {
  const bleatId = ownProps.match.params.bleatId;
  let bleat = state.bleats[bleatId]
  // debugger;
  if (bleat) {
    bleat = Object.assign(
      {}, 
      bleat,
      {author: state.users[bleat.author_id]}
    );
  }
  
  return {
    bleat: bleat
  };
};

// {
//   bleats: {
//     1: {id: 1, body: "something", author_id: 1},
//     2: {id: 2, body: "something else", author_id: 1}
//   },
//   users: {
//     1: {id: 1, email: "tommy@appacademy.io"}
//   }
// }

const mapDispatchToProps = function (dispatch, ownProps) {
  const bleatId = ownProps.match.params.bleatId;
  // debugger;
  return {
    fetchBleat: () => dispatch(fetchBleat(bleatId))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(BleatShow);