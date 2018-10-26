import React, { Component } from 'react';
import './App.css';
import {Button} from 'antd-mobile';

class App extends Component {


  render() {
    return (
      <div className="App">
          <p id="HomeTitle">BooHub</p>
          <div align="center"><Button type="primary" id="PublishPageButton" size="large" href="/test.html">发表评论</Button></div>
          <div align="center"><Button type="primary" id="ViewPageButton" size="large" href="/test.html">查看评论</Button></div>
      </div>
    );
  }
}

export default App;
