import {
  Grid,
  TextField,
  Button,
  Card,
  CardContent,
  Typography
} from "@material-ui/core";
import Sidebar from "../../components/sidebar/Sidebar";
import Navbar from "../../components/navbar/Navbar";
import React, { useState } from "react";
import { db } from "../../firebase";
import { doc, setDoc } from "firebase/firestore";

const Add = () => {
const [branch, setBranch] = useState(" ");
  const [dept, setDept] = useState("Diploma");
  const [email, setEmail] = useState(" ");
  const [income, setIncome] = useState(0);
  const [id, setId] = useState(0);
  const [mobileno, setMobileno] = useState(0);
  const [name, setName] = useState(" ");

  const data = {
    Email: email,
    Branch: branch,
    Registration: id,
    Department: dept,
    Income: income,
    Mobile_No: mobileno,
    Name:name
  };

  const createStudent = async () => {
    await setDoc(doc(db, "Users", id), data);
  };

  const handleChange = (event) => {
    setDept(event.target.value);
  };

  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <Navbar />
        <div className="App">
          <Typography gutterBottom variant="h3" align="center"></Typography>
          <Grid>
            <Card
              style={{ maxWidth: 450, padding: "20px 5px", margin: "0 auto" }}
            >
              <CardContent>
                <Typography
                  gutterBottom
                  variant="h4"
                  style={{ textAlign: "center" }}
                >
                  Add New Student
                </Typography>
                <Typography
                  variant="body2"
                  color="textSecondary"
                  component="p"
                  gutterBottom
                ></Typography>
                <form>
                  <Grid container spacing={1}>
                    <Grid xs={12} sm={6} item>
                      <TextField
                        placeholder="Enter name"
                        variant="outlined"
                        fullWidth
                        required
                        style={{ border: "2px solid black" }}
                        onChange={(e) => {
                            setName(e.target.value);
                          }}
                      />
                    </Grid>
                    <Grid xs={12} sm={6} item>
                      <TextField
                        placeholder="Enter registration no."
                        variant="outlined"
                        type="number"
                        fullWidth
                        required
                        style={{ border: "2px solid black" }}
                        onChange={(e) => {
                          setId(e.target.value);
                        }}
                      />
                    </Grid>
                    <Grid item xs={12}>
                      <TextField
                        type="email"
                        placeholder="Enter email"
                        variant="outlined"
                        fullWidth
                        required
                        style={{ border: "2px solid black" }}
                        onChange={(e) => {
                          setEmail(e.target.value);
                        }}
                      />
                    </Grid>
                    <Grid item xs={6}>
                      <TextField
                        type="number"
                        placeholder="Enter mobile number"
                        variant="outlined"
                        fullWidth
                        required
                        style={{ border: "2px solid black" }}
                        onChange={(e) => {
                          setMobileno(e.target.value);
                        }}
                      />
                    </Grid>
                    <Grid item xs={6}>
                      <TextField
                        type="number"
                        placeholder="Enter income"
                        variant="outlined"
                        fullWidth
                        required
                        style={{ border: "2px solid black" }}
                        onChange={(e) => {
                          setIncome(e.target.value);
                        }}
                      />
                    </Grid>
                    <Grid xs={12} sm={6}>
                      <label style={{fontSize: "20px",marginLeft:'15px'}}>
                        Department<br/>
                        <select style={{fontSize: "15px",marginLeft:'15px',height:'40px'}}
                          value={dept}
                          onChange={handleChange}
                        >
                          <option value="Diploma">Diploma</option>
                          <option value="Degree">Degree</option>
                          <option value="M.Tech">M.Tech</option>
                        </select>
                      </label>
                    </Grid>
                    <Grid xs={12} sm={6} item>
                      <TextField
                        placeholder="Enter branch"
                        variant="outlined"
                        fullWidth
                        required
                        style={{ border: "2px solid black" }}
                        onChange={(e) => {
                            setBranch(e.target.value);
                          }}
                      />
                    </Grid>
                    <br /> <br /> <br /> <br />
                    <Grid item xs={12}>
                      <Button
                        type="submit"
                        variant="contained"
                        color="primary"
                        fullWidth
                        onClick={createStudent}
                      >
                        Submit
                      </Button>
                    </Grid>
                  </Grid>
                </form>
              </CardContent>
            </Card>
          </Grid>
        </div>
      </div>
    </div>
  );
};

export default Add;
