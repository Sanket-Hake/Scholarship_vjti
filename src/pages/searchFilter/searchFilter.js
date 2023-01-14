import React, { useEffect, useState } from "react";
import { collection, onSnapshot } from "firebase/firestore";
import { db } from "../../firebase";
const SearchFilter = () => {
  const [data, setData] = useState([]);
  const [filterValue, setFilterValue] = useState("");
  const [searchApiData, setSeachApiData] = useState("");
  useEffect(() => {
    // LISTEN (REALTIME)
    const unsub = onSnapshot(
      collection(db, "Users"),
      (snapShot) => {
        let list = [];
        snapShot.docs.forEach((doc) => {
          list.push({ id: doc.id, ...doc.data() });
        });
        const da = JSON.stringify(list);
        setData(list);
        setSeachApiData(da);
      },
      (error) => {
        console.log(error);
      }
    );

    return () => {
      unsub();
    };
  }, []);

  const handleFilter = (e) => {
    if (e.target.value === "") {
      setData(searchApiData);
    } else {
      const filterResult = setData.filter((item) =>
        item.Name.toLoweCase().includes(e.target.value.toLoweCase)
      );
      if(filterResult.length > 0) {
        setData(filterResult);
      }
      else{
        setData([{"name":"No Data"}])
      }
    }
    setFilterValue(e.target.value);
  };
  return (
    <div style={{ marginTop: "20px" }}>
      <div>
        <input
          placeholder="Search"
          value={filterValue}
          onInput={(e) => handleFilter(e)}
        />
      </div>
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile No.</th>
            <th>Department</th>
            <th>Branch</th>
            <th>Income</th>
          </tr>
        </thead>
        <tbody>
          {/* <th>Action</th> */}
          {data.map((item,index) => {
            return (
              <tr key={index}>
                <td>{item.Name}</td>
                <td>{item.Email}</td>
                <td>{item.Mobile_No}</td>
                <td>{item.Department}</td>
                <td>{item.Branch}</td>
                <td>{item.Income}</td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
};

export default SearchFilter;
