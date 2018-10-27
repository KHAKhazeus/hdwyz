import React from 'react'
import { Router, Route, Switch } from 'react-router'
import createBrowserHistory from 'history/createBrowserHistory'
import Home from './Containers/Home'
import Publish from './Containers/Publish'
import View from "./Containers/View"

const history = createBrowserHistory()

const router = App => (
    <Router history={history}>
        <Switch>
            <Route path="/" exact component={Home} />
            <Route path="/publish" exact component={Publish} />
            <Route path="/view" exact component={View} />
        </Switch>
    </Router>
)

export default router;