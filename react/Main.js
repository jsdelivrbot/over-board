import React from 'react';
import Header from './components/Header';
import SideBar from './components/sideBar/SideBar';
import $ from 'jquery';

class Main extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            user: ''
        }
    }

    componentDidMount = () => {
        this.setName();
    }

    setName = () => {
        $.get('/api/me', (res) => {
            this.setState({
                user: res.username
            })
        });
    }

    render() {
        return (
            <div>
                <Header 
                    name={this.state.user}
                />
                <SideBar 
                    me={this.state.user}
                />
            </div>    
        );
    }
}

export default Main;