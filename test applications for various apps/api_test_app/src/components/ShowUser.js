import React,{Component} from 'react';

class ShowUser extends Component{
    render(){
        return(
            <div>
                <h5><strong>List of users</strong></h5>
                <div className="table-responsive" style={{height:'300px'}}>
                    <table className="table">
                        <thead>
                        <tr>
                            <th style={{width:"10%"}}>ID</th>
                            <th style={{width:"70%"}}>Email</th>
                            <th style={{width:"20%"}}>Options</th>
                        </tr>
                        </thead>
                        <tbody>
                            {this.props.users.map((data,i) => {
                                return (
                                    <tr key={i}>
                                        <td>{data.user_id}</td>
                                        <td>{data.email}</td>
                                        <td>
                                            <button className="btn btn-danger mr-1" onClick={this.props.delUser.bind(this,data.user_id)}>Delete</button>    
                                        </td>
                                    </tr>
                                )
                                })}
                        </tbody>
                    </table>
                </div>
            </div>
        );
    }
}

export default ShowUser;