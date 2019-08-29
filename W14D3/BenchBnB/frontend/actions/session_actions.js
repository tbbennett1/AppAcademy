import { signup, login, logout} from "../util/session_api_util"

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveCurrentUser = currentUser => ({
    type: RECEIVE_CURRENT_USER,
    currentUser,
});

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER
});

const receiveErrors = errors => ({
    type: RECEIVE_SESSION_ERRORS,
    errors
});

export const signupTAC = formUser => dispatch => signup(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const loginTAC = formUser => dispatch => login(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const logoutTAC = () => dispatch => logout()
    .then(() => dispatch(logoutCurrentUser()));

