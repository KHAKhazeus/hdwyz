import React, {Component} from 'react'
import {NavBar, Icon} from 'antd-mobile'
import {Router, Route} from 'react-router-dom'

class UpNav extends Component{
    render(){
        return(
            <NavBar
                mode='light'
                icon={<Link to="/"><Icon type="left"/>}
            />
        );
    }
}