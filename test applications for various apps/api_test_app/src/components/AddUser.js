import React,{Component} from 'react';

class AddUser extends Component{
    state={
        email:'',
        pwd:''
    }
    onChange=(e)=>{
        this.setState({[e.target.name]:e.target.value});
    }

    onSubmit=()=>{
        this.props.insertUser(this.state.email,this.state.pwd);
    }
    render(){
        return(
            <div>
               <form className="mt-5">
                   <div className="form-group">
                       <h5>
                           Enter your email: 
                       </h5>
                       <input type="email" name="email" value={this.state.email} onChange={this.onChange}/>
                       <h5>
                           Enter your password: 
                       </h5>
                       <input type="password" name="pwd" value={this.state.pwd} onChange={this.onChange}/>
                       <br/>
                       <button type="button" className="btn btn-primary mt-3" onClick={this.onSubmit}>Submit</button>
                   </div>
                </form> 
            </div>
        )
    }
}

export default AddUser;