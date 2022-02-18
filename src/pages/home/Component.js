import React, { Component } from 'react';

import './styles.css';
import logo from './logo.svg';


class Home extends Component {

    render() {

        return(
            <React.Fragment>
                <div className="App">
                    <header className="App-header">
                        <img src={logo} className="App-logo" alt="logo" />
                        <p>
                        <hr />
                        </p>
                        <br />
                        <p>Love you Lawrence ❤️</p>
                    </header>
                </div>
            </React.Fragment>
            );
        
        }
}

export default Home;
