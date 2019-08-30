import { connect } from 'react-redux';
import Greeting from './greeting'

import { logoutTAC } from "../../actions/session_actions"

const mapStateToProps = (state) => ({
    user: state.entities.users[state.session.id]
});

const mapDispatchToProps = dispatch => ({
    logout: () => dispatch(logoutTAC()),
});

export default connect(mapStateToProps, mapDispatchToProps)(Greeting);