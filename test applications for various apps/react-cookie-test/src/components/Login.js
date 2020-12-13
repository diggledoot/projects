import React, { Component } from 'react';
import {Button} from "react-bootstrap";
class Login extends Component {
  
  // setCookie=()=>{
  //   Cookies.set("api","Cookie");
  //   return <Redirect to="/"/>
  // }
  componentDidMount(){
    console.log("Inside Login.js");
    console.log(this.props);
  }
  onClick=()=>{
    this.props.setCookie();
    this.props.history.replace("/dashboard");
  }
  render() {
    return (
      <div>
        <h1>Login page!</h1>
        <Button onClick={this.onClick}>Set Cookie to Log In</Button>
      </div>
      
    );
  }
}

export default Login;
