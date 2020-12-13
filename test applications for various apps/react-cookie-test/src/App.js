import React,{Component} from 'react';
import './App.css';

//external imports
import 'bootstrap/dist/css/bootstrap.min.css';
import {BrowserRouter,Route,Switch,Redirect} from 'react-router-dom';
import Dashboard from './components/Dashboard';
import Login from './components/Login';
import Cookie from 'js-cookie';
import Nav from './components/Nav';
import Error from './components/Error';
class App extends Component{
  state={
    redirect:false
  }
  componentDidMount(){
    if(Cookie.get("api")!=null){
      console.log("There exists a cookie");
      this.setState({
        redirect:false
      });
    }else{
      console.log("There is no cookie");
      this.setState({
        redirect:true
      });
    }
  }
  

  setCookie=()=>{
    //some method to generate a token, Cookie is a standin
    Cookie.set("api","Cookie");
    console.log(Cookie.get("api"));
    this.setState({
      redirect:false
    });
  }
  
  deleteCookie=()=>{
    Cookie.remove("api");
    this.setState({
      redirect:true
    })
  }
  render(){
    return (
      <BrowserRouter>
        <div className="container">
            <div className="row">
              <div className="col-12 text-left mt-5">
                {/* <Nav/> */}
                <Switch>
                  {/* render provides the route props, which are location, match,history*/}
                  <Route path="/dashboard" render={route_props=>(
                    this.state.redirect?<Redirect to="/login"/>:<Dashboard {...route_props} deleteCookie={this.deleteCookie}/>
                  )}/> 
                       
                  
                  <Route path="/login" render={route_props=>(
                    <Login {...route_props} setCookie={this.setCookie}/>
                  )}/>
                  <Route exact path="/" render={()=>(
                    <Redirect to="/dashboard"/>
                  )}/>
                  <Route component={Error}/>
                </Switch>
                
              </div>
            </div>
          </div>
      </BrowserRouter>
        
      
    );
  }
}

export default App;
