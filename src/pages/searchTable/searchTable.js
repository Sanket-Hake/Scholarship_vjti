import React, { useState,useEffect } from 'react';
import { collection, onSnapshot } from "firebase/firestore";
import { db } from "../../firebase";
function SearchTable() {
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
            setData(list);
            // console.log(data[0].id)
            console.log(list[0].id);
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
  const [contacts, setContacts] = useState(data);
  const [search, setSearch] = useState('');

  // const sortName = () => {
  //   setContacts(
  //     data.sort((a, b) => {
  //       return a.first_name.toLowerCase() < a.first_name.toLowerCase()
  //         ? -1
  //         : a.first_name.toLowerCase() > a.first_name.toLowerCase()
  //         ? 1
  //         : 0;
  //     })
  //   );
  // };

  return (
    <div>
      <div>
        <h1 className='text-center mt-4'>Contact Keeper</h1>
            <input
            type="search"
              onChange={(e) => setSearch(e.target.value)}
              placeholder='Search contacts'
            />
        <table>
          <thead>
            <tr>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Email</th>
              <th>Phone</th>
            </tr>
          </thead>
          <tbody>
            {data
              .filter((item) => {
                return search.toLowerCase() === ''
                  ? item
                  : item.Name.includes(search);
              })
              .map((item, index) => (
                <tr key={index}>
                  <td>{item.Branch}</td>
                  <td>{item.Name}</td>
                  <td>{item.Email}</td>
                  <td>{item.Mobile_No}</td>
                </tr>
              ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default SearchTable;