import React, { Component } from 'react';
import {Button} from 'react-bootstrap';
import Cookie from 'js-cookie';
class Dashboard extends Component{
    state={
        cookie:''
    }
    onChange=(e)=>{
        this.setState({
            [e.target.name]:e.target.value
        })
    }

    setCookie=()=>{
        Cookie.set("api",this.state.cookie,{expires:7});
        alert("Cookie set please check!");
    }
    getCookie=()=>{
        var cookie = Cookie.get("api");
        alert(cookie);
    }

    deleteCookie=()=>{
        this.props.deleteCookie();
        this.props.history.replace("/login");
        alert("Cookie deleted!");
    }
    render(){
        return(
            <div>
                <h1>Dashboard page!</h1>
                <h5>Enter whatever for cookie storage: 
                    <input className="ml-3" type="text" name="cookie" value={this.state.value} onChange={this.onChange}/>
                </h5>

                <Button onClick={this.setCookie}>Set Cookie</Button>
                <br/>
                <Button className="mt-1" onClick={this.getCookie}>Get Cookie</Button>
                <br/>
                <Button className="mt-1" onClick={this.deleteCookie}>Delete Cookie/Logout</Button>
            </div>
        )
    }
}

export default Dashboard;