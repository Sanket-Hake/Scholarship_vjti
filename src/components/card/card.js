import React from "react";
import "./card.css";
const Card = ({ name, type, category, lowincome, upincome }) => {
  return (
    <div className="wrapper">
      <h2>{name}</h2>
      {/* <p>{category}</p> */}
      {/* <p>{type}</p>  */}
      <p>{lowincome}</p>
       <p>{upincome}</p>
    </div>
  );
};

export default Card;
