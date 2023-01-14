import "./list.css";
import Sidebar from "../../components/sidebar/Sidebar";
import Navbar from "../../components/navbar/Navbar";
import TableDemo from "./table";
// import Datatable from "../../components/datatable/Datatable"

const Tat = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <Navbar />
        <div style={{margin:"10px"}}>
        <TableDemo />
        </div>
      </div>
    </div>
  );
};

export default Tat;
