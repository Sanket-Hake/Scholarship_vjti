import React from "react";


const EditableRow = ({
  editFormData,
  handleEditFormChange,
  handleCancelClick,
}) => {
  return (
    <tr>
      <td>
        <input
          type="number"
          name="regno"
          required="required"
          placeholder="Enter reg no..."
          value={editFormData.regno}
          onChange={handleEditFormChange}
        />
        </td>
        <td>
        <input
          type="text"
          name="year"
          required="required"
          placeholder="Enter year..."
          value={editFormData.year}
          onChange={handleEditFormChange}
        />
        </td>
      <td>
        <input
          type="number"
          name="total"
          required="required"
          placeholder="Enter total fees..."
          value={editFormData.total}
          onChange={handleEditFormChange}
        />
        </td>
        <td>
        <input
          type="number"
          name="feestu"
          required="required"
          placeholder="Enter fees paid by student.."
          value={editFormData.feestu}
          onChange={handleEditFormChange}
        />
      </td>
      <td>
        <input
          type="number"
          name="mahadbt1"
          required="required"
          placeholder="Enter mahadbt installation 1..."
          onChange={handleEditFormChange}
          value={editFormData.mahadbt1}
        />
      </td>
      <td>
        <input
          type="number"
          name="mahadbt2"
          required="required"
          placeholder="Enter mahadbt installation 2..."
          onChange={handleEditFormChange}
          value={editFormData.mahadbt2}
        />
      </td>
      <td>
        <input
          type="number"
          name="balance"
          required="required"
          placeholder="Enter balance..."
          onChange={handleEditFormChange}
          value={editFormData.balance}
        />
      </td>
      <td>
        <button type="submit">Save</button>
        <button type="button" onClick={handleCancelClick}>
          Cancel
        </button>
      </td>
    </tr>
  );
};

export default EditableRow;
