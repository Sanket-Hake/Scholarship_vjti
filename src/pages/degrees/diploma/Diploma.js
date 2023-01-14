import "./Diploma.css";
import Sidebar from "../../../components/sidebar/Sidebar";
import Navbar from "../../../components/navbar/Navbar";
import Datatable from "./datatable/Datatable";

const Diploma = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <Navbar />
        <div style={{ margin: "5px" }}>
          <Datatable />
        </div>
      </div>
    </div>
  );
};

export default Diploma;
