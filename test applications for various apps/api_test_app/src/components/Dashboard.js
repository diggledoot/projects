import React,{Component} from 'react';
import axios from 'axios';
import AddUser from './AddUser';
import ShowUser  from './ShowUser';
import AddKey from './AddKey'
class Dashboard extends Component{
    state={
        users:[]
    }
    componentDidMount(){
        var url="http://localhost/connections/api_management_personal/get.php";
        axios.get(url).then(res=>this.setState({users:res.data}));

    }
    getUsers=()=>{
        var url="http://localhost/connections/api_management_personal/get.php";
        axios.get(url).then(res=>this.setState({users:res.data}));
    }
    insertUser=(email,pwd)=>{
        // console.log("This is from insertUser "+email+" "+pwd);
        var url = 'http://localhost/connections/api_management_personal/insert.php';
        var payload={
            email,
            pwd
        }
        axios.post(url,JSON.stringify(payload))
            .then(res=>{
                this.getUsers();
                this.forceUpdate();
            }).catch(error=>{
                console.log(error);
            });
        
    }
    delUser=(id)=>{
        var url="http://localhost/connections/api_management_personal/delete.php";
        var payload={
            id
        }
        axios.post(url,JSON.stringify(payload))
            .then(res=>{
                this.setState({
                    users:[...this.state.users.filter(item=>item.user_id!==id)]
                })
            }).catch(error=>{
                console.log(error);
            })
    }

    genKey=(email,desc,user)=>{
        // 
        var url = "http://localhost/connections/api_management_personal/api_gen.php";
        var payload={
            email,
            desc,
            user
        }
        axios.post(url,JSON.stringify(payload))
            .then(res=>{
                console.log(res.data);
            }).catch(error=>{
                console.log(error);
            })
    }
    render(){
        return(
            <div>
                <div className="row">
                    <div className="col-6 border border-primary">
                        <AddUser insertUser={this.insertUser}/>
                    </div>
                    <div className="col-6 border border-primary">
                        <AddKey users={this.users} genKey={this.genKey}/>
                    </div>
                </div>
                <div className="row">
                    <div className="col-12">
                        <ShowUser users={this.state.users} delUser={this.delUser}/>
                    </div>
                </div>
            </div>
            
        )
    }
}

export default Dashboard;