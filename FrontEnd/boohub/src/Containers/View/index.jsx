
import React, {Component} from 'react'
import { Drawer, List, NavBar, Icon, Button} from 'antd-mobile';
import {Link} from 'react-router-dom'
import category from '../../Data/Category'
import "./view.css"
import SearchBarWrapper from '../../Components/SearchBar/SearchBarWrapper'
import Demo from "../ListView";

class View extends Component{

    state = {
        open: false,
    };
    onOpenChange = () => {
        this.setState({ open: !this.state.open });
    };
    render() {
        // fix in codepen
        const sidebar = (<List>
            {category.map((i, index) => {

                return (
                    <List.Item key={index} onClick={()=>alert('hello')}>
                        {index}
                    </List.Item>);

                })
            }
        </List>);

        return (<div>
            <Drawer
                className="category-drawer"
                style={{ minHeight: document.documentElement.clientHeight }}
                enableDragHandle
                contentStyle={{ color: '#A6A6A6', textAlign: 'center', paddingTop: 42 }}
                sidebar={sidebar}
                open={this.state.open}
                onOpenChange={this.onOpenChange}
            >
            </Drawer>
            <NavBar icon={<Icon type="ellipsis"/>} onLeftClick={this.onOpenChange}>查看评论</NavBar>
            {/*TODO: backend exchange*/}
            <SearchBarWrapper submit={(value)=>{alert(value)}}/>
            <Demo/>
            </div>);
    }
}


export default View;