import "./datatable.css";
import { DataGrid } from "@mui/x-data-grid";
import { userColumns, userRows } from "../../../../datatablesource";
import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import { collection, onSnapshot } from "firebase/firestore";
import { db } from "../../../../firebase";
import * as React from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";

const Datatable = () => {
  const [data, setData] = useState([]);

  useEffect(() => {
    // LISTEN (REALTIME)
    const unsub = onSnapshot(
      collection(db, "Users"),
      (snapShot) => {
        let list = [];
        snapShot.docs.forEach((doc) => {
          list.push({ id: doc.id, ...doc.data() });
        });
        // const da=JSON.stringify(list)
        setData(data);
        // console.log(da)
        
        // console.log(data[0].id)
        // console.log(da[0].id);
        // let stu = list
        //   .filter(function (student) {
        //     return student.Department === "Degree";
        //   })
        //   .map(function (student) {
        //     return student.name;
        //   });
        // setData(stu);
      },
      (error) => {
        console.log(error);
      }
    );

    return () => {
      unsub();
    };
  }, []);

  const actionColumn = [
    {
      field: "action",
      headerName: "Action",
      width: 200,
      index: 1,
      renderCell: (index) => {
        return (
          <div className="cellAction">
            <Link to={`/students/${index}`} style={{ textDecoration: "none" }}>
              <div className="viewButton">View</div>
            </Link>
          </div>
        );
      },
    },
  ];
  return (
    <TableContainer component={Paper} style={{ margin: "10px" }}>
      <Table sx={{ minWidth: 550, maxWidth: 1000 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Name</TableCell>
            <TableCell align="right">Reg No</TableCell>
            <TableCell align="right">Email</TableCell>
            <TableCell align="right">Mobile No.</TableCell>
            <TableCell align="right">Department</TableCell>
            <TableCell align="right">Branch</TableCell>
            <TableCell align="right">Income</TableCell>
            <TableCell align="right">Action</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          
          {data.map((row, index) => (
            <TableRow
              key={row.name}
              sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
            >
              <TableCell component="th" scope="row">
                {row.Branch}
              </TableCell>
              <TableCell align="right" component="th" scope="row">{row.Department}</TableCell>
              <TableCell align="right" component="th" scope="row">{row.Email}</TableCell>
              <TableCell align="right" component="th" scope="row">{row.Mobile_No}</TableCell>
              <TableCell align="right" component="th" scope="row">{row.Department}</TableCell>
              <TableCell align="right" component="th" scope="row">{row.Branch}</TableCell>
              <TableCell align="right">{row.Income}</TableCell>
              <TableCell align="right">
              <button style={{width:'50px',borderRadius:'20px',color:'white',backgroundColor:'black'}}>
                <a href={`/student/data`} style={{textDecoration:'none',color:'white'}}>View</a>
                </button>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default Datatable;
