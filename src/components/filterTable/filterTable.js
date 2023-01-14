import { useEffect, useMemo, useState } from "react";
import "./filterTable.css";

import {
  createColumnHelper,
  flexRender,
  getCoreRowModel,
  getFilteredRowModel,
  useReactTable
} from "@tanstack/react-table";

const defaultData = [
  {
    firstName: "tanner",
    lastName: "linsley",
    age: 24,
    visits: 100,
    status: "In Relationship",
    progress: 50
  },
  {
    firstName: "tandy",
    lastName: "miller",
    age: 40,
    visits: 40,
    status: "Single",
    progress: 80
  },
  {
    firstName: "joe",
    lastName: "dirte",
    age: 45,
    visits: 20,
    status: "Complicated",
    progress: 10
  }
];

const columnHelper = createColumnHelper();

const columns = [
  columnHelper.accessor("firstName", {
    header: "First Name"
  }),
  columnHelper.accessor((row) => row.lastName, {
    header: "Last Name"
  }),
  columnHelper.accessor("age", {
    header: "Age",
    filterFn: (row, _columnId, value) => {
      return row.original.age === +value;
    }
  }),
  columnHelper.accessor("visits", {
    header: "Visits",
    filterFn: (row, _columnId, value) => {
      return row.original.visits === +value;
    }
  }),
  columnHelper.accessor("status", {
    header: "Status"
  }),
  columnHelper.accessor("progress", {
    header: "Profile Progress",
    filterFn: (row, _columnId, value) => {
      return row.original.progress === +value;
    }
  })
];

const FilterTable=()=> {
  const [data] = useState(() => [...defaultData]);
  const [field, setField] = useState();
  const [searchValue, setSearchValue] = useState("");
  const [columnFilters, setColumnFilters] = useState();

  const table = useReactTable({
    data,
    columns,
    enableFilters: true,
    enableColumnFilters: true,
    getCoreRowModel: getCoreRowModel(),
    getFilteredRowModel: getFilteredRowModel(),
    state: {
      columnFilters
    },
    onColumnFiltersChange: setColumnFilters
  });

  const filteringColumn = useMemo(() => {
    return table.getAllColumns().filter((col) => col.id === field)[0];
  }, [field, table]);

  useEffect(() => {
    if (filteringColumn) {
      filteringColumn.setFilterValue(searchValue);
    }
  }, [filteringColumn, searchValue]);

  const handleSelectChange = (e) => {
    setColumnFilters([]);
    setSearchValue("");
    setField(e.target.value);
  };

  const handleInputChange = (e) => {
    setSearchValue(e.target.value);
  };

  return (
    <div className="p-2">
      Filter By:{" "}
      <select value={field} onChange={handleSelectChange}>
        <option value="">Select Field</option>
        {table.getAllLeafColumns().map((column, index) => {
          return (
            <option value={column.id} key={index}>
              {column.columnDef.header}
            </option>
          );
        })}
      </select>{" "}
      <input
        value={searchValue}
        onChange={handleInputChange}
        className="p-2 font-lg shadow border border-block"
        placeholder={
          field ? `Search ${field} column...` : "Please select a field"
        }
      />
      <table>
        <thead>
          {table.getHeaderGroups().map((headerGroup) => (
            <tr key={headerGroup.id}>
              {headerGroup.headers.map((header) => (
                <th key={header.id}>
                  {header.isPlaceholder
                    ? null
                    : flexRender(
                        header.column.columnDef.header,
                        header.getContext()
                      )}
                </th>
              ))}
            </tr>
          ))}
        </thead>
        <tbody>
          {table.getRowModel().rows.map((row) => (
            <tr key={row.id}>
              {row.getVisibleCells().map((cell) => (
                <td key={cell.id}>
                  {flexRender(cell.column.columnDef.cell, cell.getContext())}
                </td>
              ))}
            </tr>
          ))}
          {table.getRowModel().rows.length === 0 && <tr> No data found </tr>}
        </tbody>
      </table>
    </div>
  );
}

export default FilterTable;