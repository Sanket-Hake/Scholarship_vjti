import React from 'react'
import "./progressBar.css";

const progressBar = () => {
  return (
    <div className="wrapper">
        <h1>Vertical progress bar</h1>
  <ul className="step-progress">
    <li className="step-progress-item is-done"><strong>Create new Event</strong></li>
    <li className="step-progress-item is-done"><strong>Add Sessions</strong></li>
    <li className="step-progress-item current"><strong>Create signup template</strong></li>
    <li className="step-progress-item"><strong>Deliveries</strong></li>
    <li className="step-progress-item"><strong>Overview</strong></li>
  </ul>
    </div>
  )
}

export default progressBar