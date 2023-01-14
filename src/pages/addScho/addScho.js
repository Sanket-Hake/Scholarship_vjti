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
import { addDoc, collection } from "firebase/firestore";

const AddScho = () => {
  const [category, setCategory] = useState(" ");
  const [lowincome, setLowIncome] = useState(0);
  const [upincome, setUpIncome] = useState(0);
  const [type, setType] = useState("Central");
  const [name, setName] = useState(" ");

  const colRef=collection(db,"mySchemes");

  const createScho = async () => {
    await addDoc(colRef,{ category: category,
      lowincome: lowincome,
      upincome: upincome,
      type: type,
      name: name,});
  };

  const handleChange = (event) => {
    setType(event.target.value);
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
                  Add New Scholarship
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
                        placeholder="Category"
                        variant="outlined"
                        type="text"
                        fullWidth
                        required
                        style={{ border: "2px solid black" }}
                        onChange={(e) => {
                          setCategory(e.target.value);
                        }}
                      />
                    </Grid>
                    <Grid item xs={6}>
                      <TextField
                        type="number"
                        placeholder="Enter low income"
                        variant="outlined"
                        fullWidth
                        required
                        style={{ border: "2px solid black" }}
                        onChange={(e) => {
                          setLowIncome(e.target.value);
                        }}
                      />
                    </Grid>
                    <Grid item xs={6}>
                      <TextField
                        type="number"
                        placeholder="Enter up income"
                        variant="outlined"
                        fullWidth
                        required
                        style={{ border: "2px solid black" }}
                        onChange={(e) => {
                          setUpIncome(e.target.value);
                        }}
                      />
                    </Grid>
                    <Grid xs={12} sm={6} item>
                      <label style={{ fontSize: "20px", marginLeft: "15px" }}>
                        Type
                        <br />
                        <select
                          style={{
                            fontSize: "15px",
                            marginLeft: "15px",
                            height: "40px",
                          }}
                          value={type}
                          onChange={handleChange}
                        >
                          <option value="Central">Central</option>
                          <option value="State">State</option>
                          <option value="Institute">Institute</option>
                        </select>
                      </label>
                    </Grid>
                    <br /> <br /> <br /> <br />
                    <Grid item xs={12}>
                      <Button
                        type="submit"
                        variant="contained"
                        color="primary"
                        fullWidth
                        onClick={createScho}
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

export default AddScho;
