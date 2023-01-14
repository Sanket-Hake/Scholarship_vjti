import React, { useState } from "react";
import "./Notice.css";
import { db } from "../../firebase";
import Sidebar from "../../components/sidebar/Sidebar";
import Navbar from "../../components/navbar/Navbar";
import { addDoc, collection } from "firebase/firestore";

const Contact = () => {
  const [message, setMessage] = useState("");

  const colRef = collection(db, "Notification");

  const handleSubmit = async (e) => {
    e.preventDefault();
    await addDoc(colRef, { message: message });
  };

  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <Navbar />
        <form className="form" onSubmit={handleSubmit}>
          <h1 style={{ textAlign: "center" }}>Add Notice</h1>
          <label>Message</label>
          <textarea
            placeholder="Message"
            value={message}
            onChange={(e) => setMessage(e.target.value)}
          ></textarea>

          <button
            type="submit"
            onClick={handleSubmit}
          >
            Submit
          </button>
        </form>
      </div>
    </div>
  );
};

export default Contact;
