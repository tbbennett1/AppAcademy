import { connect } from 'react-redux';
import { loginTAC } from '../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = (state, ownProps) => ({
    errors: state.errors,
    formType: "login"
});


const mapDispatchToProps = dispatch => ({
    processForm: formUser => dispatch(loginTAC(formUser)),
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);