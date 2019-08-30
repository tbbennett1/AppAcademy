import React from 'react';
import { Link } from 'react-router-dom';

export default ({ user, logout }) => {
  
  const display = user ? (
  <header className="greeting-bar">
    <h4>Welcome {user.username}!</h4>
    <button onClick={logout}>Log Out</button>
  </header> ) : (
    <div>
        <Link className="btn" to="/signup">Sign Up</Link>
        <Link className="btn" to="/login">Log In</Link>
    </div> 
  );

    return (
        <header className="nav-bar">
            <div>
                {display}
            </div>
        </header>
    );
};