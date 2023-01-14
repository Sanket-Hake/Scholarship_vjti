import "./scholarship.css"
import Sidebar from "../../components/sidebar/Sidebar"
import Navbar from "../../components/navbar/Navbar"
import ScholCards from "../../components/ScholarshipCards/ScholCards"
// import ScholarshipData from "../../components/scholarship/scholarshipData"

const Scholarships = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <Navbar />
        {/* <ScholarshipData/> */}
        <ScholCards />
      </div>
    </div>
  )
}

export default Scholarships