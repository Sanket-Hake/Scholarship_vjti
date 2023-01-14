//img
//degree name
//link

import React from "react";
import "./Degree.css";

const Degree = () => {
  return (
    <div className="degree">
      <section className="cards">
        <article className="card card--2">
          <div className="card__info-hover">

          </div>
          <div className="card__img"></div>
          <a href="/students/diploma" className="card_link">
            <div className="card__img--hover"></div>
          </a>
          <div className="card__info">
            {/* <span className="card__category"> Travel</span> */}
            <h3 className="card__title">Diploma</h3>
            <span className="card__by">
              {" "}
              <a href="/students/diploma" target="_blank" className="card__author" title="author">
                Click Here
              </a>
            </span>
          </div>
        </article>
        <article className="card card--1">
          <div className="card__img"></div>
          <a href="/students/degree" className="card_link">
            <div className="card__img--hover"></div>
          </a>
          <div className="card__info">
            {/* <span className="card__category"> Recipe</span> */}
            <h3 className="card__title">Degree</h3>
            <span className="card__by">
              {" "}
              <a href="/students/degree" target="_blank" className="card__author" title="author">
                Click Here
              </a>
            </span>
          </div>
        </article>


        {/* //Card 3 */}

        <article className="card card--3">
          <div className="card__img"></div>
          <a href="/students/masters" className="card_link">
            <div className="card__img--hover"></div>
          </a>
          <div className="card__info">
            <h3 className="card__title">Masters</h3>
            <span className="card__by">
              <a href="/students/masters" target="_blank" className="card__author" title="author">
                click here
              </a>
            </span>
          </div>
        </article>


      </section>
      <button type="button" className="btn-add"><a href="/allstudents" className="add">View All Students</a></button>
      <button type="button" className="btn-add"><a href="/students/new" className="add">Add New Student</a></button>

      {/* <button type="button" className="custom-btn btn-11 btn-add"><a href="/students/new" className="add">Add New Student</a></button> */}

    </div>
  );
};

export default Degree;
