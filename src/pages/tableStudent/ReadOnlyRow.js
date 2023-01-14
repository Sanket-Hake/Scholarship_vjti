import React from "react";

const ReadOnlyRow = ({ contact, handleEditClick, handleDeleteClick }) => {
  return (
    <tr>
      <td>{contact.regno}</td>
      <td>{contact.year}</td>
      <td>{contact.total}</td>
      <td>{contact.feestu}</td>
      <td>{contact.mahadbt1}</td>
      <td>{contact.mahadbt2}</td>
      <td>{contact.balance}</td>
      <td>{contact.status}</td>
      <td>
        <button
          type="button"
          onClick={(event) => handleEditClick(event, contact)}
        >
          Edit
        </button>
        <button type="button" onClick={() => handleDeleteClick(contact.id)}>
          Delete
        </button>
      </td>
    </tr>
  );
};

export default ReadOnlyRow;
