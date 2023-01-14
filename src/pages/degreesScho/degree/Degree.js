import "./Degree.css"
import Sidebar from "../../../components/sidebar/Sidebar"
import Navbar from "../../../components/navbar/Navbar"
import Datatable from "./datatable/Datatable"

const DegreeScho = () => {
    return (
        <div className="list">
            <Sidebar />
            <div className="listContainer">
                <Navbar />
                <Datatable />
            </div>
        </div>
    )
}

export default DegreeScho