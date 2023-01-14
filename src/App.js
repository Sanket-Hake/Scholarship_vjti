import Home from "./pages/home/Home";
import Login from "./pages/login/Login";
import Single from "./pages/single/Single";
import New from "./pages/new/New";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import { scholarshipInputs } from "./formSource";
import "./style/dark.scss";
import './App.css'
import { useContext } from "react";
import { AuthContext } from "./context/AuthContext";
import Scholarships from "./pages/scholarships/Scholarship";
import Diploma from "./pages/degrees/diploma/Diploma";
import Notice from './pages/Notice/Notice'
import Student from "./pages/student/Student";
import Master from "./pages/degrees/masters/Masters";
import Degree from "./pages/degrees/degree/Degree";
import AddScho from "./pages/addScho/addScho";
import MasterScho from "./pages/degreesScho/masters/Masters";
import DegreeScho from "./pages/degreesScho/degree/Degree";
import DiplomaScho from "./pages/degreesScho/diploma/Diploma";
import Add from "./pages/addStudent/add";
import Tat from "./pages/Table/tat";
import CentralCard from "./pages/scholarCard/centralCard";
import StateCard from "./pages/scholarCard/stateCard";
import InstituteCard from "./pages/scholarCard/instituteCard";
import FilterTable from "./components/filterTable/filterTable";
import SearchTable from "./pages/searchTable/searchTable";
import TableStudent from "./pages/tableStudent/tableStudent";
import Datatable from "./pages/scholarshipTable/datatable/Datatable";
import TableFinal from "./pages/tableStudent/tableFinal";
import AB from "./components/filterTable/AB";
import SearchFilter from "./pages/searchFilter/searchFilter";


function App() {
  const { currentUser } = useContext(AuthContext)

  const RequireAuth = ({ children }) => {
    return currentUser ? children : <Navigate to="/login" />;
  };

  return (
    <div className="app">
      <BrowserRouter>
        <Routes>
          <Route path="/">
            <Route path="/table" element={<TableStudent/>}/>
            <Route path="/tle" element={<SearchTable/>}/>
            <Route path="login" element={<Login />} />
            <Route path="notice" element={<Notice />} />
            <Route path="ab" element={<AB />} />
            <Route path="search" element={<SearchFilter />} />
            <Route
              index
              element={
                <RequireAuth>
                  <Home />
                </RequireAuth>
              }
            />
            <Route
                path="allstudents"
                element={
                  <RequireAuth>
                    <Master />
                  </RequireAuth>
                }
              />
            <Route path="students">
              <Route
                index
                element={
                  <RequireAuth>
                    <Student />
                  </RequireAuth>
                }
              />
              <Route
                path="masters"
                element={
                  <RequireAuth>
                    <Master />
                  </RequireAuth>
                }
              />
              <Route
                path="degree"
                element={
                  <RequireAuth>
                    <Degree />
                  </RequireAuth>
                }
              /><Route
                path="diploma"
                element={
                  <RequireAuth>
                    <Diploma />
                  </RequireAuth>
                }
              />
              <Route
                path="new"
                element={
                  <RequireAuth>
                    <Add/>
                  </RequireAuth>
                }
              />
            </Route>
            <Route
                path="/student/data"
                element={
                  <RequireAuth>
                    <TableFinal/>
                  </RequireAuth>
                }
              />
              <Route
                path="allscholarships"
                element={
                  <RequireAuth>
                    <Datatable />
                  </RequireAuth>
                }
              />
            <Route path="scholarships">
              <Route
                index
                element={
                  <RequireAuth>
                    <Scholarships />
                  </RequireAuth>
                }
              />
              <Route
                path="central"
                element={
                  <RequireAuth>
                    <Datatable />
                  </RequireAuth>
                }
              />
              <Route
                path="state"
                element={
                  <RequireAuth>
                    <Datatable />
                  </RequireAuth>
                }
              /><Route
                path="institute"
                element={
                  <RequireAuth>
                    <Datatable />
                  </RequireAuth>
                }
              />
              <Route
                path="new"
                element={
                  <RequireAuth>
                    <AddScho/>
                  </RequireAuth>
                }
              />
              <Route
                path=":scholarshipId"
                element={
                  <RequireAuth>
                    <Single />
                  </RequireAuth>
                }
              />
              <Route
                path="new"
                element={
                  <RequireAuth>
                    <New inputs={scholarshipInputs} title="Add New Scholarship" />
                  </RequireAuth>
                }
              />
            </Route>
          </Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
