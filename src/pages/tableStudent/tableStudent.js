import React, { useState, Fragment } from "react";
import { nanoid } from "nanoid";
import ReadOnlyRow from "./ReadOnlyRow";
import EditableRow from "./EditableRow";
import { db } from "../../firebase";
import { updateDoc, collection, doc, setDoc } from "firebase/firestore";
import { Grid } from "@material-ui/core";

const TableStudent = ({ id }) => {
  const [contacts, setContacts] = useState([]);
  const colRef = collection(db, "fees");
  const [addFormData, setAddFormData] = useState({
    regno: 1,
    total: 0,
    feestu: 0,
    mahadbt1: 0,
    mahadbt2: 0,
    balance: 0,
    year: "FY",
    status: "Not checked",
  });
  const createFees = async () => {
    await setDoc(doc(db, "fees", addFormData.regno), addFormData);
  };
  const updateFees = async () => {
    await updateDoc(colRef, addFormData);
  };

  const [editFormData, setEditFormData] = useState({
    regno: 0,
    total: 0,
    feestu: 0,
    mahadbt1: 0,
    mahadbt2: 0,
    balance: 0,
    year: "FY",
    status: "Not checked",
  });

  const [editContactId, setEditContactId] = useState(null);

  const handleAddFormChange = (event) => {
    event.preventDefault();

    const fieldName = event.target.getAttribute("name");
    const fieldValue = event.target.value;

    const newFormData = { ...addFormData };
    newFormData[fieldName] = fieldValue;

    setAddFormData(newFormData);
  };

  const handleEditFormChange = (event) => {
    event.preventDefault();

    const fieldName = event.target.getAttribute("name");
    const fieldValue = event.target.value;

    const newFormData = { ...editFormData };
    newFormData[fieldName] = fieldValue;

    setEditFormData(newFormData);
  };

  const handleAddFormSubmit = (event) => {
    event.preventDefault();

    const newContact = {
      id: nanoid(),
      regno: addFormData.regno,
      total: addFormData.total,
      feestu: addFormData.feestu,
      mahadbt1: addFormData.mahadbt1,
      mahadbt2: addFormData.mahadbt2,
      balance: addFormData.balance,
      year: addFormData.year,
      status: addFormData.status,
    };
    createFees();
    const newContacts = [...contacts, newContact];
    setContacts(newContacts);
  };

  const handleEditFormSubmit = (event) => {
    event.preventDefault();

    const editedContact = {
      id: editContactId,
      regno: editFormData.regno,
      total: editFormData.total,
      feestu: editFormData.feestu,
      mahadbt1: editFormData.mahadbt1,
      mahadbt2: editFormData.mahadbt2,
      balance: editFormData.balance,
      status: editFormData.status,
      year: editFormData.year,
    };

    const newContacts = [...contacts];

    const index = contacts.findIndex((contact) => contact.id === editContactId);

    newContacts[index] = editedContact;

    setContacts(newContacts);
    setEditContactId(null);
    updateFees();
  };

  const handleEditClick = (event, contact) => {
    event.preventDefault();
    setEditContactId(contact.id);

    const formValues = {
      regno: contact.regno,
      total: contact.total,
      feestu: contact.feestu,
      mahadbt1: contact.mahadbt1,
      mahadbt2: contact.mahadbt2,
      balance: contact.balance,
      status: contact.status,
      year: contact.year,
    };

    setEditFormData(formValues);
  };

  const handleCancelClick = () => {
    setEditContactId(null);
  };

  const handleDeleteClick = (contactId) => {
    const newContacts = [...contacts];

    const index = contacts.findIndex((contact) => contact.id === contactId);

    newContacts.splice(index, 1);

    setContacts(newContacts);
  };

  return (
    <div className="app-container">
      <form onSubmit={handleEditFormSubmit}>
        <table>
          <thead>
            <tr>
              <th>Reg no.</th>
              <th>Year</th>
              <th>Total Fees</th>
              <th>Fees paid by student</th>
              <th>MahaDbt Installment 1</th>
              <th>MahaDbt Installment 2</th>
              <th>Balance</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {contacts.map((contact, index) => (
              <Fragment key={index}>
                {editContactId === contact.id ? (
                  <EditableRow
                    editFormData={editFormData}
                    handleEditFormChange={handleEditFormChange}
                    handleCancelClick={handleCancelClick}
                  />
                ) : (
                  <ReadOnlyRow
                    contact={contact}
                    handleEditClick={handleEditClick}
                    handleDeleteClick={handleDeleteClick}
                  />
                )}
              </Fragment>
            ))}
          </tbody>
        </table>
      </form>

      <h2 style={{marginTop:'20px'}}>Add Details About Fees</h2>
      <form
        onSubmit={handleAddFormSubmit}
        style={{
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          width: "200px",
          margin: "5px",
        }}
      >
        <div style={{ display: "flex", flexDirection: "row" }}>
          <input
            type="number"
            name="regno"
            required="required"
            placeholder="Enter reg no..."
            onChange={handleAddFormChange}
            style={{ padding: "10px", margin: "10px" }}
          />
          <input
            type="text"
            name="year"
            required="required"
            placeholder="Enter year..."
            onChange={handleAddFormChange}
            style={{ padding: "10px", margin: "10px" }}
          />
          <input
            type="number"
            name="total"
            required="required"
            placeholder="Enter total fees..."
            onChange={handleAddFormChange}
            style={{ padding: "10px", margin: "10px" }}
          />
        </div>
        <div style={{ display: "flex", flexDirection: "row" }}>
          <input
            type="number"
            name="feestu"
            required="required"
            placeholder="Enter fees paid by student.."
            onChange={handleAddFormChange}
            style={{ padding: "10px", margin: "10px" }}
          />
          <input
            type="number"
            name="mahadbt1"
            required="required"
            placeholder="Enter  mahadbt installation 1..."
            onChange={handleAddFormChange}
            style={{ padding: "10px", margin: "10px" }}
          />
          <input
            type="number"
            name="mahadbt2"
            required="required"
            placeholder="Enter mahadbt installation 2..."
            onChange={handleAddFormChange}
            style={{ padding: "10px", margin: "10px" }}
          />
        </div>
        <div style={{ display: "flex", flexDirection: "row" }}>
          <input
            type="number"
            name="balance"
            required="required"
            placeholder="Enter balance..."
            onChange={handleAddFormChange}
            style={{ padding: "10px", margin: "10px" }}
          />
          <input
            type="number"
            name="balance"
            required="required"
            placeholder="Enter balance..."
            onChange={handleAddFormChange}
            style={{ padding: "10px", margin: "10px" }}
          />
          <Grid xs={12} sm={6} item style={{ padding: "10px", margin: "10px" }}>
            <label style={{ fontSize: "20px", marginLeft: "15px" }}>
              Type
              <br />
              <select
                style={{
                  fontSize: "15px",
                  marginLeft: "15px",
                  height: "40px",
                }}
                value={addFormData.status}
                onChange={handleAddFormChange}
              >
                <option value="Approved">Approved</option>
                <option value="Rejected">Rejected</option>
              </select>
            </label>
          </Grid>
        </div>
        <div
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            marginLeft:'35%'
          }}
        >
          <button type="submit">Add</button>
        </div>
      </form>
    </div>
  );
};

export default TableStudent;
