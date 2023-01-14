import React,{useState,useEffect} from "react";
import Card from "../../components/card/card";
import "./card.css";
import { collection, onSnapshot } from "firebase/firestore";
import { db } from "../../firebase";
import Navbar from "../../components/navbar/Navbar"
import Sidebar from "../../components/sidebar/Sidebar.jsx"


const StateCard = () => {
    const [data, setData] = useState([]);

  useEffect(() => {
    // LISTEN (REALTIME)
    const unsub = onSnapshot(
      collection(db, "mySchemes"),
      (snapShot) => {
        let list = [];
        snapShot.docs.forEach((doc) => {
          list.push({ id: doc.id, ...doc.data() });
        });
        setData(list);
        // console.log(data[0].id)
        console.log(list[0].id);
      },
      (error) => {
        console.log(error);
      }
    );

    return () => {
      unsub();
    };
  }, []);
  return (
    <div className="list">
    <Sidebar/>
    <div className="listContainer">
      <Navbar />
      <div style={{margin:"10px"}}>
      <div className="row">
      {data.map((row, index) => (
      <div className="column">
        <div className="card1">
          <Card
            name={row.name}
            type={row.type}
            category={row.category}
            lowincome={row.lowincome}
            upincome={row.upincome}
          />
        </div>
      </div>
        ))}
    </div>
    </div>
  </div>
  </div>

  );
};

export default StateCard;
