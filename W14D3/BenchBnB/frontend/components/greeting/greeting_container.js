import { connect } from 'react-redux';
import Greeting from './greeting'

const mapStateToProps = (state) => ({
    user: state.entities.users[state.session.id]
});

export default connect(mapStateToProps)(Greeting);