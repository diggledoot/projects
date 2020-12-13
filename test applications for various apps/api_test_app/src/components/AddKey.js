import React,{Component} from 'react';

class AddKey extends Component{
    state={
        email:'',
        desc:'',
        user:''
    }
    onChange=(e)=>{
        this.setState({[e.target.name]:e.target.value});
    }
    
    onSubmit=()=>{
        this.props.genKey(this.state.email,this.state.desc,this.state.user);
    }
    render(){
        return(
            <div>
                <form className="mt-5">
                   <div className="form-group">
                       <h5>Enter your email:</h5>
                       <input type="email" name="email" value={this.state.email} onChange={this.onChange}/>
                       <h5>Enter the purpose of your key:</h5>
                       <input type="text" name="desc" value={this.state.desc} onChange={this.onChange}/>
                       <h5>Enter your user ID:</h5>
                       <input type="text" name="user" value={this.state.user} onChange={this.onChange}/>
                       <br/>
                       <button type="button" className="btn btn-primary mt-3" onClick={this.onSubmit}>Submit</button>
                   </div>
                </form> 
            </div>
        )
    }
}

export default AddKey;