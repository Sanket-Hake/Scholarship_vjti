import "./Student.css"
import Sidebar from "../../components/sidebar/Sidebar"
import Navbar from "../../components/navbar/Navbar"
import Degree from "../../components/degree/degree"

const Student = () => {
    return (
        <div className="list">
            <Sidebar />
            <div className="listContainer">
                <Navbar />
                <Degree />
            </div>
        </div>
    )
}

export default Student;