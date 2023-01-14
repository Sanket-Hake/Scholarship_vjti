import Sidebar from "../../components/sidebar/Sidebar";
import Navbar from "../../components/navbar/Navbar";
import "./home.css";
import Widget from "../../components/widget/Widget";


const Home = () => {
  return (
    <div className="home">
      <Sidebar />
      <div className="homeContainer">
        <Navbar />
        <div className="widgets">
          <Widget type="student" />
          <Widget type="scholarship" />
        </div>
        <div className="widgets">
          <Widget type="studentreg" />
          <Widget type="scholarshipreg" />
        </div>

      </div>
    </div>
  );
};

export default Home;
