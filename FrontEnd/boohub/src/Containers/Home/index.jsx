import React from 'react'
import './home.css';
import {Button} from "antd-mobile";
import {Router, Route, Link} from 'react-router-dom';
import createBrowserHistory from 'history/createBrowserHistory'
import Publish from '../Publish'

function Home() {

    return(
        <div>
            <p id="HomeTitle" align="center">BooHub</p>
            <div align="center">
                <Link to="/publish">
                <Button type="primary" id="PublishPageButton" size="large" href={Publish}>
                        发表评论
                </Button>
                </Link>
            </div>
            <div align="center">
                <Button type="primary" id="ViewPageButton" size="large">
                    查看评论
                </Button>
            </div>
        </div>
    );
}

export default Home