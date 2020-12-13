import React,{Component} from 'react';
import {Button,Modal} from 'react-bootstrap';
class Test extends Component{
    constructor(props) {
      super(props)
    
      this.state = {
         show:false,
         data:"test"
      };
      this.myRef = React.createRef();
    };
    
    onClick=()=>{
        this.setState({
            show:!this.state.show
        });
    }
    // onChange=(e)=>{
    //     this.setState({
    //         [e.target.name]:e.target.value
    //     })
    // }
    submit=()=>{
        // alert(this.myRef.current.value);
        this.setState({
            data:this.myRef.current.value
        })
        this.onClick();
    }
    render(){
        return(
            <div>
                <h1>{this.state.data}</h1>
                <Button onClick={this.onClick}>Open Modal</Button>
                <Modal show={this.state.show} onHide={this.onClick}>
                    <Modal.Header closeButton>Modal Header</Modal.Header>
                    <Modal.Body>
                        <input type="text" ref={this.myRef} defaultValue="" placeholder="Input your changes" name="data"/>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="success" onClick={this.submit}>Submit</Button>
                        <Button variant="danger" onClick={this.onClick}>Close</Button>
                    </Modal.Footer>
                </Modal>
            </div>
        )
    }
}
export default Test;