import React from 'react'
import { Router, Route, Switch } from 'react-router'
import createBrowserHistory from 'history/createBrowserHistory'
import Home from './Containers/Home'
import PublishItemWrapper from './Containers/Publish'

const history = createBrowserHistory()

const router = App => (
    <Router history={history}>
        <Switch>
            <Route path="/" exact component={Home} />
            <Route path="/publish" exact component={PublishItemWrapper} />
        </Switch>
    </Router>
)

export default router;