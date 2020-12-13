import React, { Component } from 'react';
import {NavLink} from 'react-router-dom';
class Nav extends Component {
  render() {
    return (
      <div>
          <NavLink className="mr-2"to="/dashboard">Dashboard</NavLink>
          <NavLink to="/login">Login</NavLink>
      </div>
    );
  }
}

export default Nav;
