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
                        Shalim Mora es lo MAXIMO.
                        <hr />
                        </p>
                        <br />
                        <p>Lawrence is the best :)</p>
                    </header>
                </div>
            </React.Fragment>
            );
        
        }
}

export default Home;
