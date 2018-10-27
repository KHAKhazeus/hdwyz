import React, {Component} from 'react'
import {Button} from 'antd-mobile'
import {Route} from "react-router-dom";
import UpNav from '../../Components/UpNav/UpNav'

class Publish extends Component{
    render(){
        return(
            <div>
            <UpNav navname="发表评论"/>
            <p> Test </p>
            </div>
        );
    }
}

export default Publish