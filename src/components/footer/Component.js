import React from 'react';
import './styles.css';

function Footer(props) {

    var d = new Date();
    const curr_year = d.getFullYear();

    return(
        <React.Fragment>
            <footer key="app-footer">
                <div className="footer">
                    <div className="row justify-content-center">             
                        <div className="col-auto">
                            <p>© Copyright {curr_year} shalimmora.com all rights reserved.</p>
                        </div>
                    </div>
                </div>
            </footer>
        </React.Fragment>
    );
}

export default Footer;