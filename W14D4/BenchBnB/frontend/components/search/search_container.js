import { connect } from 'react-redux';
import { fetchBenchesTAC } from "../../actions/bench_actions"
import Search from "../search/search";

const mapStateToProps = (state) => ({
  benches: Object.keys(state.entities.benches).map(key => state.entities.benches[key])
});


const mapDispatchToProps = dispatch => ({
    fetchBenches: () => dispatch(fetchBenchesTAC()),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
