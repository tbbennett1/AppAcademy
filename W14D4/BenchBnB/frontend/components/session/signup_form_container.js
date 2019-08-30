import { connect } from 'react-redux';
import { signupTAC } from '../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = (state, ownProps) => ({
    errors: state.errors,
    formType: "signup"
});


const mapDispatchToProps = dispatch => ({
    processForm: formUser => dispatch(signupTAC(formUser)),
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);