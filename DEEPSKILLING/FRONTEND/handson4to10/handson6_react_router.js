import React from "react";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

function Home() {
  return <h2>Home Page</h2>;
}

function Courses() {
  return <h2>Courses Page</h2>;
}

function App() {
  return (
    <Router>
      <nav>
        <Link to="/">Home</Link> | <Link to="/courses">Courses</Link>
      </nav>
      <Route path="/" exact component={Home} />
      <Route path="/courses" component={Courses} />
    </Router>
  );
}

export default App;
