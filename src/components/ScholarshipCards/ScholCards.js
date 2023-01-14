import React from 'react'
import "./ScholCards.css";
const ScholCards = () => {
  return (
    <div>
      <section className="cards">
        <article className="card card--2">
          <div className="card__info-hover">

          </div>
          <div className="card1__img"></div>
          <a href="/scholarships/central" className="card_link">
            <div className="card1__img--hover"></div>
          </a>
          <div className="card__info">
            {/* <span className="card__category"> Travel</span> */}
            <h3 className="card__title">Centre</h3>
            <span className="card__by">
              {" "}
              <a href="/scholarships/central" target="_blank" className="card__author" title="author">
                Click Here
              </a>
            </span>
          </div>
        </article>
        <article className="card card--1">
          <div className="card1__img"></div>
          <a href="/scholarships/state" className="card_link">
            <div className="card1__img--hover"></div>
          </a>
          <div className="card__info">
            {/* <span className="card__category"> Recipe</span> */}
            <h3 className="card__title">State</h3>
            <span className="card__by">
              {" "}
              <a href="/scholarships/state" target="_blank" className="card__author" title="author">
                Click Here
              </a>
            </span>
          </div>
        </article>


        {/* //Card 3 */}

        <article className="card card--3">
          <div className="card1__img"></div>
          <a href="/scholarships/institute" className="card_link">
            <div className="card1__img--hover"></div>
          </a>
          <div className="card__info">
            <h3 className="card__title">Institute</h3>
            <span className="card__by">
              <a href="/scholarships/institute" target="_blank" className="card__author" title="author">
                Click here
              </a>
            </span>
          </div>
        </article>
      </section>
      <button type="button" className="btn-add"><a href="/allscholarships" className="add">View All Scholarships</a></button>
      <button type="button" className="btn-add"><a href="/scholarships/new" className="add">Add New Scholarships</a></button>

    </div>
  )
}

export default ScholCards