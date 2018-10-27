import React, {Component} from 'react'
import ReactDOM from 'react-dom'
import {Route} from "react-router-dom";
import { List, TextareaItem } from 'antd-mobile';
import { Button, WhiteSpace, WingBlank } from 'antd-mobile';
import { createForm } from 'rc-form';
//import category from '../../Data/Category'
import UpNav from '../../Components/UpNav/UpNav';
import testMap from '../../Map.png'
import './publish.css'


class Publish extends Component{
    render(){
        const { getFieldProps } = this.props.form;
        return(
            <Route>
                <div>
                    <UpNav navname="发表评论"/>
                    <p>
                        <List renderHeader={() => ''}>

                            <TextareaItem
                                {...getFieldProps('note3')}
                                title="地址"
                                autoHeight
                                labelNumber={2}
                            />
                            <div id='mapImage'>
                            <img src={testMap} alt="map"/>
                            </div>
                            <TextareaItem
                                {...getFieldProps('note1')}
                                rows={1}
                                placeholder="请输入地址"
                            />
                        </List>

                        <List renderHeader={() => ''}>
                            <TextareaItem
                                {...getFieldProps('note3')}
                                title="标题"
                                autoHeight
                                labelNumber={2}
                            />
                            <TextareaItem
                                {...getFieldProps('note1')}
                                rows={1}
                                placeholder="请输入标题"
                            />
                        </List>

                        <List renderHeader={() => ''}>
                            <TextareaItem
                                {...getFieldProps('note3')}
                                title="评论内容"
                                autoHeight
                                labelNumber={2}
                            />
                            <TextareaItem
                                {...getFieldProps('note1')}
                                rows={5}
                                placeholder="请输入评论内容"
                            />
                        </List>

                        <WingBlank size="lg">
                            <WhiteSpace size="lg" />
                            <Button type="primary">发布评论</Button><WhiteSpace />
                        </WingBlank>
                    </p>
                </div>
            </Route>
        );
    }
}

const PublishItemWrapper = createForm()(Publish);

export default PublishItemWrapper